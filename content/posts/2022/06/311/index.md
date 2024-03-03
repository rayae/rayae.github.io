---
title: "Docker 访问宿主机的localhost 127.0.0.1"
categories: [ "Docker" ]
tags: []
draft: false
slug: "311"
date: "2022-06-13T20:13:27.000000"
---

如果是命令行启动，添加如下参数：

```shell
--add-host=host.docker.internal:host-gateway
```

如果是docker-compose.xml启动，添加如下参数：

```yaml
extra_hosts:
      - host.docker.internal:host-gateway
```

然后将 `localhost`或者是 `127.0.0.1` 替换成 `host.docker.internal`

