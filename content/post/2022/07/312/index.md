---
title: "如何在Windows下获得类Unix的终端体验"
categories: [ "Linux","小技巧" ]
tags: [ None ]
draft: false
slug: "312"
date: "2022-07-03T21:58:00.000000"
---

作为一个程序员，时常需要通过编写Shell脚本、或者是通过alias的方式来提升工作效率。当然不是每一个程序员都能有足够的资本去购买一个MacBook来获得Unix下的体验；也不是每一个人都可以放弃Windows环境拥抱Linux的生态；再者即使通过虚拟机也不能够获得一个较为“完美”的Linux体验。

## 简单介绍
#### 终端模拟器
工欲善其事必先利其器，想在Windows获得类Unix的终端体验，首要的就是需要一个终端模拟器。巨硬则开源了一款适用于Windows10全版本的终端模拟器：Windows Terminal。并在Windows11下已成为内置的终端软件，可以直接在微软商店中下载安装，亦可以在Github中下载独立的安装包。

其优势在于：
- 巨硬出品，必属“精品”
- 超高的可定制化
- 相比ConEmu、Cmder等终端模拟器更加美观好用

截图一览：
![1.jpg][1]
#### Msys2
这是个啥呢？这个东西有Cygwin有很多渊源，用过安卓厨房的都知道，其运行在Cygwin的环境之下。我们不去深究，简单把他理解为Msys2是一个类似Cygwin的东西，提供了能够在Windows下使用的Linux命令的环境和二进制程序。

## 安装基本程序
#### 安装Windows Terminal
Windows Terminal应该只能用于Windows10以上的系统，且在Windows11已经内置。可以直接前往微软商店进行下载安装。
  - 微软商店链接：https://aka.ms/terminal
  - Github下载链接：https://github.com/microsoft/terminal/releases
#### 安装Msys2
受于网络环境的限制，这边直接在中科大镜像站中下载，部分内容也直接从中科大镜像站中复制。
- 下载地址：http://mirrors.ustc.edu.cn/msys2/distrib/x86_64/。

访问该镜像目录下的 distrib/ 目录 (x86_64 、 i686 )，找到名为 `msys2-<架构>-<日期>.exe` 的文件 （如 `msys2-x86_64-20141113.exe` ），下载安装即可。安装过程不需要过多赘述，安装路径默认即可，默认是安装在`C:\msys64`下的。

#### 将二者绑定
打开你的Windows Terminal的设置页面（Ctrl+，快捷键打开）。点击左侧添加新配置文件，新建一份空配置文件，按照如图填写内容。
命令行内容：
```
cmd.exe /c set MSYSTEM=MINGW64 && set MSYS=winsymlinks:nativestrict && set MSYS2_PATH_TYPE=inherit && set CHERE_INVOKING=enabled_from_arguments&& C:/msys64/usr/bin/bash.exe --login
```
启动目录内容：
```
%USERPROFILE%
```
![2.png][2]
保存之后点击Tab栏下拉打开我们的UnixMsys2
![3.png][3]
打开后如下图所示，此时已经获得一个类Unix的Bash环境，可以执行常规的Linux命令。
![4.png][4]

## 进阶使用
#### 配置国内pacman镜像源
Msys2的最棒的地方就是它采用了pacman作为包管理工具，没错就是archlinux使用的那个，通过pacman，我们也能在Windows下自由的安装Linux程序包。
配置镜像源，这里我直接Copy中科大的教程，教程地址：http://mirrors.ustc.edu.cn/help/msys2.html
pacman的配置:
编辑 `/etc/pacman.d/mirrorlist.mingw32` ，在文件开头添加：
```
Server = http://mirrors.ustc.edu.cn/msys2/mingw/i686
```
编辑 `/etc/pacman.d/mirrorlist.mingw64` ，在文件开头添加
```
Server = http://mirrors.ustc.edu.cn/msys2/mingw/x86_64
```
编辑 `/etc/pacman.d/mirrorlist.msys` ，在文件开头添加
```
Server = http://mirrors.ustc.edu.cn/msys2/msys/$arch
```
编辑 `/etc/pacman.d/mirrorlist.ucrt64` ，在文件开头添加
```
Server = http://mirrors.ustc.edu.cn/msys2/mingw/ucrt64
```
然后执行 `pacman -Sy` 刷新软件包数据即可。

![5.png][5]

整一个neofetch

![6.png][6]

#### 使用Oh-my-zsh
oh-my-zsh没人不知道吧？经常使用linux的应该都用过，或多或少也都听过。不知道的也没关系，记住他功能强大，好看就完事了。
- 首先安装git和zsh：`pacman -Sy git zsh`
- 下载oh-my-zsh(清华镜像源)：`git clone https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git`
- 进入安装目录 `cd ohmyzsh/tools`
- 执行安装 `REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh install.sh`
- 到此为止，如下图，Oh-My-Zsh就直接跑起来了

![7.png][7]

#### 切换UnixMsys2默认为zsh
我们在安装基本程序时，默认选择的shell是bash，而不是zsh，所以在你下一次打开的时候进去的还是bash，这里我们需要再一次回到Windows Termianl的设置界面，将启动命令中的
![8.png][8]

保存后再次打开一遍UnixMsys2，成功运行在了oh-my-zsh中
![9.png][9]
#### 将UnixMsys2作为Windows Terminal默认配置
此后你打开Windows Terminal，默认就是进入这个“Unix环境”了。
![10.png][10]
## 使用须知
可以直接通过盘符进行访问其他硬盘，也可以直接运行Path变量中的exe程序，大部分情况下，cmd下能够执行的命令它都可以执行，PowerShell的不能，PowerShell还是需要切回到PowerShell进行执行。
![11.png][11]

默认根目录不是C盘根目录，而是msys2的安装位置，默认是C:/msys64
![12.png][12]

默认的home目录就是用户在Windows下的那个目录：C:/Users/用户名
![13.png][13]

## 进阶使用Plus
    通过上面的步骤，我们已经得到了一个powerful的unix终端环境。此时可以通过颜色美化、ohmyzsh的插件扩展使其功能更上一层楼。但这一节不会再手把手教学，留给大家自己去探索。
1. Windows Terminal 颜色美化：https://windowsterminalthemes.dev/
2. zsh插件拓展：https://github.com/zsh-users


最后，此文章参考了很多网上的Windows Terminal整合Msys2/MingW64的教程，不一一列举，向无私奉献致敬。最后，祝大家使用愉快。
![14.png][14]


  [1]: images/3130863096.jpg
  [2]: images/1497750718.png
  [3]: images/240636872.png
  [4]: images/15422842.png
  [5]: images/123305902.png
  [6]: images/1052173402.png
  [7]: images/4057927632.png
  [8]: images/2332454343.png
  [9]: images/3258287969.png
  [10]: images/4016220144.png
  [11]: images/1295682066.png
  [12]: images/1472666719.png
  [13]: images/2594592035.png
  [14]: images/2758855373.png
