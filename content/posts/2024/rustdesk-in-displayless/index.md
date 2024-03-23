---
title: 'Rustdesk Linux 下显示 NO Display 的解决办法'
categories: ["Linux"]
tags: ["rustdesk", "xvfb", "rdp"]
draft: false
date: 2024-03-05T22:48:57+08:00
---
## 问题描述
使用 Rustdesk 连接到未连接显示器的 Linux 主机时，提示NO Display

## 解决办法
1. 某宝购买 HDMI 诱骗器
2. 虚拟屏幕（本文采用方案）

## 安装 X11 的虚拟屏幕
```bash
sudo apt intall -y xvfb
```

## Intel 核显执行
```bash
# 非 Intel 将 Driver: "intel" 换成 "dummy"
sudo tee /etc/X11/xorg.conf.d/20-virtual-display.conf << EOF

Section "Monitor"
  Identifier "VirtualMonitor0"
  HorizSync 28.0-80.0
  VertRefresh 48.0-75.0
  # 1920x1080 @ 60.00 Hz (GTF) hsync: 67.08 kHz; pclk: 172.80 MHz
  Modeline "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync
  Option "Enable" "true"
  Option "PreferredMode" "1920x1080_60.00"
EndSection

Section "Device"
    Identifier "Card0"
    Driver "intel"
    Option "VirtualHeads" "1"
    Option "Monitor-VIRTUAL1" "VirtualMonitor0"
EndSection

Section "Screen"
  DefaultDepth 24
  Identifier "VirtualScreen0"
  Device "Card0"
  Monitor "VirtualMonitor0"
  SubSection "Display"
    Depth 24
    Modes "1920x1080_60.00"
  EndSubSection
EndSection
EOF
```



## 重启 display-manager
```bash
sudo systemctl restart display-manager
```

## 查询显示器信息
> 此时多出了一个 VIRTUAL1 的显示器
```bash
$ xrandr --display :0 --listmonitors
Monitors: 1
 0: +VIRTUAL1 1920/508x1080/286+1920+0  VIRTUAL1
```



## 增加其他分辨率的模式

- 增加一个 1440x900 刷新率30HZ 的模式
```bash
$ gtf 1440 900 30

  # 1440x900 @ 30.00 Hz (GTF) hsync: 27.48 kHz; pclk: 48.80 MHz
  Modeline "1440x900_30.00"  48.80  1440 1464 1608 1776  900 901 904 916  -HSync +Vsync

$ xrandr --display :0 --newmode "1440x900_30.00"  48.80  1440 1464 1608 1776  900 901 904 916  -HSync +Vsync
$ xrandr --display :0 --addmode VIRTUAL1 "1440x900_30.00"
$ xrandr --display :0 --output VIRTUAL1 --mode "1440x900_30.00"
```

- 也可以将输出的内容追加到 `/etc/X11/xorg.conf.d/20-virtual-display.conf` 的 Modeline 下面进行保存

