---
title: "macOS 下常用命令"
categories: [ "macOS" ]
tags: []
draft: false
slug: "111"
date: "2019-05-01T15:55:00.000000"
---

#### 重建 Kexts 缓存命令
```bash
sudo rm /System/Library/PrelinkedKernels/prelinkedkernel
sudo rm /System/Library/Caches/com.apple.kext.caches/Startup/kernelcache
sudo chmod -R 755 /System/Library/Extensions
sudo chmod -R 755 /Library/Extensions
sudo chown -R root:wheel /System/Library/Extensions
sudo chown -R root:wheel /Library/Extensions
sudo touch /System/Library/Extensions
sudo touch /Library/Extensions
sudo kextcache -q -update-volume /
sudo kextcache -system-caches
sudo kextcache -i /
```

#### 允许安装任何来源软件
```bash
sudo spctl --master-disable
```

#### Finder 显示隐藏文件
```bash
defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder
```

#### 设置界面去除数字小红点
```bash
defaults write com.apple.systempreferences AttentionPrefBundleIDs 0
```

### 挂载 EFI 分区
```bash
dev=$(diskutil list|grep "1:                        EFI"|grep EFI|awk '{print $6}')
echo 'password'|sudo -S mount -t msdos /dev/$dev /Volumes/EFI
```

### 取消4位数密码限制
```bash
pwpolicy -clearaccountpolicies
```

### 开启HIDPI
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/xzhih/one-key-hidpi/master/hidpi.sh)"
```
### 睡眠优化代码
```bash
sudo pmset -a hibernatemode 0
sudo rm -rf /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a proximitywake 0
```

### Catalina挂载系统分区
```bash
sudo -S mount -uw / && killall Finder
```

### 查看睡眠时间
```bash
sysctl -a |grep sleeptime
```

### 查看睡眠唤醒时间
```bash
sysctl -a |grep waketime
```

### 查看最近24小时睡眠唤醒原因
```bash
log show --last 24h | grep "Wake reason"
```

### 查看睡眠唤醒详情
```bash
pmset -g log | grep -Ei 'wake.*due'
```

