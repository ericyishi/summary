# Servlet
### 概念
* 动态的web开发技术,本质就是一个类,运行在服务器端的一个java小程序
* 处理客户端的请求，并且对请求作出响应
* 处理业务逻辑,生成动态web内容

### 编写一个servlet步骤
1. 编写一个类
		a.继承HttpServlet
		b.重写doGet或者doPost方法
2. 编写配置文件(在web-inf/web.xml中)
	a.注册servlet
	b.绑定路径（访问的时候路径）
3. 访问
	http://主机:端口号/项目名/路径