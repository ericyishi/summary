# 监听器与过滤器
* 两者里面的都是接口
### 监听器Listener
* 作用：用于监听
  * 监听对象：javaweb中的三个域对象【ServletContext ServletRequest HttpSession】
  * 监听内容：
	1. 监听三个对象的创建和销毁
	   * ServletContextListener
	     * 创建:服务器启动的时候,会为每一个项目都创建一个servletContext
	     * 销毁:服务器关闭的时候,或者项目被移除的时候
	     * 实际用途：以后用来读取加载配置文件
	     * demo
	       ```
	         public class MyServletContextLis implements ServletContextListener{

             	@Override
             	public void contextInitialized(ServletContextEvent sce) {
             		//创建操作
             		System.out.println("servletcontext创建了");
             	}

             	@Override
             	public void contextDestroyed(ServletContextEvent sce) {
             		//销毁操作
             		System.out.println("servletcontext销毁了.");
             	}

             }
	       ```
	       ```
	        //WEB.XML中配置
	        <listener>
	          <listener-class>MyServletContextLis的全限定名</listener-class>
	        <listener>
	       ```
       * ServletRequestListener
         * 创建:请求来的时候
         * 销毁:响应生成的时候
         * demo
           ```
            public class MyRequestLis implements ServletRequestListener {

            	@Override
            	public void requestDestroyed(ServletRequestEvent sre) {
            		System.out.println("请求已销毁~~~");
            	}

            	@Override
            	public void requestInitialized(ServletRequestEvent sre) {
            		// TODO Auto-generated method stub
            		System.out.println("请求创建了~~~");
            	}

            }
           ```
           ```
             //WEB.XML中配置
             <listener>
               <listener-class>MyRequestLis的全限定名</listener-class>
             <listener>
           ```

       * HttpSessionListener
         * 创建:
            1. java中第一次调用request.getSession的时候
            2. 访问jsp的时候创建
         * 销毁:
            1. session超时【默认超时】
            2. 手动销毁session
            3. 服务器非正常关闭
	2. 监听三个对象属性的变化【添加、替换、删除】
	   * ServletContextAttributeListener
       * ServletRequestAttributeListener
       * HttpSessionAttributeListener
       * 可以得到具体修改了哪个属性
          ```
           scab.getName();
          ```
	3. 监听session中javabean的状态【下面两个接口需要javabean来实现，让javabean自己来感知变化】
	   * HttpSessionBindingListener(绑定和解绑)
	     * demo【这种方式不用web.xml中配置】
	       ```
	        public class Person implements HttpSessionBindingListener{
            	private int id;
            	private String name;
            	public int getId() {
            		return id;
            	}
            	public void setId(int id) {
            		this.id = id;
            	}
            	public String getName() {
            		return name;
            	}
            	public void setName(String name) {
            		this.name = name;
            	}
            	public Person() { }

            	public Person(int id, String name) {
            		this.id = id;
            		this.name = name;
            	}
            	@Override
            	//绑定到了session中
            	public void valueBound(HttpSessionBindingEvent event) {
            		System.out.println("person对象绑定到了session中");
            	}

            	@Override
            	//从session中移除
            	public void valueUnbound(HttpSessionBindingEvent event) {
            		System.out.println("person对象从session中移除了~~");
            	}

            }
	       ```
	       ```
	        //session_set.jsp中
	         <body>
             	将person对象添加到session中
             	<%
             		session.setAttribute("p", new Person(1,"tom"));

             	%>
             </body>

	       ```
	       ```
	        //session_remove.jsp中
	        将person对象从session中移除
            	<%
            		session.removeAttribute("p");
            	%>
	       ```
       * HttpSessionActivationListener(用于监听钝化和活化【硬盘与内存之间】)
         * 钝化:javabean从session中序列化到磁盘上
            * 需要序列化接口才能写入到磁盘上
              ```
               public class Person2 implements HttpSessionActivationListener,Serializable{}
              ```
            * 可以通过配置文件修改javabean什么时候钝化,节约服务器的内存资源
              * 修改一个项目，只需要在项目下/meta-info创建一个context.xml
                ```
                 <Context>
                 	<!--
                 		maxIdleSwap	:1分钟 如果session不使用就会序列化到硬盘.
                 		directory	:序列化到硬盘的文件存放的位置.
                 	-->
                 	<Manager className="org.apache.catalina.session.PersistentManager" maxIdleSwap="1">
                 		<Store className="org.apache.catalina.session.FileStore" directory="HELLO"/>
                 	</Manager>
                 </Context>
                ```

         * 活化:javabean从磁盘上加载到了session中

* 使用步骤:
  1. 编写一个类 实现接口
  2. 重写方法
  3. 编写配置文件(大部分都是)

### 过滤器Filter
* 过滤请求和响应
* 应用场景：
  1. 自动登录.
  2. 统一编码.
  3. 过滤关键字
* 注意：
  * 默认拦截是浏览器跳转的，无法拦截请求转发的
    * 需要在web.xml中配置
      ```
       <dispatcher>FORWARD</dispatcher>
      ```
      * dispatcher:
        * 匹配哪种请求【可以出现任意次】
            * 默认的是REQUEST,一旦显式的写出来哪种请求,默认就不起作用了
              * REQUEST:从浏览器发送过来的请求(默认) 理解
              * FORWARD:转发过来的请求 理解
              * ERROR:因服务器错误而发送过来的请求
              * INCLUDE:包含过来的请求
* 使用步骤：
  1. 编写一个类
	 1. 实现filter接口
	 2. 重写方法
  2. 编写配置文件
	 1. 注册filter
	 2. 绑定路径
  3. 测试
* Filter接口的方法:
  * init(FilterConfig config):初始化操作
  * doFilter(ServletRequest request, ServletResponse response, FilterChain chain):处理业务逻辑
    * FilterChain 过滤链
      * 通过chain的dofilter方法,可以将请求放行到下一个过滤器,直到最后一个过滤器放行才可以访问到servlet|jsp
      * chain.doFilter(request, response);
      * 多个Filter的执行顺序：web服务器根据Filter在web.xml中的注册filter-mapping的顺序执行的，决定先调用哪个Filter
        * 注意与servlet按照url-pattern匹配模式的顺序的区别
  * destroy() :销毁操作
    ```
     import java.io.IOException;
     import javax.servlet.Filter;
     import javax.servlet.FilterChain;
     import javax.servlet.FilterConfig;
     import javax.servlet.ServletException;
     import javax.servlet.ServletRequest;
     import javax.servlet.ServletResponse;

     public class HelloFilter implements Filter{

     	@Override
     	public void init(FilterConfig filterConfig) throws ServletException {

     	}

     	@Override
     	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
     			throws IOException, ServletException {
     		System.out.println("过滤器 hello filter 收到了请求~~~");

     		//放行,不然就无法执行实际访问servlet
     		chain.doFilter(request, response);

     		System.out.println("过滤器 hello filter 收到了响应~~~");

     	}

     	@Override
     	public void destroy() {

     	}

     }
    ```
    ```
     //配置web.xml
     <filter>
       <filter-name></filter-name>
       <filter-class></filter-class>
     </filter>
     <filter-mapping>
       <filter-name></filter-name>
       <url-pattern>与要拦截的servlet的路径一致</url-pattern>
     </filter-mapping>

    ```
* filter的生命周期
  * filter单实例多线程
  *	filter在服务器启动的时候，由服务器创建filter，调用init方法，实现初始化操作
  *	请求来的时候,创建一个线程，根据路径调用dofilter，执行业务逻辑
  *	当filter被移除的时候或者服务器正常关闭的时候，调用destory方法，执行销毁操作.

### 自动登录案例
* 步骤分析:
  1. 数据库和表
  2. 创建web项目
  	 * 导入jar包、工具类、配置文件
  3. 新建一个登录页面 表单
  4. 表单提交 loginservlet
  	 1. 接受用户名和密码
  	 2. 调用service完成登录操作,返回值User
  	 3. 判断user是否为空，提示重定向，return
  	 4. 若不为空,将user放入session中
  	    ```
  	     request.getSession().setAttribute("user",user);

  	    ```
  	 5. 判断是否勾选了自动登录
  	 6. 若勾选了:需要将用户名和密码放入cookie中。写回浏览器
  	    ```
  	     if(Constant.IS_AUTO_LOGIN.equals(request.getParameter("autoLogin"))){
  	      Cookie c=new Cookie("autologin",username+"-"+password);
  	      c.setMaxAge(3600);
  	      c.setPath(request.getContextPath()+"/");
  	      response.addCookie(c);
  	     }
         // 判断是否勾选了，记住用户名【需要编码，因为cookie不支持中文，在页面部分需要使用js来全局对象decodeURI来解码】
         if(Constant.IS_SAVE_NAME.equals(request.getParameter("saveName"))){
           Cookie c=new Cookie("savename",URLEncoder.encode(username,"utf-8"));
           c.setMaxAge(3600);
           c.setPath(request.getContextPath()+"/");
           response.addCookie(c);
         }
  	     //页面重定向
  	     response.sendRedirect(request.getContextPath()+"/success.jsp");
  	    ```
  	    ```
  	     onload=function(){

  	      var s="${cookie.savename.value}";
  	      s=decodeURI(s);//此时就是中文正常显示了

  	     }

  	    ```
  5. 下次访问网站的时候
	 1. 配置过滤器
	 2. 过滤器拦截任意请求
	    ```
	     <url-pattern>/*</url-pattern>
	    ```

	 3. 判断有无指定的cookie
	 4. 有cookie,获取用户名和密码
	 5. 调用service完成登录操作,返回user
	 6. 当user不为空的时候将user放入session中
	 * 当我们换用另一用户登录的时候发现登录不了
       	* 自动登录只需要登录一次:当session中没有用户的时候
       	* 访问有些资源是不需要自动登录的(和登录还有注册相关的资源)
       	    1. 首先判断session中是否有user
            2. 若没有，并且访问的路径不是和登录注册相关的时候，才去获取指定的cookie
            ```
                 public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
                            throws IOException, ServletException {
                        //1.强转
                        HttpServletRequest request =(HttpServletRequest) req;
                        HttpServletResponse response =(HttpServletResponse) resp;

                        //2.完成自动登录
                        //2.1 判断session中有无登录登录用户 没有的话继续自动登录
                        User user=(User) request.getSession().getAttribute("user");
                        if(user==null){
                            //没有用户  需要自动登录
                            //2.2 判断访问的资源是否和登录注册相关,若相关则不需要自动登录
                            String path = request.getRequestURI();// 获取访问的路径
                            if(!path.contains("/login")){ //与login不相关的时候，需要自动登录

                                //2.3获取指定的cookie
                                Cookie c = CookUtils.getCookieByName("autologin", request.getCookies());
                                //判断cookie是否为空
                                //若不为空 获取值(username和passowrd) 调用serivce完成登录  判断user是否为空 不为空 放入session
                                if(c!=null){
                                    String username=c.getValue().split("-")[0];
                                    String password=c.getValue().split("-")[1];

                                    //调用serivce完成登录
                                    //user=null;
                                    try {
                                        user = new UserService().login(username, password);
                                    } catch (SQLException e) {
                                        // TODO Auto-generated catch block
                                        e.printStackTrace();
                                    }

                                    if(user!=null){
                                        //将user放入session中
                                        request.getSession().setAttribute("user", user);
                                    }
                                }
                            }

                        }



                        //3.放行
                        chain.doFilter(request, response);
                    }
            ```
### 统一字符编码【**使用静态代理**】
* 以前我们开发的时候若有参数,第一步都是设置编码,才不会出现乱码,通过过滤器设置,到servlet或者jsp上的时候已经没有乱码问题
* 技术分析:
	* filter 配置路径/* 过滤器的第一个位置
	* 在filter中重写getParameter(加强)
* 步骤分析:
  1. 我们只需要在filter中对request进行加强(例如:只对request.getParameter()进行加强)
     * 方法加强:
     	1. 继承(获取构造器)
     	2. 装饰者模式(静态代理)
     	3. 动态代理
     * 装饰者书写步骤:
       1. 要求装饰者和被装饰者实现同一个接口或者继承同一个类
       2. 装饰者中要有被装饰者的引用
       3. 对需要加强方法进行加强
       4. 对不需要加强的方法调用原来的方法即可
  2. 加强request.getParameter(String key)
     * 首先请求的方式不同,处理的方式也不同
       1. 获取请求的方法,若是get请求
          ```
           new String(value.getBytes("iso8859-1"),"utf-8");
          ```

       2. 若是post请求
          ```
           只需要设置一句话
           request.setCharacterEncoding("utf-8");
          ```
    3. 最后将包装过的request对象(MyRequest)传递给servlet即可
       * 关于获取参数的方法
         1. String getParameter(String name);// arr\[0\]
         2. String\[\] getParameterValues(String name);// map.get(name)
         3. Map<String,String\[\]> getParameterMap();
* demo
  ```
    import java.io.IOException;
    import java.io.UnsupportedEncodingException;
    import java.util.Map;

    import javax.servlet.Filter;
    import javax.servlet.FilterChain;
    import javax.servlet.FilterConfig;
    import javax.servlet.ServletException;
    import javax.servlet.ServletRequest;
    import javax.servlet.ServletResponse;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletRequestWrapper;
    import javax.servlet.http.HttpServletResponse;
    /**
     * 统一编码
     * @author Administrator
     *
     */
    public class EncodingFilter implements Filter {

        @Override
        public void init(FilterConfig filterConfig) throws ServletException {
            // TODO Auto-generated method stub

        }

        @Override
        public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
            //1.强转
            HttpServletRequest request=(HttpServletRequest) req;
            HttpServletResponse response=(HttpServletResponse) resp;

            //2.放行
            chain.doFilter(new MyRequest(request), response);
        }

        @Override
        public void destroy() {
            // TODO Auto-generated method stub

        }

    }
    class MyRequest extends HttpServletRequestWrapper{
        private HttpServletRequest request;
        private boolean flag=true;


        public MyRequest(HttpServletRequest request) {
            super(request);
            this.request=request;
        }

        @Override
        public String getParameter(String name) {
            if(name==null || name.trim().length()==0){
                return null;
            }
            String[] values = getParameterValues(name);
            if(values==null || values.length==0){
                return null;
            }

            return values[0];
        }

        @Override
        /**
         * hobby=[eat,drink]
         */
        public String[] getParameterValues(String name) {
            if(name==null || name.trim().length()==0){
                return null;
            }
            Map<String, String[]> map = getParameterMap();
            if(map==null || map.size()==0){
                return null;
            }

            return map.get(name);
        }

        @Override
        /**
         * map{ username=[tom],password=[123],hobby=[eat,drink]}
         */
        public Map<String,String[]> getParameterMap() {
             //需要加强的方法
            /**
             * 首先判断请求方式
             * 若为post  request.setchar...(utf-8)
             * 若为get 将map中的值遍历编码就可以了
             */
            String method = request.getMethod();
            if("post".equalsIgnoreCase(method)){
                try {
                    request.setCharacterEncoding("utf-8");
                    return request.getParameterMap();
                } catch (UnsupportedEncodingException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }else if("get".equalsIgnoreCase(method)){
                Map<String,String[]> map = request.getParameterMap();
                if(flag){
                    for (String key:map.keySet()) {
                        String[] arr = map.get(key);
                        //继续遍历数组
                        for(int i=0;i<arr.length;i++){
                            //编码
                            try {
                                arr[i]=new String(arr[i].getBytes("iso8859-1"),"utf-8");
                            } catch (UnsupportedEncodingException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                    flag=false;
                }
                //需要遍历map 修改value的每一个数据的编码

                return map;
            }

            return super.getParameterMap();
        }

    }
  ```
### 类加载器
* 概念
    * 类加载：我们编写的.java文件,jvm会将变成.class文件.该文件要想运行,必须加载内存中,然后会生成一个对象.Class对象
    * 类加载器：实现类加载的东西，就是类加载器
* 类加载的种类
  * 引导类加载器	rt.jar【核心类都在这个这个jar包中】
  * 扩展类加载器	ext/*.jar【基本用不到】
  * 应用类加载器	我们自己编写类
* 全盘负责委托机制
  * 当一个类运行的时候,有可能有其他类,应用类加载器询问扩展类加载器:你加载过这些类吗?
  * 扩展类加载器在向上问(引导类加载器):你加载过这些类吗?
  * 引导类加载器:我查查,有一个是我负责,我加载.
  * 扩展类加载器:接下来我来查,有几个是我负责,我加载,还有几个类我已经加载完成了,你可以直接使用
  * 应用类加载器:收到了 剩下的我来
* 动态代理
  * 在项目运行的时候才创建一个代理对象,对方法进行增强(控制)
  * 实现的方式
    * 方式1:
		* jdk中Proxy类,前提:实现接口
		  * 动态的在内存中创建一个代理对象
		    ```
		     Object Proxy.newProxyInstance(ClassLoader loader, Class[] interfaces, InvocationHandler h)
		    ```
		    * 参数说明:
			  1. ClassLoader:代理对象类加载器 一般我们使用的是被代理对象的类加载器
			  2. Class[]:代理对象需要实现接口 一般我们使用的是被搭理对象所实现的所有接口
			  3. InvocationHandler:执行处理类.在这里面对方法进行加强
                 * invocationHandler中只有一个方法
                   ```
                    Object invoke(Object proxy, Method method, Object[] args)
                   ```
                   * 参数说明
                   1. proxy:代理对象
				   2. method:当前执行的方法
				   3. args:当前方法执行的时候所需要的参数
				   4. 返回值:就是当前method对象执行的返回值
		  * demo
		  	```
		  	//Car.java 定义一个车的接口
            package com.test.c_proxy;

            public interface Car {
                void run();
                void stop();
            }

		  	 //  QQ.java 一个qq车实现类
            package com.test.c_proxy;

            public class QQ implements Car{

                @Override
                public void run() {
                    System.out.println("qq在跑");
                }

                @Override
                public void stop() {
                    System.out.println("qq刹车");
                }

            }

		  	// Test.java 测试类
            package com.test.c_proxy;

            import java.lang.reflect.InvocationHandler;
            import java.lang.reflect.Method;
            import java.lang.reflect.Proxy;

            public class Test {

                public static void main(String[] args) {
                    final QQ qq=new QQ();
                    //qq.run();
                    //qq.stop();

                    //创建代理对象
                    Car qqProxy=(Car) Proxy.newProxyInstance(QQ.class.getClassLoader(), new Class[]{Car.class}, new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            //System.out.println("哈哈哈哈");
                            //System.out.println(method.getName());
                            //obj 就是代理对象
                            //Object obj=method.invoke(qq, args);
                            //return obj;

                            //对所有方法进行加强
                            /*System.out.println("加上电池");
                            Object obj = method.invoke(qq, args);
                            System.out.println("5秒破百");

                            return obj;*/


                            //只对run方法进行加强,通过method.getName()来区分调用的方法
                            if("run".equals(method.getName())){
                                System.out.println("加上电池");
                                Object obj = method.invoke(qq, args);
                                System.out.println("5秒破百");
                                return obj;
                            }
                            return method.invoke(qq, args);//其他的还是调用默认的方法
                        }
                    });

                    qqProxy.run();//加上电池了
                    qqProxy.stop();//原来的“qq刹车”
                }

            }

		  	```

	* 方式2:
		* spring中cglib,前提:继承类

* demo:使用**动态代理**在过滤器中完成统一编码
  * 动态代理可以想象成孙悟空拔猴毛变万物
  * 静态代理可以想象成钢铁侠穿上装备，只是包装了一下
  ```
   //LoginServlet.java
    package com.test.c_proxy.encoding;

    import java.io.IOException;
    import javax.servlet.ServletException;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;

    public class LoginServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String username = request.getParameter("username");
            String memo = request.getParameter("memo");

            System.out.println(username);
            System.out.println(memo);
        }

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // TODO Auto-generated method stub
            doGet(request, response);
        }

    }
   // EncodingFilter.java

        package com.test.c_proxy.encoding;
        import java.io.IOException;
        import java.lang.reflect.InvocationHandler;
        import java.lang.reflect.Method;
        import java.lang.reflect.Proxy;
        import javax.servlet.Filter;
        import javax.servlet.FilterChain;
        import javax.servlet.FilterConfig;
        import javax.servlet.ServletException;
        import javax.servlet.ServletRequest;
        import javax.servlet.ServletResponse;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;

        public class EncodingFilter implements Filter {

            @Override
            public void init(FilterConfig filterConfig) throws ServletException {

            }

            @Override
            public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
                    throws IOException, ServletException {
                //1.强转
                final HttpServletRequest request=(HttpServletRequest) req;
                HttpServletResponse response=(HttpServletResponse) resp;


                //创建代理对象
                // request.getClass().getInterfaces()获取所有接口
                HttpServletRequest requestProxy=(HttpServletRequest) Proxy.newProxyInstance(HttpServletRequest.class.getClassLoader(), request.getClass().getInterfaces(), new InvocationHandler() {

                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                        if("getParameter".equals(method.getName())){
                            //获取请求方式
                            String m = request.getMethod();

                            if("get".equalsIgnoreCase(m)){
                                String s = (String) method.invoke(request, args);//相当于  request.getParameter(args);
                                return new String(s.getBytes("iso8859-1"),"utf-8");
                            }else if("post".equalsIgnoreCase(m)){
                                request.setCharacterEncoding("utf-8");
                                return method.invoke(request, args);
                            }
                        }

                        //不需要加强的方法
                        return method.invoke(request, args);
                    }
                });

                //2.放行
                chain.doFilter(requestProxy, response);

            }

            @Override
            public void destroy() {

            }

        }

   //web.xml中的配置
        <filter>
            <filter-name>EncodingFilter</filter-name>
            <filter-class>com.test.c_proxy.encoding.EncodingFilter</filter-class>
        </filter>
        <filter-mapping>
            <filter-name>EncodingFilter</filter-name>
            <url-pattern>/login</url-pattern>
        </filter-mapping>
        <servlet>
          <description></description>
          <display-name>LoginServlet</display-name>
          <servlet-name>LoginServlet</servlet-name>
          <servlet-class>com.test.c_proxy.encoding.LoginServlet</servlet-class>
        </servlet>
        <servlet-mapping>
          <servlet-name>LoginServlet</servlet-name>
          <url-pattern>/login</url-pattern>
        </servlet-mapping>
  ```