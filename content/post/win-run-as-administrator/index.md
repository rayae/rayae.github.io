---
title: "Windows 按住Win + R 以管理员身份运行"
categories: [ "代码笔记" ]
tags: [  ]
draft: false
slug: "win-run-as-administrator"
date: "2019-04-29T18:53:21+08:00"
---

**Windows 按住Win + R 以管理员身份运行**

打开 `控制面板`
选择 `查看方式` -> `大图标`
打开 `管理工具`
打开 `本地安全策略`
展开 `安全设置` -> `本地策略` -> `安全选项`
找到 `用户账户控制:以管理员批准模式运行所有管理员`
设置为`禁用`
最后 `重启电脑`
