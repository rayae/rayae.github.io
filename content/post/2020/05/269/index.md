---
title: "macOS 下安装节点测速工具"
categories: [ "macOS" ]
tags: [ None ]
draft: false
slug: "269"
date: "2020-05-02T23:11:00.000000"
---

# macOS 下安装节点测速工具
项目地址：[SSRSpeed](https://github.com/NyanChanMeow/SSRSpeed)


### clone 仓库到本地
```shell
git clone https://github.com/NyanChanMeow/SSRSpeed.git
cd SSRSpeed
```
### 安装依赖库
```shell
brew install libsodium shadowsocks-libev simple-obfs
```
### 安装 v2ray-core 主程序
```shell
wget https://github.com/v2ray/v2ray-core/releases/download/v4.23.1/v2ray-macos.zip
unzip v2ray-macos.zip -d clients/v2ray-core/
```
### 安装 python3 依赖库
```shell
pip3 install -r requirements.txt

```
### 跳过插件检查运行
因为项目中提到 macOS 下无法检测 libsodium
```shell
python3 main.py --skip-requirements-check -c /path/to/your/config.json
```
