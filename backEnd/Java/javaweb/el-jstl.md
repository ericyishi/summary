# el与jstl
### el
1. 概念
* jsp的内置表达式语言
* 用来替代<%=...%>
* 作用：
  1. 获取域中数据 ★
  2. 执行运算 ★
  3. 获取常见的web对象
  4. 调用java的方法
* 格式：
  ```
   ${el表达式}
  ```
  * demo
    ```
	    <%
	    	request.setAttribute("rkey", "rvalue");
	    	session.setAttribute("skey", "svalue");
	    	session.setAttribute("rkey", "svalue");
	    	application.setAttribute("akey", "avalue");
	    %>
	    获取request中的数据:<br>
	    老方式:<%=request.getAttribute("rkey") %><br/>
	    el方式:${requestScope.rkey }<br/>
	    <hr>

	    获取session中的数据:<br>
	    老方式:<%=session.getAttribute("skey") %><br/>
	    el方式:${sessionScope.skey }<br/>
	    <hr>

	    获取application中的数据:<br>
	    老方式:<%=application.getAttribute("akey") %><br/>
	    el方式:${applicationScope.akey }<br/>

	    <hr>
	    获取失败老方式:<%=application.getAttribute("aakey") %><br/>
	    获取失败el方式:${applicationScope.aakey }

	    <hr>

    ```
    ```
     便捷获取:
	   ${skey },${rkey },${aakey },${akey}

    ```
    * 如果使用便捷方式，出现重复的key值，那么底层使用的是 findAttribute(String key)
	   * 依次从pagecontext,request,session,application四个域中,查找相应的属性,若查找到了返回值,且结束该次查找
* 获取域中数据:★
  1. 获取简单数据
     ```
      ${pageScope|requestScope|sessionScope|applicationScope.属性名}
     ```
  2. 获取复杂数据
     * 获取数组中的数据
       * 格式
          ```
           ${域中的名称[index]}
          ```
       * demo
          ```
              <%
	  	     //往request域中放入数组
	  	     request.setAttribute("arr", new String[]{"aa","bb","cc"});
	          %>

	          获取域中的数组:<br>
	          老方式:<%=((String[])request.getAttribute("arr"))[1] %><br>
	          el方式:${arr[1] }<br>
          ```
     * 获取集合list中的数据
       * 格式
         ```
           ${域中的名称[index]}
         ```
       * demo
          ```
              <%
	   	       //往request域中放入list
	   	       List list=new ArrayList();
	   	       list.add("aaa");
	   	       list.add("bbb");
	   	       list.add("ccc");
	   	       request.setAttribute("list", list);
              %>
              获取域中的list:<br>
	          老方式:<%=((List)request.getAttribute("list")).get(1) %><br>
	          el方式:${list[1] }<br>
	          list的长度:${list.size()}
          ```
     * 获取集合map中的数据
       * 格式
         ```
          ${域中的名称.键名}
         ```
       * demo
         ```
              <%
               //往request域中放入map
	 	        Map m=new HashMap();
	 	        m.put("username","tom");
	 	        m.put("age",18);
	 	        request.setAttribute("map", m);
               %>
	 	        获取域中的map:<br>
	           老方式:<%=((Map)request.getAttribute("map")).get("age") %><br>
	           el方式:${map.age }<br>
         ```
     * 获取特殊名字的数据
       ```
        //往域中放入一个简单数据
		    request.setAttribute("arr.age","18");
            ${requestScope["arr.age"] }
       ```
  3. javabean导航
     * 概念
       * javabean:java语言编写的一个可重用的组件
       * 狭义上来说就是我们编写的一个普通的java类 例如:User Person
       * javabean规范:
         1. 必须是一个公共的具体的类  public class
		 2. 提供私有的字段  private String id;//id称之为字段
		 3. 提供公共访问字段的方法 get|set|is方法
		    ```
		     public String getId(){..}// id就是一个bean属性
		    ```
		     * 一旦有公共的方法之后,get|set|is之后的内容,将首字母小写,将这个东西称之为bean属性

		 4. 提供一个无参的构造器
		 5. 一般实现序列化接口  serializable
	   * demo
	     ```
            <%
            	User u=new User();
            	u.setId("001");
            	u.setName("tom");
            	u.setPassword("123");

            	//将u放入域中
            	request.setAttribute("user", u);
            %>
            获取域中javabean的id值:<br>
            老方式:<%=((User)request.getAttribute("user")).getId() %><br/>
            el方式:${user.id }<!-- 相当于调用 getXxx() -->

            <hr>
            el获取name:${user.name }<br>
            错误演示:${user.username }// username是User类的字段，注意属性和字段在概念上的区别
	     ```
	     ```
	     //User.java
            public class User {
            	private String id;
            	private String username;
            	private String password;
            	public String getId() {
            		return id;
            	}
            	public void setId(String id) {
            		this.id = id;
            	}
            	public String getName() {//这里故意改成Name，是为了说明字段与属性的区别
            		return username;
            	}
            	public void setName(String username) {
            		this.username = username;
            	}
            	public String getPassword() {
            		return password;
            	}
            	public void setPassword(String password) {
            		this.password = password;
            	}


            }
	     ```