---
title: "记一次 SpringBoot 静态资源映射本地文件被拦截器拦截的坑"
categories: [ "代码笔记" ]
tags: [ None ]
draft: false
slug: "296"
date: "2021-07-21T10:00:17.000000"
---

记一次 SpringBoot 静态资源映射本地文件会被拦截的坑

### application-dev.yaml 中配置本地路径
``` yaml
upload-path: F:\upload-server
```

### 配置 WebMvcConfigurer 
```java
@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Resource
    private LoginInterceptor loginInterceptor;

    @Value("${upload-path}")
    String uploadPath;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor)
                .addPathPatterns("/**")
                .excludePathPatterns("/swagger*/**", "/v2/api-docs");
        WebMvcConfigurer.super.addInterceptors(registry);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 映射本地上传文件夹
        registry.addResourceHandler("/upload/**")
                .addResourceLocations("file:" + uploadPath);
        WebMvcConfigurer.super.addResourceHandlers(registry);
    }
}
```
结果就是访问 `/upload/*` 会进入拦截器
解决办法就是 再本地路径后面一定要加上 `\`
```yaml
upload-path: F:\upload-server\
```
