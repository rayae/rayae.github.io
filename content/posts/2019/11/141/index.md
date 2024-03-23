---
title: "Windows 使用批处理设置静态IP或DHCP"
categories: [ "脚本" ]
tags: []
draft: false
slug: "141"
date: "2019-11-05T19:04:00.000000"
---

1. 设置为静态IP

```bat
@echo off
SET ip=10.0.83.48
SET mask=255.255.255.0
SET gateway=10.0.83.126
SET dns=202.101.224.68
SET interface="以太网"
netsh interface ip set address %interface% static %ip% %mask% %gateway% 1
netsh interface ip set dns %interface% static %dns% register=PRIMARY validate=no
echo == 网卡属性已设置 ==
echo IP 地址   : %ip%
echo 子网掩码  : %mask%
echo 网关      : %gateway%
echo DNS       : %dns%
pause
```
2. 设置为DHCP动态获取

```bat
@echo off
SET interface="以太网"
netsh interface ip set address %interface% dhcp
netsh interface ip set dns %interface% dhcp
echo == 网卡属性已设置 ==
echo IP 地址   : DHCP 自动获取
echo 子网掩码  : DHCP 自动获取
echo 网关      : DHCP 自动获取
echo DNS       : DHCP 自动获取
pause
```
