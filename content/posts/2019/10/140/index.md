---
title: "真正解决 Intellij IDEA 中文乱码，设置了UTF-8依然乱码的问题"
categories: [ "Java" ]
tags: []
draft: false
slug: "140"
date: "2019-10-24T15:04:46.000000"
---

试过百度的各种解决办法：
1. 修改`Tomcat 9.0\conf\logging.properties`中的
`java.util.logging.ConsoleHandler.encoding = GBK`
Tomcat输出信息不乱码，但是控制台输出乱码

2. `xxx`

都无效

最后找到解决办法：
`Intellij IDEA` -> `Help` -> `Edit Custom VM Options`
在最后面增加两行内容
```
-Dfile.encoding=UTF-8
-Dconsole.encoding=UTF-8
```

重启`Intellij IDEA` 中文乱码问题解决

