---
title: "Windows 11 干掉 Defender 的真正姿势"
categories: [ "小技巧" ]
tags: [ None ]
draft: false
slug: "kill-defender"
date: "2022-06-05T09:51:13.000000"
---

PE 环境下，打开Dism++, 在【系统优化】-【导入配置】- 选择 【禁用Windows Defender.reg】

注：非PE环境下无权限导入此注册表

[禁用Windows Defender.rar](images/3306554167.rar)

```plaintext
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SecurityHealthService]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SecurityHealthService]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Security Center\Feature]
"DisableAvCheck"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender]
"DisableAntiSpyware"=dword:00000001
"DisableRoutinelyTakingAction"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection] 
"DisableAntiSpywareRealtimeProtection"=dword:00000001
"DisableRealtimeMonitoring"=dword:00000001
"DisableBehaviorMonitoring"=dword:00000001
"DisableIOAVProtection"=dword:00000001
"DisableOnAccessProtection"=dword:00000001

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender Security Center\Account protection]
"DisableNotifications"=dword:00000001 

[HKEY_CURRENT_USER\Software\Microsoft\Windows Defender Security Center\Account protection]
"DisableNotifications"=dword:00000001 

[HKEY_LOCAL_MACHINE\System\ControlSet001\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet002\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WinDefend]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet001\Services\WdBoot]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet002\Services\WdBoot]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdBoot]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet001\Services\WdFilter]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet002\Services\WdFilter]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdFilter]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet001\Services\WdNisDrv]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet002\Services\WdNisDrv]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisDrv]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet001\Services\WdNisSvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\ControlSet002\Services\WdNisSvc]
"Start"=dword:00000004

[HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\WdNisSvc]
"Start"=dword:00000004
```

