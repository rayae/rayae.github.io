---
title: "程序设置代理大全(持续更新中)"
categories: [ "代码笔记" ]
tags: []
draft: false
slug: "proxylist"
date: "2021-06-04T08:35:15.000000"
---

注意：若在 `WSL/WSL2` 或虚拟机中使用，需要查看主机的虚拟网卡例如 `vEthernet (WSL)` 的IP地址，而不是直接使用`127.0.0.1`，以下主机地址都以 `127.0.0.1` 代替

# Linux 终端代理
```bash
# 设置 http/https 代理
export http_proxy=http://127.0.0.1:1024
export https_proxy=$http_proxy

设置 socks5 代理
export http_proxy=socks://127.0.0.1:1024
export https_proxy=$http_proxy
```
# Windows CMD 代理
```bat
# 设置 http/https 代理
set http_proxy=http://127.0.0.1:1080
set https_proxy=http://127.0.0.1:1080

设置 socks5 代理
set http_proxy=socks5://127.0.0.1:1080
set https_proxy=socks5://127.0.0.1:1080
```

# Git 命令代理
## 命令行中配置
```bash
# 设置 http/https 代理
git config --global https.proxy http://127.0.0.1:1080
git config --global https.proxy https://127.0.0.1:1080

# 设置 socks5 代理
git config --global http.proxy socks5://127.0.0.1:1080
git config --global https.proxy socks5://127.0.0.1:1080

# 清除代理
git config --global --unset http.proxy
git config --global --unset https.proxy
```
## ~/.gitconfig 文件
```conf
[http]
        proxy = socks5://172.26.0.1:1117
[https]
        proxy = socks5://172.26.0.1:1117
```
# Curl 命令代理
## 命令行中配置
```bash
# 设置 socks5 代理, -x 等价于 --proxy
curl -x socks5://127.0.0.1:1080 http://www.google.com
# 设置 http/https 代理
curl -x http://127.0.0.1:1080 http://www.google.com
```
