---
title: "Ribbon + Eureka 报错 No instances available for eureka-client"
categories: [ "代码笔记","Java" ]
tags: [ "ribbon","springcloud","eureka","springboot" ]
draft: false
slug: "297"
date: "2021-07-26T00:15:00.000000"
---

# Ribbon + Eureka 报错 No instances available for eureka-client
通过查看 eureka-server 的面板是可以看到client和server都已注册的

### eureka-consumer-ribbon 的 配置
```java
@SpringBootApplication
@EnableDiscoveryClient
public class EurekaConsumerRibbonApplication {

    public static void main(String[] args) {
        SpringApplication.run(EurekaConsumerRibbonApplication.class, args);
    }

    @Bean
    @LoadBalanced
    RestTemplate restTemplate(){
        return new RestTemplate();
    }
}
----------------
@RestController
public class TestController {
    @Autowired
    RestTemplate restTemplate;

    @RequestMapping
    public String index() {
        return restTemplate.getForObject("http://eureka-client/?param=" + getClass().getName(), String.class);

    }
}
-------------
eureka.client.service-url.defaultZone=http://localhost:1001/eureka
server.port=2004
spring.application.name=eureka-consumer-ribbon
-------------
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-actuator</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-ribbon</artifactId>
            <version>2.2.9.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
```

### 结尾
怎么看都没问题，网上的解决办法全部试过了，最后用 `MavenHelper` 看到 `spring-cloud-starter-netflix-eureka-client` 跟 `spring-cloud-starter-netflix-ribbon` 存在依赖冲突
![Snipaste_2021-07-26_09-22-56.png][1]

原来前者的 3.x 版本已经内部集成了 ribbon ,解决办法就是移除掉 `spring-cloud-starter-netflix-ribbon` 依赖,最后成功跑出结果

  [1]: images/948804333.png
