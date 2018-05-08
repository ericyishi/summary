# jsp
### 概念
* java server pages(java服务器页面)
* 本质上jsp就是一个servlet,在html代码中嵌套java代码
* 运行在服务器端,处理请求,生成动态的内容.
* 对应的java和class文件在tomcat目录下的work目录
* 后缀名 .jsp

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
