---
title: "macOS 下配置安装配置清华源的 Homebrew"
categories: [ "资源分享","macOS" ]
tags: []
draft: false
slug: "242"
date: "2020-03-26T10:13:56.000000"
---

# macOS 下配置安装配置清华源的 Homebrew

## 1. 要先安装官方源的 Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## 2. 替换 brew 程序上游地址
```bash
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
```

## 3. 安装 Homebrew cask 并替换上游地址
```bash
brew tap homebrew/homebrew-cask
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
```

## 4. 检查是否成功
执行
```bash
brew config
```

结果
```bash
HOMEBREW_VERSION: 2.2.11
ORIGIN: https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
HEAD: fa8fe0fc396550c23156043cd07550fc6ae6a27a
Last commit: 2 days ago
Core tap ORIGIN: https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
Core tap HEAD: f3a8769e6ae498ae98a46abf8b5d01647c133efb
Core tap last commit: 2 hours ago
HOMEBREW_PREFIX: /usr/local
CPU: hexa-core 64-bit kabylake
Homebrew Ruby: 2.6.3 => /System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/bin/ruby
Clang: 11.0 build 1103
Git: 2.24.1 => /Library/Developer/CommandLineTools/usr/bin/git
Curl: 7.64.1 => /usr/bin/curl
macOS: 10.15.3-x86_64
CLT: 11.4.0.0.1.1583798712
Xcode: 11.4
```
