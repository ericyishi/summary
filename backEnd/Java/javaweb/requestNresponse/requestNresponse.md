# request与reponse
### response响应
* 作用：往浏览器中写东西
* 组成三部分：
  1. 响应行
     * 协议/版本 状态码 状态码说明
       ```
        HTTP/1.1 200 OK
       ```
       * 状态码
         ```
                1xx:已发送请求
		        2xx:已完成响应
		        	200:正常响应
		        3xx:还需浏览器进一步操作
		        	302:重定向 配合响应头:location
		        	304:读缓存
		        4xx:用户操作错误
		        	404:用户操作错误.
		        	405:访问的方法不存在
		        5xx:服务器错误
		        	500:内部异常
         ```
         1. 设置状态码
            * 常用方法:
			     * setStatus(int 状态码):针对于 1XX 2XX 3XX
			     * sendError(int 状态码):针对于 4xx和5xx
  2. 响应头
      *
      * 操作响应头
        * 格式:key/value(value可以是多个值)
        * 常用方法
          * setHeader(String key,String value):设置字符串形式的响应头
          * setIntHeader(String key,int value):设值整形的响应头
          * setDateHeader(String key,long value):设值时间的响应头
          * addHeader(String key,String value):添加置字符串形式的响应头 之前设置过则追加,若没有设置过则设置
          * addIntHeader(String key,int value):添加整形的响应头
          * addDateHeader(String key,long value):添加时间的响应头
        * 常用响应头
          * location:重定向
		  * refresh:定时刷新
		  * content-type:设置文件的mime类型,以及设置响应流的编码及告诉浏览器用什么编码打开，例如text/html
		  * content-disposition:文件下载需要的响应头
		* 应用
          1. 重定向
             * 方法1(推荐，是下面方法的合并)：
                ```
                 response.sendRedirect("/project/servlet2");
                 //浏览器向servlet1请求，servlet1直接告诉浏览器访问servlet2，浏览器主动访问servlet2
                ```
             * 方法2：
                ```
                 response.setStatus(302);
                 respooen.setHeader("/project/servlet2")
                ```
          2. 定时刷新
             * 方法1：
               ```
                response.setHeader("refresh","秒数;url=跳转的路径");
               ```
             * 方法2【html页面内写。http的meta标签】：
               ```
                //进入这个html页面，3秒后跳转至refresh2.html页面
                <meta http-equiv="refresh" content="3;url=/day10/refresh2.html">
               ```
               * 倒计时使用js，查看servlet.md里面有记录如何使用
  3. 响应体
     * 页面上要展示东西
     * 操作响应体常用方法
       * Writer getWriter():字符流
         ```
          PrintWriter w=response.getWriter();
          w.print("<table border='1'><tr>");
          w.print("<td>用户名</td>")
          w.print("<td>张三</td>")
          w.print("</tr></table>")
         ```
       * ServletOutputStream getOutputStream() :字节流
          ```
           ServletOutputStream os=response.getOutputStream();

          ```
          * 自己写的东西用字符流,其他(图片，音乐)一概用字节流.
          * 上面两种方式都要防止乱码
              ```
                  处理响应中文乱码,写在getWriter前面:
			           方式1:★
			         	response.setContentType("text/html;charset=utf-8");
			           方式2:理解
			      	    response.setHeader("content-type", "text/html;charset=utf-8");
              ```
          * 注意:上面两种流互斥，只能用一个
			 * 当响应完成之后,服务器会判断一下流是否已经关闭,若没有关闭,服务器会帮我们关闭.(底层使用的缓冲流)
	 * 应用
	   * 文件下载:
	     1. 方式一：超链接下载【用得少】
	        ```
	         <a href="/day10/download/day10.txt">下载 day10.txt</a>
	        ```
	         * 若浏览器能解析该资源的mime类型,则打开：图片、txt文件等;若不能接下则下载;
	     2. 方式二：编码下载【通过servlet完成】
	        ```
	         1. 前端页面还是写a标签，只是访问的路径是一个servlet
	          <a href="/day10/download?name=day10.txt">下载 day10.txt</a>
	        ```
	        1. 设置文件mime类型
	               ```
	                  String mimeType=context.getMimeType(文件名)
				      response.setContentType(mimeType);
	               ```
	        2. 设置下载头信息(content-disposition)
	           ```
	            response.setHeader("content-disposition", "attachment;filename="+文件名称);
	           ```

	        3. 提供流
	           ```
	            response.getOutputStream();
	           ```

	        * 代码
	          ```
	           //DownloadServlet
	           //下面代码是写在doGet()方法里
	            String filename=request.getParameter("name");
	            ServletContext context=this.getServletContext();
                String mimeType=context.getMime(filename)
                response.setContentType(mimeType)

               //设置下载头信息
                response.setHeader("content-disposition","attachment;filename="+filename)
               // 3.对拷流(读取输入流然后输出)
               //获取输入流
                InputStream is=context.getResourceAsStream("/download/"+filename)
	           //获取输出流
	            ServletOutputStream os=response.getOutputStream();
	            int len=-1
	            byte[] b=new byte[1024];
	            while((len=is.read(b))!=-1){
	             os.write(b,0,len);
	            }
	            os.close();
	            is.close();
	          ```
	          * 上面写法太繁琐，引入commons-io.jar使用对拷流
	            ```
	             IOUtils.copy(is,os);
	             os.close();
	             is.close();
	            ```
	          * 例外如果文件名是中文的，上面下载也会出现乱码问题
	            * 原因：
	              * 常见的浏览器需要提供文件名称的utf-8编码
	              * 对于火狐来说需要提供文件名称的base64编码
	            * 方式1：自己写DownLoadUtils工具包
	              ```
	                String _filename=DownLoadUtils.getName(request.getHeader("user-agent"), filename);
		            response.setHeader("content-disposition", "attachment;filename="+_filename);
	              ```
	              * DownLoadUtils.jar已经上传至该文件夹下
	            * 方式2：网络上的方式 (8成好使)
	              ```
	               response.setHeader("content-disposition", "attachment;filename="+new String(filename.getBytes("gbk"),"iso8859-1"));

	              ```

       * 验证码案例
         ```
          前端页面
          <img alt="验证码" src="/day10/code" title="看不清换一张" onclick="changePic(this)">
          //src对应的是后端servlet的一个路径

          function changePic(obj){
            obj.src="/day10/code?i="+Math.random() //避免缓存
          }
         ```
         * 直接使用即可
         ```
          import java.awt.Color;
          import java.awt.Font;
          import java.awt.Graphics;
          import java.awt.Graphics2D;
          import java.awt.image.BufferedImage;
          import java.io.IOException;
          import java.util.Random;

          import javax.imageio.ImageIO;
          import javax.servlet.ServletException;
          import javax.servlet.http.HttpServlet;
          import javax.servlet.http.HttpServletRequest;
          import javax.servlet.http.HttpServletResponse;

          public class CodeServlet extends HttpServlet {

                public void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {

                    // 使用java图形界面技术绘制一张图片

                    int charNum = 4;
                    int width = 30 * 4;
                    int height = 30;

                    // 1. 创建一张内存图片
                    BufferedImage bufferedImage = new BufferedImage(width, height,
                            BufferedImage.TYPE_INT_RGB);

                    // 2.获得绘图对象
                    Graphics graphics = bufferedImage.getGraphics();

                    // 3、绘制背景颜色
                    graphics.setColor(Color.YELLOW);
                    graphics.fillRect(0, 0, width, height);

                    // 4、绘制图片边框
                    graphics.setColor(Color.BLUE);
                    graphics.drawRect(0, 0, width - 1, height - 1);

                    // 5、输出验证码内容
                    graphics.setColor(Color.RED);
                    graphics.setFont(new Font("宋体", Font.BOLD, 20));

                    // 随机输出4个字符
                    Graphics2D graphics2d = (Graphics2D) graphics;
                     String s = "ABCDEFGHGKLMNPQRSTUVWXYZ23456789";
                    Random random = new Random();
                    //session中要用到
                    String msg="";
                    int x = 5;
                    for (int i = 0; i < 4; i++) {
                        int index = random.nextInt(32);
                        String content = String.valueOf(s.charAt(index));
                        msg+=content;
                        double theta = random.nextInt(45) * Math.PI / 180;
                        //让字体扭曲
                        graphics2d.rotate(theta, x, 18);
                        graphics2d.drawString(content, x, 18);
                        graphics2d.rotate(-theta, x, 18);
                        x += 30;
                    }

                    // 6、绘制干扰线
                    graphics.setColor(Color.GRAY);
                    for (int i = 0; i < 5; i++) {
                        int x1 = random.nextInt(width);
                        int x2 = random.nextInt(width);

                        int y1 = random.nextInt(height);
                        int y2 = random.nextInt(height);
                        graphics.drawLine(x1, y1, x2, y2);
                    }

                    // 释放资源
                    graphics.dispose();

                    // 图片输出 ImageIO
                    ImageIO.write(bufferedImage, "jpg", response.getOutputStream());


                }


            public void doPost(HttpServletRequest request, HttpServletResponse response)
                    throws ServletException, IOException {

            }

          }

         ```
### request请求
* 作用：获取浏览器发送过来的数据
* 组成三部分：
  1. 请求行
     * 请求方式 请求资源 协议/版本
       ```
        POST /DemoEE/form.html HTTP/1.1
       ```
     * 常用方法【HttpServletRequest下面查看】
       * String getMethod() 获取请求方式【常用】
       * String getRemoteAddr() 获取ip地址【常用】
       * String getContextPath()  在java中获取项目名称 【常用】
       * getRequestURL().toString()  获取带协议的完整路径
       * getRequestURI() 从项目名开始到参数前的内容 /tmall/sigin
       * String getQueryString() get请求的所有参数 username=tom&password=123
       * String getProtocol() 获取协议和版本
  2. 请求头
     * 格式：key/value方式（value可以多个值）
     * 常用方法
       * String getHeader(String key):通过key获取指定的value (一个值的时候用)
       * Enumeration getHeaders(String name) :通过key获取指定的value(多个)
       * Enumeration getHeaderNames() :获取所有的请求头的名称
       * int getIntHeader(String key):获取整型的请求头
       * long getDateHeader(String key):获取时间的请求头
     * 重要属性
       * user-agent:浏览器内核 msie firefox chrome
         ```
          String agent=request.getHeader("user-agent");
         ```
	   * referer:页面从哪里来的 防盗链【但这种方式用得少，因为无法被百度收录】
	     ```
	      String referer=request.getHeader("referer");
	     ```
	      * 如果referer为null，则是通过浏览器地址栏直接输入的
	      * 如果是referer.contains("localhost")则是本机自己点的

  3. 请求参数【重点】
     * get方式参数是在url后面
     * post方式是请求体里面
     * 常用方法:
        * String getParameter(String key):获取一个值
		* String[] getParameterValues(String key):通过一个key获取多个值【返回的是数组】
		* Map<String,String[]> getParameterMap():获取所有的参数名称和值
		```
		 //index.html
		 <a href="/day10/param?username=tom&password=123&hobby=drink&hobby=sleep">f_请求参数</a><br>
		```
		```
            public class ParamServlet extends HttpServlet {
            	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            		//获取username
            		String username = request.getParameter("username");
            		System.out.println("username:"+username);//username:tom

            		//获取爱好 多个值
            		String[] hobby = request.getParameterValues("hobby");
            		System.out.println("hobby:"+Arrays.toString(hobby));//hobby:[drink, sleep]

            		//获取所有
            		System.out.println("============");
            		Map<String, String[]> map = request.getParameterMap();
            		for(String key:map.keySet()){
            			System.out.println(key+"::"+Arrays.toString(map.get(key)));
            		}
            		// username::[tom]
		            // password::[123]
		           // hobby::[drink, sleep]
            	}
            	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            		doGet(request, response);
            	}

            }
		```
       * 解决服务器端接收request中文乱码案例
         ```
            <form action="/day10/param_" method="post">
            		用户名:<input name="username"><br/>
            		密码:<input name="password"><br/>
            		<input type="submit">
            </form>
         ```
         ```
            public class Param_Servlet extends HttpServlet {
            	private static final long serialVersionUID = 1L;

            	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            		doPost(request, response);
            	}

            	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            		//设置编码
            		request.setCharacterEncoding("utf-8");

            		//获取用户名和密码:
            		String username = request.getParameter("username");
            		String password = request.getParameter("password");

            		//username=new String(username.getBytes("iso8859-1"),"utf-8");


            		System.out.println(username+"::"+password);
            	}

            }
         ```
         * 无论是get或者post，如果是传入中文，服务器端request.getParameter()参数是会出现乱码的。
         * 产生原因：
           1. 对于get请求:参数追加到地址栏,会使用utf-8编码,服务器(tomcat7)接受到请求之后,使用iso-8859-1解码,所以会出现乱码
           2. 对于post请求,参数是放在请求体中,服务器获取请求体的时候使用iso-8859-1解码,也会出现乱码
         * 解决办法：
           * 通用的方法:
             ```
              new String(参数.getBytes("iso-8859-1"),"utf-8");
             ```
           * 针对于post请求来说:只需要将请求流的编码设置成utf-8即可【get方式没用】
             ```
              request.setCharacterEncoding("utf-8");
             ```
* ***域对象request***
* request:
  * 创建:一次请求来的时候
  * 销毁:响应生成的时候
  * 作用:一次请求里面的数据
* 请求转发(请求链,请求串)
   * 将多个servlet串起来，值传递
  	  ```
  	   request.getRequestDispatcher("内部路径").forward(request,response);
  	  ```
  	* url-pattern里面的值
  	  ```
  	  //diservlet1
       request.setAttribute("username",request.getParameter("username"))
  	   request.getRequestDispatcher("/diservlet2").forward(request,response);
  	  ```
  	* 就能将原来请求servlet1内部转向了diservlet2，浏览器只请求了1次，且向servlet1发送的请求
  	  ```
  	   //diservlet2
  	   System.out.println("你好"+request.getArribute("username"))
  	  ```
  	  * 最后服务器就能直接输出你好，xxx
### 注册案例
1. 数据库与表
2. 前端
   * 表单提交到一个servlet(RegistServlet)
3. 后端
   1. RegistServlet
      1. 接受数据,封装成一个user
         * 使用apache提供的jar包
           ```
            commons-beanutils.jar
            commons-logging.jar
           ```
           ```
            调用 BeanUtils.populate(Object bean,Map<> 参数);
           ```
           ```
            User user=new User();
            try{
             BeanUtils.populate(user,request.getParameterMap())
             int i=UserService().regist(user);
            }catch(Exception e){
             e.printStackTrace();
             throw new RuntimeException()
            }

           ```
      2. 调用UserSerivce完成保存操作  int regist(User user)
      3. 判断结果是否符合我们预期
         * 若int=1; 插入成功
  	     * 若int!=1; 插入失败
      * 相应的提示信息在当前的servlet不做处理,将信息**转发**给另一个servlet展示(MsgServlet);
   2. UserService
      * 调用dao
   3. userdao 通过dbutils在数据库中插入一条记录.
### 请求转发和重定向区别:
* 重定向发送两次请求,请求转发一次请求
* 重定向地址栏发生该表,请求转发不变
* 重定向是从浏览器发送,请求转发是服务器内部
* 重定向不存在request域对象,请求转发可以使用request域对象
* 重定向是response的方法,请求转发是request的方法
* 重定向可以请求站外资源,请求转发不可以