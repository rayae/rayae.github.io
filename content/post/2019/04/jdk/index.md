---
title: "JDK 配置环境变量"
categories: [ "资源分享","Java" ]
tags: [ None ]
draft: false
slug: "jdk"
date: "2019-04-27T21:23:00.000000"
---

# JDK 配置环境变量

#### 一键配置脚本(管理员运行)
```bat
setx CLASSPATH '.;%JAVA_HOME%\lib;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;' /m
set op=%PATH%
setx PATH "%op%";^%JAVA_HOME^%\bin;^%JRE_HOME^%\bin; /m
setx JAVA_HOME "E:\Environment\jdk1.8.0_281" /m
setx JRE_HOME "E:\Environment\jdk1.8.0_281\jre" /m
```

#### JAVA_HOME
```
E:\Environment\jdk1.8.0_281
```

#### JRE_HOME
```
E:\Environment\jdk1.8.0_281\jre
```

#### CLASSPATH
```
 .;%JAVA_HOME%\lib;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
```

#### PATH 最后面添加
```
;%JAVA_HOME%\bin;%JRE_HOME%\bin;
```
