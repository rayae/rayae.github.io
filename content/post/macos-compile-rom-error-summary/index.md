---
title: "macOS 下编译 ROM 错误汇总(持续更新)"
categories: [ "代码笔记" ]
tags: [  ]
draft: false
slug: "macos-compile-rom-error-summary"
date: "2019-09-24T09:31:50+08:00"
---


1. 编译时没有使用 macOS 系统自带 stat 的报错 
```
stat '%s', no suck file or directory
```
原因是安装了brew的gnu stat，而build使用的是macOS的stat，所以需要设置绝对路径
修改`build/core/combo/HOST_drawin-x86`
将原本的
```
define get-file-size
stat -f "%z" $(1)
endef
```
替换为
```
define get-file-size
/usr/bin/stat -f "%z" $(1)
endef
```