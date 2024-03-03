---
title: "SpringMVC中Controller返回结果被重定向其他占位符接口"
categories: [ "代码笔记" ]
tags: []
draft: false
slug: "290"
date: "2021-05-21T09:50:09.000000"
---

**具体错误如下**

    HTTP状态 404 - 未找到
    类型 状态报告
    
    消息 文.件[/view/api/upload/image.jsp] 未找到
    
    描述 源服务器未能找到目标资源的表示或者是不愿公开一个已经存在的资源表示。

`/api/upload/image` 是图片上传接口，应该返回JSON数据
但是该接口正常执行后被重定向至`/view/api/upload/image.jsp`的JSP视图中
最后发现是忘记添加`@ResponseBody`注解

```java
    // 图片上传接口
    @RequestMapping(value = "image", method = RequestMethod.POST)
    @ResponseBody
    public ResponseMessage uploadImage(@RequestParam("file") MultipartFile multipartFile,
                                       HttpServletRequest request) {
        return upload(true, multipartFile, request);
    }
```
