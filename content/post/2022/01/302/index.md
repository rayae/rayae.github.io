---
title: "动态污点跟踪漏洞检测过程"
categories: [ "代码笔记" ]
tags: [ None ]
draft: true
slug: "302"
date: "2022-01-13T23:09:58.000000"
---

# 动态污点跟踪漏洞检测过程

便于表述，简化后一个污点跟踪过程可以有如下节点：流量Http、污染源Source、传播Propagator、漏洞触发Rule

首先需要一个模型用于表示污点跟踪过程中各个节点的信息以便于我们记录污点数据的整个流向过程，包括每个节点的调用栈信息。不同节点需要的数据不同，下面会逐步展开。

### 流量Http节点：

作用：用于获取request和response的信息

Hook点示例：

- javax.servlet.Filter.**doFilter**(ServletRequest, ServletResponse, FilterChain) 

此方法进入后，可以获取到request的信息

此方法结束后，可以获取到reponse的信息

### 污染源Source节点：

作用：获取外部输入的地方，即为污染源产生的地方，Source节点的污点数据流向皆为流向返回值，将其返回值与其他信息放入**污点池**

Hook点示例：

- javax.servlet.ServletRequest.**getParameter**(String) 

​	用于获取请求中的参数

- javax.servlet.ServletRequest.**getHeader**(String)

​	用于获取请求头的值

- javax.servlet.ServletRequest.**getQueryString**()

​	用于获取QueryString

1. 假设现在有如下请求信息

```
GET /demo?p1=foofoo&sometext
Host: 127.0.0.1:80
Accept: text/html
Cookie: JSESSIONID=HFA7823FAUINF13F
Token: barbar
```

2. 我们在用户代码中进行方法调用获取请求中的信息

```
@GetMapping("/demo")
public String demo(ServletRequest request){
	String var1 = request.getParameter("p1"); // foofoo
	String var2 = request.getHeader("Token"); // barbar
	String var3 = request.getQueryString(); // p1=foofoo&sometext
	...
}
```

3. 此时污点池将产生3个污点数据的信息

| 哈希值  |      污点对象      |  参数名称   | 来源                                         | 节点模型                            |
| :-----: | :----------------: | :---------: | :------------------------------------------- | ----------------------------------- |
| 2178316 |       foofoo       |     p1      | 来自parameter中的value，记为parameter, value | {Source，污点对象，参数名称， 来源} |
| 3123144 |       barbar       |    Token    | 来自header中的value，记为header, value       | {Source，污点对象，参数名称， 来源} |
| 1231311 | p1=foofoo&sometext | QueryString | 来自整个QueryString，记为querystring         | {Source，污点对象，参数名称， 来源} |

为Source节点创建一个模型，记为：**{Source，污点对象，参数名称， 来源}**

### 传播Propagator节点：

作用：跟踪记录污点数据在程序中流向的传播过程

Hook点示例：

- java.lang.String.toString() 

​	最常见的方法之一，若String对象本身是污点数据，则调用toString()的返回值，将产生一个新的污染对象，流向过程记为：**This --> Return**

- java.lang.StringBuilder.append(java.lang.String)

​	此方法也很常见，append后将返回其自身 this 。java中字符串拼接操作会被编译器优化为此方法代码

```
如：String var = "foo" + "bar"
优化后：String var = new StringBuilder("foo").append("bar").toString();
```

​	为方便表达，直接将此方法视为视为`String var = "foo".append("bar")`：

​		若字符串`"foo" `是污染数据，则此时流向为 **This --> Return**

​		若字符串`"bar"`是污染数据，其为append方法接受的参数，此时流向为**Param1 -> Return**

​	此方法This和Param1皆可作为污染源，则此方法流向可以为：**This | Param1 --> Return**

- org.owasp.esapi.Encoder.encodeForJavaScript(String)

​	一个编码方法，可以对JS代码进行转义，数据流向为 **Param1 -> Return **，此传播节点较为特殊，也可单独去除作为Tag节点

​	污染数据经过此方法，将被打上一个标签：`js_encoded`，具有此标签的污点数据不会触发XSS漏洞



传播节点模型可以记为：**{Propagator，污点对象，标签，父节点  }**



如下demo：

```
@GetMapping("/demo")
public String demo(ServletRequest request){
	String var1 = request.getParameter("p1"); // foofoo
	...
	String newVar1 = var1.toString(); // 第1次传播
	String newVar2 = newVar1 + "hello"; // 第2次传播
	...
}
```

- 在第1次传播污点数据流向为 **This --> Return**，调用toString方法经过一次传播，程序调用toString()方法时，IAST根据流向，向污点池中检测**This**是否为污点数据：

​		若是，则将**This**的节点模型取出记为**parent**，**This**(值为foofoo)记为**来源值**、**Return**(值为foofoo)记为**污点值**，再构建一个新的节点模型：**{Propagator，来源值，污点值，parent}**，并将**Return**作为新的污点数据放入污点池中，并将其绑定新创建的节点模型，其**parent**用于指向上一级节点(或称为直接/间接产生此节点的节点)

​		此时存在一条长度为2的链路(上下之间存在父子关系，通过parent关联)：

```
		{Source，foofoo，p1， parameter, value}
​		{Propagator，foofoo，foofoo，parent}
```

- 在第2次传播，使用字符串拼接将会调用append方法，此时污点数据流向为 **This --> Return**，与前面一样，IAST根据流向，向污点池中检测This是否为污点数据：

  若是，则将This的节点模型取出记为**parent**，**This**(值为foofoo)记为**来源值**、**Return**(值为foofoohello)记为**污点值**，再构建一个新的节点模型：**{Propagator，来源值，污点值，parent}**放入污点池

  | 哈希值  |      污点对象      |  参数名称   | 来源                                         | 节点模型                                  |
  | :-----: | :----------------: | :---------: | :------------------------------------------- | ----------------------------------------- |
  | 2178316 |       foofoo       |     p1      | 来自parameter中的value，记为parameter, value | {Source，污点对象，参数名称， 来源}       |
  | 3123144 |       barbar       |    Token    | 来自header中的value，记为header, value       | {Source，污点对象，参数名称， 来源}       |
  | 1231311 | p1=foofoo&sometext | QueryString | 来自整个QueryString，记为querystring         | {Source，污点对象，参数名称， 来源}       |
  | 7283726 |    foofoohello     |     p1      | 来自parameter中的value，记为parameter, value | {Propagator, foofoo, foofoohello, parent} |
  
  ​		此时存在一条长度为3的链路(上下之间存在父子关系，通过parent关联)：
  
  ```
  		{Source，foofoo，p1， parameter, value}
  ​		{Propagator，foofoo，foofoo，parent}
  ​		{Propagator, foofoo, foofoohello, parent}
  ```

### 触发Rule节点

作用：是系统中的关键函数地方，会对系统产生危害的地方

Hook点示例：

- java.lang.Runtime.exec(String)

​	执行系统命令，可以触发命令注入漏洞，污染来源为**Param1**，意为Param1为污点数据时，可以触发此规则

假设程序已经经过下面的方法，已有长度为3的链路：

```
@GetMapping("/demo")
public String demo(ServletRequest request){
	String var1 = request.getParameter("p1"); // foofoo
	...
	String newVar1 = var1.toString(); // 第1次传播
	String newVar2 = newVar1 + "hello"; // 第2次传播
	...
	Runtime.getRuntime().exec(newVar2); // 执行一条命令，此时触发Rule节点规则
	...
}
```

到达rule节点的时候，在污点池中判断**Param1**(值为foofoohello)是否为污染数据，

若是，将其模型取出作为**parent**，foofoohello对应的模型为：**{Propagator, foofoo, foofoohello, parent}**，并触发当前命令注入的规则：

漏洞信息：触发**命令注入**规则，**Param1**作为执行命令，**Runtime.getRuntime().exec()**作为执行方法，并收集当前位置的调用栈信息

为Rule节点创建一个模型：**{Rule、漏洞信息、parent}**

此时产生了一条长度为4的漏洞完整跟踪链路(上下之间存在父子关系，通过parent关联)：

```
		{Source，foofoo，p1， parameter, value}
​		{Propagator，foofoo，foofoo，parent}
​		{Propagator, foofoo, foofoohello, parent}
​		{Rule、命令注入、parent}
```



此时可根据request & response的信息以及整条链路输出一条漏洞信息：

来自 `/demo` 的请求（Http节点）
通过使用 Key：`p1` 从  *HTTP Parameter* 取出一条数据 `foofoo`  （Source节点）
`foofoo`经过**toString()**方法传播变为`foofoo` (Propagator节点)
再经过**append()**方法传播变为`foofoohello` (Propagator节点)
最后到达**Runtime.getRuntime().exec()**执行了命令 (Rule节点)



- javax.servlet.ServletOutputStream.print(String)

​	向response中写入数据，可以触发XSS漏洞，污染来源为**Param1**，此处简单示例说明Tag作用

```
@GetMapping("/demo")
public String demo(ServletRequest request, ServletResponse response){
	String var1 = request.getParameter("p1"); // foofoo
	...
	String newVar1 = var1.toString(); // 第1次传播
	String newVar2 = newVar1 + "hello"; // 第2次传播
	...
	String newVar3 = org.owasp.esapi.Encoder.encodeForJavaScript(newVar2); // 第3次传播，带Tag标记
	...
	response.getWriter().print(newVar3); // 触发 XSS，getWriter()会返回 ServlerOutputStream 接口实现
	...
}
```

经过第3次传播时，污染数据由**Param1** 流向 **Return**， **newVar3**作为新的污点数据，并被打上 `js_encoded`标签(此时**newVar3**不再具有触发XSS漏洞的能力，但依然有可能触发其他漏洞)

在经过ServletOutputStream.print(String)触发XSS，漏洞，此时产生了一条长度为5的漏洞完整跟踪链路(上下之间存在父子关系，通过parent关联)：

		{Source，foofoo，p1， parameter, value}
	​	{Propagator，foofoo，foofoo，parent}
	​	{Propagator, foofoo, foofoohello, parent}
	​ {Propagator, foofoohello, %3d%4d%6d, parent}
	​ {Rule, XSS, parent}

此时Rule节点还需要进行标签检测，如XSS漏洞的hook点需要判断时候有`js_encoded`标签或`html_encoded`等标签，若经过则会使XSS漏洞无法触发，则当前这个XSS漏洞判定为无效（可能存在同时被打上`js_encoded`标签和`js_decoded`标签的情况，此时XSS漏洞仍然可以是有效的，所以需要进一步引入2中作用的标签，一种使其失效，一种使其生效）

- java.io.File.exists()

​	判断文件是否存在，可触发路径遍历漏洞 污染来源为 This


