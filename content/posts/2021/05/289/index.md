---
title: "破解极域电子教室和联想智能云教室客户端"
categories: [ "资源分享" ]
tags: []
draft: false
slug: "289"
date: "2021-05-08T08:21:32.000000"
---

需要自行下载 `ntsd.exe` 文件放到 `C:\Windows\System32` 下面
# 极域电子教室
## 1. 防火墙拦截网络请求 (CMD中运行)
- *拦截命令*
```dos
netsh advfirewall set allprofiles state on
netsh advfirewall firewall set rule name="StudentMain.exe" new enable=no
```

- *放行命令*
```dos
netsh advfirewall set allprofiles state off
netsh advfirewall firewall set rule name="StudentMain.exe" new enable=yes
```

## 2. 杀死进程 (CMD中运行)
```dos
ntsd.exe -c q -pn StudentMain.exe
```

# 联想智能云教室客户端
这个联想智能云教室客户端占用了很多快捷键，比如 `Ctrl + W`,受不了,杀进程后会重启，遂删除文件

```dos
ntsd.exe -c q -pn DeploymentAgent.exe
taskkill /F /IM PortControl64.exe
ntsd.exe -c q -pn tvnserver32.exe
ntsd.exe -c q -pn WFBSMlogon.exe
ntsd.exe -c q -pn XYNTService.exe
attrib -r "C:\Program Files (x86)\Lenovo\联想智能云教室客户端\*"
del /f /s /q "C:\Program Files (x86)\Lenovo\联想智能云教室客户端"
```

