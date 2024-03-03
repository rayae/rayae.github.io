---
title: "Windows 登录出现A1B2C3解决办法"
categories: [ "代码笔记" ]
tags: []
draft: false
slug: "354"
date: "2023-02-16T08:55:16.000000"
---

1. 执行下列命令删除 `C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc`
```powershell
powershell -windowstyle hidden -command "Start-Process cmd -ArgumentList '/s,/c,takeown /f C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\NGC /r /d y & icacls C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\NGC /grant administrators:F /t & RD /S /Q C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc & MD C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc & icacls C:\Windows\ServiceProfiles\LocalService\AppData\Local\Microsoft\Ngc /T /Q /C /RESET' -Verb runAs"
```
2. 重设PIN
