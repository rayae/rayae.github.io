---
title: "禁用Chrome https验证及警告以提升使用体验"
categories: [ "小技巧" ]
tags: []
draft: false
slug: "disable-chrome-ssl-warning"
date: "2022-05-18T21:00:22.000000"
---

为**Google Chrome**增加启动参数：

```bash
--test-type --ignore-certificate-errors --allow-running-insecure-content
```

参数解读：

- --test-type : 测试模式，不会有使用后两者的警告
- --ignore-certificate-errors : 忽略证书警告，自签证书一般会有警告
- --allow-running-insecure-content ：允许加载不安全的网页，有些网页会提示存在风险

