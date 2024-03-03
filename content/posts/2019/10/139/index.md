---
title: "修改 Intellij IDEA 使用阿里云 Maven 源"
categories: [ "Java" ]
tags: []
draft: false
slug: "139"
date: "2019-10-23T23:05:12.000000"
---


1. 进入目录：**`C:\Program Files\JetBrains\IntelliJ IDEA 2019.2.3\plugins\maven\lib\maven3\conf`**

2. 打开文件**`settings.xml`**

3. 找到**`<mirrors>`**标签

4. 在**`<mirrors>`**标签内插入如下内容
```xml
	 <mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
	</mirror>
```

5. 然后就可以看到控制台里显示在阿里的源同步maven了
![Snipaste_2019-10-23_23-04-57.png](images/2241808886.png)

