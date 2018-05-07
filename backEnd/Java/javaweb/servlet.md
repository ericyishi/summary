# Servlet
### 概念
* 动态的web开发技术,本质就是一个类,运行在服务器端的一个java小程序
* 处理客户端的请求，并且对请求作出响应
* 处理业务逻辑,生成动态web内容

### 编写一个servlet步骤

1. 编写一个类
    1. javaweb src中新建
	2. 继承HttpServlet
    3. 重写doGet或者doPost方法
       * doPost在表单提交method=post情况下使用，或者ajax请求为post
    ```
     package com.test.a;

     import javax.servlet.ServletException;
     import javax.servlet.http.HttpServlet;
     import javax.servlet.http.HttpServletRequest;
     import javax.servlet.http.HttpServletResponse;
     import java.io.IOException;

     public class HelloServlet extends HttpServlet{
         @Override
         protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
             System.out.print("请求已经收到");
         }
     }
    ```
2. 编写配置文件(在web-inf/web.xml中)
	* 1.注册servlet
	  ```
	   <!-- 注册servlet 使用servlet标签
             servlet-name：给servlet起名字，只需要页面上唯一
             servlet-class:存servlet全限定名，复制的方式
            -->
	   <servlet>
        <servlet-name>HelloServlet</servlet-name>
        <servlet-class>com.test.a.HelloServlet</servlet-class>

       </servlet>
	  ```
	* 2.绑定路径（访问的时候路径）
	  ```
	    <!--绑定路径，使用servlet-mapping
               servlet-name:与上面保持一致，建议复制
               url-pattern：访问路径，要求必须是以“/”开头,且唯一
             -->
	    <servlet-mapping>

                <servlet-name>HelloServlet</servlet-name>
                <url-pattern>/hello</url-pattern>
            </servlet-mapping>
	  ```

	* 完整代码
	```
        <?xml version="1.0" encoding="UTF-8"?>
        <web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
                 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                 xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
                 version="4.0">
            <servlet>
                <servlet-name>HelloServlet</servlet-name>
                <servlet-class>com.test.a.HelloServlet</servlet-class>
            </servlet>
            <servlet-mapping>
                <servlet-name>HelloServlet</servlet-name>
                <url-pattern>/hello</url-pattern>
            </servlet-mapping>
        </web-app>
	```
	  * 上面servlet编写好了后，在intellij中，还需要点右键build一下,会在设置路径下生成class文件

3. 访问
	```
	  http://主机:端口号/项目名/路径
	```

### 创建一个获取客户端发来请求参数并返回内容servlet
* 因为重写doGet方法有两个参数，一个是request，一个response
  ```
     protected void doGet(HttpServletRequest req, HttpServletResponse resp){}
  ```
* 接受参数:  格式:key=value
   * request.getParameter("key")
   ```
     Sting value=request.getParameter("key")
	 例如: http://localhost/day09/hello?username=tom
		request.getParameter("username")就可以获取tom值
   ```
* 向浏览器写入内容
   * resp.setContentType("text/html;charset=utf-8");//这样写入后才能发送中文
   * resp.getWriter().print("成功");


### 生命周期
1. void init(ServletConfig config):初始化
	 * 初始化方法
	 * 执行者:服务器
	 * 执行次数:一次
	 * 执行时机:默认第一次访问的时候
2. void service(ServletRequest request,ServletResponse response):服务 处理业务逻辑
	 * 服务
	 * 执行者:服务器
	 * 执行次数:请求一次执行一次
	 * 执行时机:请求来的时候
3. void destroy():销毁
	 * 销毁
	 * 执行者:服务器
	 * 执行次数:只执行一次
	 * 执行时机:当servlet被移除的时候或者服务器正常关闭的时候
* 说明：
  * serlvet是单实例多线程
  * 默认第一次访问的时候,服务器创建servlet,并调用init实现初始化操作.并调用一次service方法
  * 每当请求来的时候,服务器创建一个线程,调用service方法执行自己的业务逻辑
  * 当serlvet被移除的时候服务器正常关闭的时候,服务器调用servlet的destroy方法实现销毁操作.

### 配置Servlet的启动时加载
* load-on-startup 修改servlet初始化时机
* 数值越大，优先级越低
```
 <load-on-startup>2</load-on-startup>
```

### url-pattern的配置
* 方式1:完全匹配  必须以"/"开始 例如: /hello /a/b/c
* 方式2:目录匹配  必须"/"开始  以"*"结束   例如: /a/*  /*
* 方式3:后缀名匹配 以"*"开始 以字符结尾 例如: *.jsp  *.do  *.action
* 优先级:
    ```
    完全匹配>目录匹配>后缀名匹配
    ```

```
  练习:
	有如下的一些映射关系：
		Servlet1 映射到 /abc/*
		Servlet2 映射到 /*
		Servlet3 映射到 /abc
		Servlet4 映射到 *.do
	问题:
	当请求URL为“/abc/a.html”，“/abc/*”和“/*”都匹配，哪个servlet响应
		Servlet引擎将调用Servlet1。
	当请求URL为“/abc”时，“/*”和“/abc”都匹配，哪个servlet响应
		Servlet引擎将调用Servlet3。
	当请求URL为“/abc/a.do”时，“/abc/*”和“*.do”都匹配，哪个servlet响应
		Servlet引擎将调用Servlet1。
	当请求URL为“/a.do”时，“/*”和“*.do”都匹配，哪个servlet响应
		Servlet引擎将调用Servlet2.
	当请求URL为“/xxx/yyy/a.do”时，“/*”和“*.do”都匹配，哪个servlet响应
		Servlet引擎将调用Servlet2。
```
* 当我们项目处理不了的请求的时候，服务器里面的defaultservlet来处理

### 系统登录成功后页面5秒后跳转到成功页面
* Refresh的响应头
  ```
   refresh:秒数;url=跳转的路径
  ```
* 设置响应头:
  ```
   response.setHeader(String key,String value);设置字符串形式的响应头
   response.addHeader(String key,String value);追加响应头, 若之前设置设置过这个头,则追加;若没有设置过,则设置
  ```

* 设置定时刷新:
  ```
   response.setHeader("refresh","3;url=/tmall/login.html");
  ```
* demo
  ```
   // 判断user是否为空
   if(user==null){
    response.getWriter().print("用户名和密码不匹配，3秒后跳转")
    //定时跳转
    response.setHeader("refresh","3;url=/tmall/login.html")
   }else{
    response.setContentType("text/html;charset=UTF-8");
    response.getWriter().println("<h1>登录成功!页面将在5秒后跳转</h1>");
    response.setHeader("Refresh", "5;url=/WEB09/loginSucc.html");
   }
  ```
  ```
   # 可以通过html页面中的一个标签设置头信息<meta>标签.
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="Refresh" content="5;url=/WEB09/succ.html">
    <script type="text/javascript" src="/WEB09/js/jquery-1.11.3.min.js"></script>
    <title>Insert title here</title>
    <script type="text/javascript">
        $(function(){
            setInterval("changeTime()", 1000);
        });
        var i = 5;
        function changeTime(){
            // 获得id为s1的元素:
            i--;
            $("#s1").html(i);
        }
    </script>
    </head>
    <body>
    <h1>登录成功！！！页面将在<span id="s1">5</span>秒后跳转！</h1>
    </body>
    </html>
  ```


* servletConfig:
	* servlet的配置对象:
	* 获取servlet名称 初始化参数
	* 获取全局管理者★ getServletContext()


* servletContext:
	* 上下文（全局管理者）
	* 如何获取上下文
	  * 在servlet中直接调用getServletContext()
	  ```
	   getServletContext()
	  ```
	* 作用:
		1. 获取全局的初始化参数
		 * getInitParameter("key")
		   ```
		    # web.xml配置
		    <context-param>配置是是一组键值对，比如：
            <context-param>
                   <param-name>home-page</param-name>
                   <param-value>home.jsp</param-value>
            </context-param>
		   ```

		2. 共享资源(域对象)
		 * xxxAttribute()
		3. 获取资源
		 * getRealPath("/1.txt"):获取项目发布到服务器上位置的根目录
		 * getResourceAsStream("/1.txt"):以流的形式返回一个文件
		4. 获取文件mime类型
		 * getMimeType(文件名称)


### 域对象
* 创建:在服务器启动的时候,服务器会为每一个项目创建一个全局管理者,servletcontext就是当前项目的引用
* 销毁:在项目被移除或者服务器关闭的时候销毁
* 常用的方法:
   * xxxAttribute()

* demo
  ### 统计一下网站被登录的总次数
* ServletContext Servlet中全部的内容ServletContext都了解.
* 一个WEB应用只有一个ServletContext对象.服务器启动的时候，服务器为每个WEB工程创建一个属于自己项目的ServletContext对象.服务器关闭的时候或者项目从服务器中移除ServletContext才会被销毁.
* 如果将值保存在ServletContext中.值就有一个作用的范围.所以这个对象称为”域对象”.
* 可以把count的值放在这里域里面
```
//web.xml
 <!--这是一个count servlet-->
    <servlet>
        <servlet-name>CountServlet</servlet-name>
        <servlet-class>com.test.com.test.c.CountServlet</servlet-class>
        <load-on-startup>2</load-on-startup>
    </servlet>
    <servlet-mapping>

        <servlet-name>CountServlet</servlet-name>
        <url-pattern>/getCount</url-pattern>
    </servlet-mapping>
```
```
 //CountServlet.java
 package com.test.com.test.c;
 import javax.servlet.ServletContext;
 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServlet;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;
 import java.io.IOException;

 public class CountServlet extends HttpServlet{
     @Override
     public void init() throws ServletException {
         // 获得ServletContext对象.初始化一个值为0.
         ServletContext servletContext = this.getServletContext();
         servletContext.setAttribute("count", 0);
     }
     @Override
     protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         System.out.print("count servlet已经收到");
         Integer count = (Integer) this.getServletContext().getAttribute("count");
         // 存回到ServletContext域中
         this.getServletContext().setAttribute("count", ++count);

         // 在CountServlet中获得次数并且显示：
         resp.setContentType("text/html;charset=UTF-8");
         // 获得次数:
         count = (Integer) this.getServletContext().getAttribute("count");
         resp.getWriter().println("<h1>您是第"+count+"位登录成功的用户！</h1>");
     }
 }

```
### 通过类加载器获取文件的路径(处于classes目录下的文件)
* servlet中能使用外，在普通文件下也能使用
  ```
   类名.class.getClassLoader().getReource("文件路径").getPath()
  ```
  ```
   类名.class.getClassLoader().getReourceAsStream("文件路径")
  ```

