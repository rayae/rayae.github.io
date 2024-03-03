---
title: "记一次 Ngnix 部署 Springboot + Vue 项目"
categories: [ "代码笔记","Linux" ]
tags: [ None ]
draft: false
slug: "300"
date: "2021-07-30T15:23:40.000000"
---

## 记一次 Nginx 部署 Springboot + Vue 项目

---

#### Springboot 项目

`Springboot` 项目在服务器上运行在`Tomcat`容器中`http://localhost:8555`, ContextPath为`/`

在服务器的`shell`中通过 `curl http://localhost:8555/` 可正常访问

#### Vue 项目

在宝塔中创建新的网站，域名设置为`xxx.bavelee.cn` ，然后把 Vue 项目 build 后的 dist 中的文件放到 `/www/wwwroot/xxx.bavelee.cn`

部署命令

```bash
# 上传文件到服务器
scp 本地Vue项目/dist/* 服务器用户名@服务器IP:/www/wwwroot/xxx.bavelee.cn/
# 设置权限，使ngnix可以访问
ssh 服务器用户名@服务器IP chown -R www.www /www/wwwroot/xxx.bavelee.cn/
```

然后访问`http://xxx.bavelee.cn` 可正常打开页面，但是所有的接口都请求失败，我在 `axios`中配置的`baseUrl`为`/api`，所有的请求格式都类似于`/api/getData` 同等与 => `http://xxx.bavelee.cn/api/getData`，但是我的后端接口是运行在`http://localhost:8555`的，所以我这里要设置反向代理，通过 **Nginx 反向代理** 将访问`/api`和`/upload`的URL代理到`http://localhost:8555`上

**添加反向代理**

![image-20210730151826029.png][1]

**添加之后修改他的配置文件**

```
#PROXY-START/api
location /api
{
    proxy_pass http://localhost:8555;
    proxy_set_header Host localhost;
}
#PROXY-END/api
#PROXY-START/upload
location /upload
{
    proxy_pass http://localhost:8555/upload;
    proxy_set_header Host localhost;
}
#PROXY-END/upload

```



前端项目为单项目多页面：分为如下三个页面`blog`、`login`、`admin`，需要设置 3 个`location`

**nginx配置文件**

```
location / {
	try_files $uri $uri/ /index.html;
}
location ^~/admin
{
	try_files $uri $uri/ /admin.html;
}
location ^~/login
{
	try_files $uri $uri/ /login.html;
}
```

到此配置完成


  [1]: images/2890963176.png
