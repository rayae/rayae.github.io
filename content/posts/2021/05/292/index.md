---
title: "宝塔中部署 WAR 包后静态资源 404 问题"
categories: [ "代码笔记" ]
tags: []
draft: false
slug: "292"
date: "2021-05-22T16:30:12.000000"
---

解决宝塔中部署 WAR 包后静态资源 404 问题
关联：Ngnix 反向代理 Tomcat 404

解决办法修改 ngnix 配置文件
```conf
    location /
    {
        proxy_pass "http://liteblog.bavelee.cn:8080";
        proxy_set_header Host liteblog.bavelee.cn;
        proxy_set_header X-Forwarded-For $remote_addr;
    }
    # 增加下面这一段 location 即可，
    location ~ .* {
        proxy_pass "http://liteblog.bavelee.cn:8080";
        proxy_set_header Host liteblog.bavelee.cn;
        proxy_set_header X-Forwarded-For $remote_addr;
    }
```

注：仅保留 `localtion /` 和 `location ~ .*`，其他的可以删掉
