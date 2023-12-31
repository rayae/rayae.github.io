---
title: "linux 中的 crontab 计划任务，适用于OpenWrt"
categories: [ "代码笔记" ]
tags: [  ]
draft: false
slug: "linux-crontab-schedule-tasks-for-openwrt"
date: "2019-12-28T11:35:00+08:00"
---

### 解释一下它的含义

```
*    *    *    *    *
-    -    -    -    -
|    |    |    |    |
|    |    |    |    +----- 每周的第几天 用(0 - 7) (Sunday=0 or 7) 或者 sun,mon,tue,wed,thu,fri,sat
|    |    |    +---------- 每年的第几月 (1 - 12) 或者 jan,feb,mar,apr ...
|    |    +--------------- 每个月的第几天 (1 - 31)
|    +-------------------- 小时 (0 - 23)
+------------------------- 分钟 (0 - 59)
```

### 举几个例子

- **`周六、周一、周二、周三、周四`** 的 **`23:30`** 执行 **`/root/set_abc.sh`**
```
30 23 * * 0,1,2,3,4 /root/set_abc.sh.
```
- **`每天`** 的 **`06:15`** 执行 **`/root/set_xyz.sh`**
```
15 6 * * * /root/set_xyz.sh
```
- **`每天`** 每隔 **`5分钟`** 执行 **`/root/brecon.sh`**
```
*/5 * * * * /etc/brecon.sh
```

### 周一到周四晚上11点关闭Wifi
```
00 23 * * 1,2,3,4 mtkwifi down
```

### 周日晚上12点关闭Wifi
```
00 00 * * 0 mtkwifi down
```
### 每天6点59开启WIFI
```
59 6 * * * mtkwifi up
```
### 每天7:00重启路由器
```
00 7 * * * reboot
```

