---
title: "解决Windows下Web服务暴露端口提示无权限的问题"
categories: [ "代码笔记" ]
tags: [ None ]
draft: false
slug: "308"
date: "2022-05-29T00:37:39.000000"
---

### Docker暴露端口无权限

**docker: Error response from daemon: Ports are not available: listen tcp 0.0.0.0:4449: bind: An attempt was made to access a socket in a way forbidden by its access permissions.**

[https://github.com/docker/for-win/issues/3171#issuecomment-554587817](https://github.com/docker/for-win/issues/3171#issuecomment-554587817)

### nodejs暴露端口无权限

**Error: listen EACCES: permission denied 0.0.0.0:3000**


### 解决办法

cmd中执行如下代码

```powershell
netsh int ipv4 set dynamic tcp start=49152 num=16384
netsh int ipv6 set dynamic tcp start=49152 num=16384
```

<pre class="md-fences md-end-block ty-contain-cm modeLoaded md-focus" spellcheck="false" lang="bash" cid="n6" mdtype="fences"><div class="CodeMirror cm-s-inner cm-s-null-scroll CodeMirror-wrap" lang="bash"><br class="Apple-interchange-newline"/></div></pre>

