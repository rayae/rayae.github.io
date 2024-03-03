---
title: "ffmpeg 将 网络流视频 HLS(m3u8) 转为 MP4 视频命令"
categories: [ "脚本" ]
tags: [ None ]
draft: false
slug: "181"
date: "2019-12-03T15:00:00.000000"
---

# ffmpeg 将 网络流视频 HLS(m3u8) 转为 MP4 视频命令
```bash
ffmpeg -allowed_extensions ALL -i index.m3u8 -acodec copy -bsf:a aac_adtstoasc -vcodec copy output.mp4
```
