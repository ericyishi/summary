# jsp
### 概念
* java server pages(java服务器页面)
* 本质上jsp就是一个servlet,在html代码中嵌套java代码
* 运行在服务器端,处理请求,生成动态的内容.
* 对应的java和class文件在tomcat目录下的work目录
* 后缀名 .jsp
* 将内容的生成和信息的展示相分离

### 执行流程:
1. 浏览器发送请求,访问jsp页面
2. 服务器接受请求,jspSerlvet会帮我们查找对应的jsp文件
3. 服务器将jsp页面翻译成java文件.
4. jvm会将java编译成.class文件
5. 服务器运行class文件,生成动态的内容.
6. 将内容发送给服务器,
7. 服务器组成响应信息,发送给浏览器
8. 浏览器接受数据,解析展示

### jsp的脚本
* java程序片段
  ```
   <%...%>
  ```
  ```
   <%
     int i=3;
     System.out.println(i);
   %>

  ```
	* 生成成jsp的service方法中
* 输出表达式
  ```
   <%=...%>
  ```
   * 相当于out.print();
  ```
   <%=i %>
   <%
     out.print("你好");//直接输出到页面上
   %>
  ```

    * 会生成在对应的jsp.java的service方法中,相当于在java中调用out.print(..)
* 声明成员【基本很少使用】
  ```
    <%!...%>
  ```
  ```
    <%!
      int k=4;
    %>
  ```
    * 成员位置

### jsp的指令
* 新建一个jsp页面
* 第一行就是js指令
  ```
   <%@ page language="java" ContentType="text/html;charset=UTF-8">
  ```
* 语法
    ```
     <%@ 指令的名称 属性名=”属性值” 属性名=”属性值”%>
    ```
* 指令的分类：
    1. page:主要声明jsp页面的一些属性
       * 重要属性
         1. contentType 设置响应流的编码,及通知浏览器用什么编码打开.以及设置文件的mimetype
         2. pageEncoding 设置页面的编码
            * contentType和pageEncoding联系:
              1. 若两者都出现的时候,各自使用各自的编码
              2. 若只出现一者,两个都使用出现的这个编码
              3. 若两者都不出现,使用服务器默认的编码 tomcat7使用的iso-8859-1【不支持中文】
         3. import 导入所需要的包
       * 了解属性
         1. language 当前jsp页面里面可以嵌套的语言
		 2. buffer 设置jsp页面的流的缓冲区的大小
		 3. autoFlush 是否自动刷新
		 4. extends 声明当前jsp的页面继承于那个类.必须继承的是httpservlet 及其子类
		 5. session 设置jsp页面是否可以使用session内置对象 默认页面是允许的，这样才能使用session域对象
		 6. isELIgnored 是否忽略el表达式,就会忽略它，当成普通字符串
		    * el表达式
		       ```
		        ${sessionScope.skey}//去session域中取skey属性对应的值
		        //等价于<%=session.getAttribute("skey") %>
		       ```
		 7. errorPage 当前jsp页面出现异常的时候要跳转到的jsp页面
		 8. isErrorPage 当前jsp页面是否是一个错误页面，设置为true，才能使用jsp页面的一个内置对象 exception
		    ```
		     <%=exception.getMessage()%>
		    ```
	2. include:静态包含
	   * 静态包含,就是将其他页面或者servlet的**整个页面的内容**包含进来,一起进行编译运行.生成一个java文件.
	     ```
	      <%@include file="相对路径或者是内部路径" %>
	     ```
	      * 内部路径【不带协议和主机的绝对路径去掉项目名】:
	        * 用于请求转发 静态包含 动态包含

	     ```
	      <h1>jsp1的内容是<%@include file="1.jsp" %></h1>
	     ```

	3. taglib:导入标签库
	   * 格式
	     ```
	       <%@taglib prefix="前缀名" uri="名称空间" %>
	     ```
	   * 若导入之后
	     ```
	      <前缀名:标签 .. >
	     ```

  	* 注意：一个页面中可以出现多个指令；指令可以放在任意位置,一般都放在jsp页面最上面.
### 9大jsp内置对象【很重要】
* 在jsp页面上可以直接使用的对象
* 类型：
  1. out
     * 类型：JspWriter
  2. request
     * 类型：HttpServletRequest
  3. response
     * 类型：HttpServletResponse
  4. session
     * 类型：HttpSession
  5. exception
     * 类型：Throwable
  6. page【相当于java中的this】
     * 类型：Servlet(this)
  7. config
     * 类型：ServletConfig
  8. application【通信时候用的上下文】
     * 类型：ServletContext
  9. pageContext【当前页面的上下文】
     * 类型：PageContext
     * 作用：
       1. 用pageContext对象获得其他的8个内置对象. 用来编写一个通用性高的或者框架的时候
          * 操作其他域对象
            * 方法：xxxAttribute(...,int scope);
              * scope取值：
                1. APPLICATION_SCOPE
				2. SESSION_SCOPE
				3. REQUEST_SCOPE
				4. PAGE_SCOPE
		  * 获取其他的内置对象：
		  	* getXXX()
		  	  * getRequest()：获取request内置对象
		  * 便捷查找：
		  	* findAttribute(String key)
		  	  * 依次从pagecontext,request,session,application四个域中,查找相应的属性,若查找到了返回值,且结束该次查找；若查找不到,返回一个null
       2. 用来存取数据.向四个域中存取数据

### jsp的域对象
  1. application
     * 生命周期：整个项目
  2. session
     * 生命周期：一次会话
  3. request
     * 生命周期：一次请求
  4. pageContext
     * 生命周期：一个页面
  * 前三个是与java共有的，最后一个是jsp中所独有的

### jsp的动作标签
* 类型
  1. 请求转发
     ```
      <jsp:forward page="内部路径"></jsp:forward>
     ```
     * 相当于java中 request.getRequestDispatcher(..).forward(..);
  2. 动态包含
     ```
      <jsp:include page="内部路径"></jsp:include>
     ```
     * 就是将被包含页面或者servlet的运行结果包含到当前页面中
     * 静态包含 和 动态包含的区别:
       * 静态包含相对于代码的copy,最终被翻译成一个Servlet解释执行的
       * 动态包含,包含其他页面的运行的结果.最终翻译成多个Servlet解释执行的