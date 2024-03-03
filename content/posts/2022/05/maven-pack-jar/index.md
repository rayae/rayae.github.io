---
title: "三种通过maven打包jar的方式及实现"
categories: [ "Java" ]
tags: []
draft: false
slug: "maven-pack-jar"
date: "2022-05-17T21:39:00.000000"
---

# How to pack jar in maven

三种通过maven打包jar的方式及实现

[项目源码 on Github](https://github.com/bavelee/How-to-pack-jar-in-maven)

## 01-maven-jar-plugin

#### 配置文件

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-jar-plugin</artifactId>
        <version>3.2.0</version>
        <configuration>
            <archive>
                <index>true</index>
                <manifest>
                    <addClasspath>true</addClasspath>
                    <mainClass>cn.bavelee.packjar.Main</mainClass>
                    <classpathPrefix>lib/</classpathPrefix>
                </manifest>
            </archive>
        </configuration>
        <executions>
            <execution>
                <phase>package</phase>
                <goals>
                    <goal>jar</goal>
                </goals>
            </execution>
        </executions>
    </plugin>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-dependency-plugin</artifactId>
        <version>3.2.0</version>
        <executions>
            <execution>
                <id>copy-dependencies</id>
                <phase>package</phase>
                <goals>
                    <goal>copy-dependencies</goal>
                </goals>
                <configuration>
                    <type>jar</type>
                    <includeTypes>jar</includeTypes>
                    <outputDirectory>${project.build.directory}/lib</outputDirectory>
                </configuration>
            </execution>
        </executions>
    </plugin>
</plugins>
```

#### 打包方式

`maven-jar-plugin` 结合 `maven-dependency-plugin`

- `maven-jar-plugin` : 将用户代码打包为一个jar包
- `maven-dependency-plugin` : 复制依赖库到一个目录下，查看`pom.xml`下的outputDirectory

#### 打包成品

一个独立的jar和包含依赖的lib目录

#### 使用方式

把jar包和lib目录放置在一个路径下运行

#### 优点

- 不改动依赖时能提升打包效率，根据需要可以每次只打包用户代码的jar包
- 开发 & 测试阶段方便

#### 缺点

- 部署运行不如FatJar便利

## 02-maven-assembly-plugin

#### 配置文件

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-assembly-plugin</artifactId>
        <version>3.3.0</version>
        <executions>
            <execution>
                <id>jar-with-dependencies</id>
                <phase>package</phase>
                <goals>
                    <goal>single</goal>
                </goals>
                <configuration>
                    <archive>
                        <manifest>
                            <mainClass>cn.bavelee.packjar.Main</mainClass>
                        </manifest>
                    </archive>
                    <descriptorRefs>
                        <descriptorRef>jar-with-dependencies</descriptorRef>
                    </descriptorRefs>
                    <!--                            <finalName>${build.finalName}</finalName>-->
                    <!-- false: 打包输出的jar包不会带有jar-with-dependencies后缀 -->
                    <appendAssemblyId>false</appendAssemblyId>
                </configuration>
            </execution>
        </executions>
    </plugin>
</plugins>
```

#### 打包方式

一个 `maven-assembly-plugin`

#### 打包成品

一个FatJar，依赖也被打包进去了。可以通过`appendAssemblyId`参数避免生成的jar包带id(会覆盖掉ThinJar)

#### 使用方式

直接运行Jar包

#### 优点

运行方便，不用把注意力放在依赖上，直接`java -jar`运行即可

#### 缺点

每次都要完整打包，效率相比`maven-jar-plugin` 结合 `maven-dependency-plugin`要更低一些

## 03-maven-shade-plugin

#### 配置文件

```xml
<plugins>
    <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-shade-plugin</artifactId>
        <version>3.2.4</version>
        <executions>
            <execution>
                <phase>package</phase>
                <goals>
                    <goal>shade</goal>
                </goals>
                <configuration>
                    <createDependencyReducedPom>false</createDependencyReducedPom>
                    <shadedArtifactAttached>false</shadedArtifactAttached>
                    <transformers>
                        <transformer
                                implementation="org.apache.maven.plugins.shade.resource.ManifestResourceTransformer">
                            <manifestEntries>
                                <Main-Class>cn.bavelee.packjar.Main</Main-Class>
                            </manifestEntries>
                        </transformer>
                    </transformers>
                    <relocations>
                        <relocation>
                            <pattern>org.apache.commons</pattern>
                            <shadedPattern>${extlib.shade.prefix}.org.apache.commons</shadedPattern>
                        </relocation>
                    </relocations>
                </configuration>
            </execution>
        </executions>
    </plugin>
</plugins>
```

#### 打包方式

默认会执行`maven-jar-plugin`，暂且掠过无视，我们不需要配置，一个 `maven-shade-plugin`

#### 打包成品

和`maven-assembly-plugin` 一样的FatJar，依赖也被打包进去了，还可以对依赖的包名进行重写。

#### 使用方式

直接运行Jar包

#### 优点

运行方便，不用把注意力放在依赖上，直接`java -jar`运行即可

#### 缺点

每次都要完整打包，效率相比`maven-jar-plugin` 结合 `maven-dependency-plugin`要更低一些

