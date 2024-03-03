---
title: "宜春学院 校园网 Web 认证破解 路由器 openwrt"
categories: [ "Linux","代码笔记" ]
tags: [ None ]
draft: false
slug: "ycxyxywcrack"
date: "2020-09-05T10:46:00.000000"
---

# Yichun University 校园网 Web 认证破解
分析文章请参考：[参考文章][1]
感谢上述链接博主的付出

## 需要注意的地方
 1. http请求需要提供UA，否则服务器无响应
 2. 具体的请求参数请自行抓包
 3. 不提供帮助，此文章仅作本人的存档
 4. 本篇文章不会回复任何问题

## 有几个关键的 URL
 1. Login 登录 ： `http://10.0.11.5/eportal/InterFace.do?method=login`
  需要3个由客户端提供的POST参数 : `userId` `password` `queryString` , `queryString` 的获取看上面链接的文章，获取原理类似，需要保存登录成功后返回的 `userIndex`
 2. 获取 queryString : `http://10.0.11.5`
  退出登录后才能获取，无需参数
 3. Logout 退出登录 : `http://10.0.11.5/eportal/InterFace.do?method=logoutByUserIdAndPass`
  需要2个由客户端提供的POST参数 : `userId` `pass` , 注意此处不是 `password`
 4. 保活 keepalive : `http://10.0.11.5/eportal/InterFace.do?method=keepalive`
  每隔一段时间汇报一次，以免被踢下线，需要提供登录后返回的 `userIndex` 作为参数

## 认证程序源码
[Github][2]

## 部署到 OpenWRT
### `epact` 文件安装到 `/usr/bin`，权限 `755`
### 开机自启进行Web认证
增加文件 : `/etc/init.d/epact-init`
打开开机自启 : `/etc/init.d/epact-init enable`

epact-init:
```shell
#!/bin/sh /etc/rc.common
START=99
user=校园网用户名
pwd=校园网密码
start(){
	epact $user $pwd start &
}
stop(){
	killall epact
}
restart(){
	stop
	start
}

```

### 每隔2分钟检测时候有网络，否则进行重新进行 Web 认证
OP后台计划任务增加一行 : `*/2 * * * * /usr/brecon.sh`
增加文件 : `/usr/brecon.sh`

```shell
#!/bin/sh

# 无网络时进行重新连接
on_network_not_available(){
echo Network not available $(date +%s) >> /tmp/brecon.log
/etc/init.d/epact-init restart
check_status 1
}

check_network(){
captiveReturnCode=`curl -s -I -m 10 -o /dev/null -s -w %{http_code} http://www.google.cn/generate_204`
if [ "$captiveReturnCode" = "204" ]; then
  return 0
fi
return 1
}
check_status(){
if check_network                                       
then                                                   
        echo -e "[\033[32m成功\033[0m]"
else                                      
        echo -e "[\033[31m失败\033[0m]"
        [[ -z $1 ]] && on_network_not_available
fi
}

echo -n "检测网络是否畅通..."
check_status
```
上述文件都可以在提供的 Github 仓库中下载到
### crontab 计划任务
周一到周四11点关闭WIFI(平日11点断网)，周日12点关闭WIFI(周日12点断网)，其他时候不关闭WIFI，每日6点58分开启WIFI，每日6点59分重启路由器(断网后次日7点来网)

```shell
*/2 * * * * /usr/brecon.sh
00 23 * * 1,2,3,4 mtkwifi down
00 00 * * 0 mtkwifi down
58 6 * * * mtkwifi up
59 5 * * * sleep 5 && touch /etc/banner && reboot
```

  [1]: https://blog.csdn.net/liberal_wind/article/details/89882777?utm_medium=distribute.wap_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-8.nonecase&depth_1-utm_source=distribute.wap_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-8.nonecase
  [2]: https://github.com/bavelee/ePortalActivator
