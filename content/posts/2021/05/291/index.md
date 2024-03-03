---
title: "MyBatis Unknown column is detected on XXX auto-mapping. Mapping parameters are XXX"
categories: [ "代码笔记","Java" ]
tags: []
draft: false
slug: "291"
date: "2021-05-22T13:42:00.000000"
---

在 **Myabtis** 多对多的表联合查询中一直有一个警告
### 报错如下
```text
13:40:40.197 WARN  org.apache.ibatis.session.AutoMappingUnknownColumnBehavior$2 47 doAction - Unknown column is detected on 'io.liteblog.mapper.ArticleCategoryRefMapper.listCategoriesByArticleId' auto-mapping. Mapping parameters are [columnName=article_id,propertyName=article_id,propertyType=null]
```

### 原因分析
我指定了 ResultMap 作为返回结果，但是多表联合查询中获取到了多个名字相同字段，多余的字段 MyBatis 也会进行映射匹配
```xml
    <!--  通过文章id查询文章包含的分类  -->
    <select id="listCategoriesByArticleId" resultMap="CategoryResultMap" parameterType="Integer">
        select
        *
        from article_category_ref
        left join category
        on article_category_ref.category_id=category.id
        where article_id = #{articleId,jdbcType=INTEGER}
    </select>
    <resultMap id="CategoryResultMap" type="io.liteblog.pojo.Category">
        <id column="category_id" jdbcType="INTEGER" property="id" />
        <result column="category_name" jdbcType="VARCHAR" property="categoryName" />
    </resultMap>
```

### 解决方法
上述代码可以看到，我的 ResultMap 中只接受 2 个字段，所有将 `*` 改成所需要的字段即可
```xml
    <!--  通过文章id查询文章包含的分类  -->
    <select id="listCategoriesByArticleId" resultMap="CategoryResultMap" parameterType="Integer">
        select
        article_category_ref.category_id category_id,
        category.category_name category_name
        from article_category_ref
        left join category
        on article_category_ref.category_id=category.id
        where article_id = #{articleId,jdbcType=INTEGER}
    </select>
    <resultMap id="CategoryResultMap" type="io.liteblog.pojo.Category">
        <id column="category_id" jdbcType="INTEGER" property="id" />
        <result column="category_name" jdbcType="VARCHAR" property="categoryName" />
    </resultMap>
```
