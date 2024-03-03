---
title: "macOS 下 iTerm2 全局使用代理"
categories: [ "脚本","macOS" ]
tags: []
draft: false
slug: "132"
date: "2019-09-22T11:05:08.000000"
---

突然发现在** iTerm2** 下配置了 **proxychains4**，有部分链还是不会走代理运行。
比如：git
git的http协议会走代理运行，但是git@的ssh链接不会走代理

需要修改如下：
**终端运行**
```bash
git config --global http.proxy 'socks5://127.0.0.1:1086'
git config --global https.proxy 'socks5://127.0.0.1:1086'
```
**修改文件**
```
Host github.com bitbucket.org
    ProxyCommand            nc -x 127.0.0.1:1086 %h %p
```
