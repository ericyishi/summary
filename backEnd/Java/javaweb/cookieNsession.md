# 会话技术
### 概述
* 当用户打开浏览器的时候,访问不同的资源,知道用户将浏览器关闭,可以认为这是一次会话。
* 作用：
  * 因为http协议是一个无状态的协议,它记录上次访问的内容
  * 用户在访问过程中难免会产生一些数据,通过会话技术就可以将起保存起来.
* 分类：
  1. cookie:浏览器端会话技术
  2. session:服务器端会话技术

### cookie
* cookie是由服务器生成,通过response将cookie写回浏览器(set-cookie),保留在浏览器上
* 下一次访问,浏览器根据一定的规则携带不同的cookie(通过request的头 cookie),我们服务器就可以接受cookie
* 注意事项
  * cookie不能跨浏览器
  * 不支持中文【可以通过java编码】
    ```
     URLEncoder.encode();
     URLDecoder.decode();
    ```
* 常用方法
    * 生成cookie
      ```
       Cookie c=new Cookie(String key,String value)
      ```
    * 写回浏览器:
      ```
       response.addCookie(c)
      ```
    * 获取cookie【获得的类型是Cookie[] 】:
      ```
      Cookie[] c= request.getCookies()
      ```
    * 获取cookie的key(名称)
      ```
      for(Cookie c:cookies){
         c.getName()
       }

      ```
    * 获取指定cookie的值
      ```
       for(Cookie c:cookies){
          c.getValue()
       }
    * 设置cookie在浏览器端存活时间【cookie持久化】  以秒为单位
      ```
       setMaxAge(int 秒)
      ```
       * 没有设置该属性，浏览器关闭该cookie就失效
       * 若设置成 0:删除该cookie【删除浏览记录】(前提必须路径一致)
         ```
            步骤分析:
            	1.在浏览器记录中添加一个超链接
            		<a href="/day1101/clearHistroy">清空</a>
            	2.创建servlet clearHistroy
            		创建一个cookie
            			名称路径保持一致
            			setMaxAge(0)
            		写回浏览器
            	3.页面跳转
		重定向 product_list.jsp
         ```

    * 设置cookie的路径.
      ```
       setPath(String path)
      ```
      * 默认路径：从"/项目名称"开始,到最后一个"/"结束
      * 当我们访问的路径中包含此cookie的path,则携带

    * Demo1 浏览器访问写回一个cookie
      ```
       //浏览器访问写回一个cookie
       //写在servlet里的doGet方法里
         response.setContentType("text/html;charset-utf-8");
         PrintWriter w=response.getWriter();//一个写的字符流，为了向浏览器写入内容

         Cookie a=new Cookie("akey","avalue");
         //写回浏览器
         response.addCookie(a)
         // w.print("cookie已经写回到浏览器上了")
      ```
    * Demo2 返回上次访问时间记录
      * 思路
        1. 创建一个servlet 例如路径为/lst
        2. 在servlet中创建
           1. 获取指定的cookie 例如：名为lastTime
              ```
               request.getCookies()
              ```
           2. 判断cookie是否为空：
              * 若为空:提示信息 ，第一次访问
			  * 若不为空: 获取此cookie的value，展示信息:你上次访问时间是....
		   3. 将这次访问时间记录,写会浏览器
      * 代码
        ```
         //servlet中
         //写在doGet中的方法
         response.setContentType("text/html;charset-utf-8");
         PrintWriter w=response.getWriter();
         Cookie c=getCookieByName("lastTime",request.getCookie());
         if(c==null){
           w.print("您是第一次访问！");
         }else{
           String value=c.getValue();
           long time=Long.parseLong(value);//将字符串转为long值
           Date date=new Date(time);
           w.print("您上次访问时间:"+date.toLocalString());

         }
         c=new Cookie("lastTime",new Date().getTime()+"");
         c.setMaxAge(3600);
         c.setPath(request.getContextPath());
         response.addCookie(c);
        ```
        ```
         private Cookie getCookieByName(String name,Cookie[] cookies){
          if(cookies!=null){
           for(Cookie c:cookies){
              if(name.equals(c.getName())){
               return c;
             }
           }

          }
          return null;
         }
        ```

    * demo3 记录用户浏览记录（例如访问过的商品信息）
      * 只显示三条最近访问的记录，最新的放在最左边（最前面）
      * 思路：
        1. 先将product_list.htm转成jsp的格式
        2. 点击一个商品,展示该商品的信息,将该商品id记录到cookie(Servlet的名字：GetProductById)
           * 获取之前的浏览记录 例如商品的id叫ids
           * 判断cookie是否为空
             * 若为空 将当前商品的ids 放入cookie中  ids=1
             * 若不为空,获取值 例如:ids=2-1【代表里面有两个访问记录，id为1和id为2】，使用"-",分割商品id
                * 如果当前访问的id=1 ，判断之前记录中有无该商品
                  * 若有:将当前的id放入前面  结果 ids=1-2
                  * 若没有:继续判断长度是否>=3
                     * 若>=3,移除最后一个,将当前的id放入最前面
					 * 若<3,直接将当前的id放入最前面.
		3. 再次回到product_list.jsp页面,需要将之前访问商品展示在浏览记录中
		   * 获取ids  例如:ids=2-3-1
	  * 编码：
	    ```
	     //0. 设置编码
	     //0.1 获取当前id
	       String id=request.getParameter("id");
	     //1. 获取指定的cookie-ids【自己封装的方法】
	       Cookie c=CookUtil.getCookieByName("ids",request.getCookies())
	     //2. 判断cookie是否为空
	      //3. 若cookie为空
	       if(c==null){
             ids=id;
	       }else{
            //4. 若cookie不为空
             ids=c.getValue();
             String[] arr=ids.split("-");
             //该方法是将数组转化为list
             List<String> asList=Array.aslist(arr);
             LinkedList<String> list=new LinkedList<>(asList);
             if(list.contains(id)){
             list.remove(id);
             list.addFirst(id);
             }else{
               //若ids不包含id，继续判断长度是否大于2
               if(list.size()>3){
                 list.removeLast();
                 list.addFirst(id);
               }else{
                //长度<3,放到最前面
                list.addFirst(id);
               }
             }
             ids="";
             //将list转成字符串
             for(String s:list){
               ids+=(s+"-")//就算第一次传值过来为0，但是也会加上-，所以长度就为1了
              }
              ids=ids.substring(0,ids.length()-1)
	       }


	      c=new Cookie("ids",ids);
	      //设置访问路径
	       c.setPath(request.getContextPath()+"/");
	      //设置存活时间
	       c.setMaxAge(3600);
	       /写回浏览器
	       response.addCookie(c);
	     //5. 跳转到指定的商品页面上
	      response.sendRedirect(request.getContextPath()+"/product_info"+id+".html");

	    ```
	    ```
	     //对应的jsp文件中写，返回的浏览记录
	     <ul>
	      <%
	       CookUtils.getCookiesByName("ids",request.getCookies());
	       if(c==null){
	      %>
	        <h2>暂无浏览记录</h2>
	      <%
	       }else{
             c.getValue().split("-");
             for(String id:arr){
           %>
               <li style="goods"><img src="products/1/cs1000<%=id %>.jpg"></li>
           <%
             }
	       }
	      %>
	     </ul>

	    ```
### session
* 服务器端会话技术
* 当我们第一次访问的服务器的时候,服务器获取id,
  * 能获取id
	* 要拿着这个id去服务器中查找有无此session
	  * 若查找到了:直接拿过来时候,将数据保存,需要将当前sessin的id返回给浏览器
	  * 若查找不到:创建一个session,将你的数据保存到这个session中,将当前session的id返回给浏览器
  * 不能获取id
	* 创建一个session,将你的数据保存到这个session中,将当前session的id返回给浏览器
* 获取session
  ```
    request.getSession()
  ```
* Session保存在服务器端,没有大小的限制
* 域对象session，用于保存数据
  * session存放的私有的数据，一个浏览器一个.
  * 使用
    ```
     getAttribute()
     setAttribute()
    ```
  * 作用范围：
    * 多次请求，一次会话中
  * 生命周期:
    * 创建:第一次调用request.getSession()创建
	* 销毁:
	  1. 服务器非正常关闭
		  ```
		   session超时
		   默认时间超时:30分钟  web.xml有配置
		   手动设置超时:setMaxInactiveInterval(int 秒) 了解
		  ```

	  2. 手动干掉session(★)
	     ```
	     //手动点击退出，就是调用了这个方法
	      session.invalidate()
	     ```
* demo 添加购物车
  * 思路
    1. 点击添加到购物车的时候,提交到一个servlet add2CartServlet
       * 需要将商品名称携带过去
    2. add2CartServlet中的操作
       * 获取商品的名称
	   * 将商品添加到购物车 购物车的结构 Map<String 名称,Integer 购买数量>
         * 将购物车放入session中就可以了
       * 将商品添加到购物车分析:
         * 获取购物车
		 * 判断购物车是否为空
		    * 若为空:
		      * 第一次添加
			    * 创建一个购物车
			    * 将当前商品put进去.数量:1
			    * 将购物车放入session中
		    * 若不为空:继续判断购物车中是否有该商品
		    	  * 若有:
		    		* 取出count 将数量+1
		    		* 将商品再次放入购物车中
		    	  * 若没有:
		    		* 将当前商品put进去 数量:1
	   * 提示信息:你的xx已添加到购物车中
    3. 点击购物车连接的时候 cart.jsp
    	* 从session获取购物车
    	* 判断购物车是否为空
    	  * 若为空:提示信息
    	  * 若不为空:遍历购物车即可
  * 代码
    ```
     //add2CartServlet
     //下面代码为doGet里的
     //0 设置编码
       response.setContentType("text/html;charset=utf-8");
       PrintWriter w=response.getWriter();

     //1 获取商品的名称
       String name=response.getWriter();
       name=new String(name.getBytes("iso8859-1","utf-8"));//解决乱码
     //2 将商品添加到购物车
      //2.1session中获取购物车
        Map<String,Integer> map=(Map<String,Integer>) request.getSession().getAttribute("cart");
       //2.2判断购物车是否为空
       if(map==null){
        map=new HashMap<>();
        //将购物车放入session中
        request.getSession().setAttribute("cart",map);
       }else{
         //购物车中是否有该商品
         count=map.get(name);
         if(count==null){
          count=1;
         }else{
          count++;
         }
       }
       //将商品放入购物车
       map.put(name,count);
     //3 提示信息
      w.print("已经将"+name+"添加值购物车中")
      w.print("<a href="<a href='>"+request.getContextPath()"/prodcut_list.jsp'>继续购物</a>")
      w.print("<a href="<a href='>"+request.getContextPath()"/cart.jsp'>查看购物车</a>")
    ```
* demo 清空购物车
  ```
       public class ClearCartServlet extends HttpServlet {
    	private static final long serialVersionUID = 1L;

    	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		request.getSession().removeAttribute("cart");

    		response.sendRedirect("/WEB11/cart.jsp");
    	}

    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		doGet(request, response);
    	}

    }
  ```
* demo 一次性验证码校验
  * 思路
    * 步骤一：生成验证码的时候,将随机产生的4个字母或数字存入到session中。
    * 步骤二：在页面中输入一个验证码点击登录.提交到Servlet
    * 步骤三：在Servlet中获得页面提交的验证码和session中验证码比较
    * 步骤四：将session中存的验证码清空
    * 步骤五：如果不一致返回登录页面.
    * 步骤六：如果一致,再去比较用户名和密码