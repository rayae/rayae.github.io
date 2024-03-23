---
title: "macOS 下安装 Microsoft Office 并激活的正确流程"
categories: [ "macOS","资源分享" ]
tags: []
draft: false
slug: "osx86office"
date: "2020-03-12T22:34:00.000000"
---

###  安装前执行清洁安装，先删除原先安装数据，否则会导致激活不成功并且一直提示登录

### 0. 先卸载 Office，然后重启

```bash
#!/bin/bash

sudo rm -rf /Applications/Microsoft\ Excel.app
sudo rm -rf /Applications/Microsoft\ OneNote.app
sudo rm -rf /Applications/Microsoft\ Outlook.app
sudo rm -rf /Applications/Microsoft\ PowerPoint.app
sudo rm -rf /Applications/Microsoft\ Word.app
sudo rm -rf /Applications/OneDrive.app

sudo rm -rf ~/Library/Group\ Containers/UBF8T346G9*

sudo rm -rf ~/Library/Containers/com.microsoft.errorreporting
sudo rm -rf ~/Library/Containers/com.microsoft.Excel
sudo rm -rf ~/Library/Containers/com.microsoft.netlib.shipassertprocess
sudo rm -rf ~/Library/Containers/com.microsoft.Office365ServiceV2
sudo rm -rf ~/Library/Containers/com.microsoft.Outlook
sudo rm -rf ~/Library/Containers/com.microsoft.Powerpoint
sudo rm -rf ~/Library/Containers/com.microsoft.RMS-XPCService
sudo rm -rf ~/Library/Containers/com.microsoft.Word
sudo rm -rf ~/Library/Containers/com.microsoft.onenote.mac
```
### 1. 下载并运行官方的
[Microsoft_Office_License_Removal.pkg](https://go.microsoft.com/fwlink/?linkid=849815)

### 2. 下载并安装(但是先不要打开)官方版本的 Office套 
[Microsoft_Office_16.19.18110915_Installer.pkg](https://officecdn.microsoft.com/pr/C1297A47-86C4-4C1F-97FA-950631F94777/OfficeMac/Microsoft_Office_16.19.18110915_Installer.pkg)

### 3. 禁用 `com.microsoft.office.licensingV2.helper`，如果你启用了的话
![Snipaste_2020-03-12_22-45-16.png](images/3816373607.png)

### 4. 下载并运行激活工具(激活后不要打开)
[Microsoft_Office_2019_VL_Serializer.pkg](https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a/raw/Microsoft_Office_2019_VL_Serializer.pkg)

### 5. 重新启用 `com.microsoft.office.licensingV2.helper`

### 6.打开后已激活


参考文章：[https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a](https://gist.github.com/zthxxx/9ddc171d00df98cbf8b4b0d8469ce90a)
