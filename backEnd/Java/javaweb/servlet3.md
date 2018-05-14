# servlet 3.0
* 3.0支持注解开发,没有web.xml这个文件了
* 内嵌了文件上传功能,但是2是不支持的

### 注解开发
* 不用在web.xml文件中配置了，直接在注释上配置即可。
* 创建servlet
	* 在类上面添加 @WebServlet(urlPatterns={ "/demo2", "/demo21" },loadOnStartup=2)
* 创建listener
	* 在类上添加 @WebListener
* 创建filter
	* 在类上添加 @WebFilter(urlPatterns="/*")

### 文件上传
* 浏览器端的要求:
   * 表单的提交方法必须是post
   * 必须有一个文件上传组件  <input type="file" name=""/>
   * **必须设置表单的enctype=multipart/form-data**，这个必须设置，否则获取的只是一个文件名
   ```
    <form action="/HelloWorld/UpLoad" method="post" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="submit" name="upload" value="上传">
    </form>
   ```
* 服务器端的要求:
   * 必须是servlet3.0，才能够支持文件上传
   * 需要在servlet中添加注解,说明该Servlet处理的是multipart/form-data类型的请求
	  ```
	   @MultipartConfig
	  ```

   * 接受普通上传组件 (除了文件上传组件)
     ```
      request.getParameter(name属性的值)
     ```
   * 接受文件上传组件:这里name是指前端input上面的name属性的值:
     ```
      Part part=request.getPart(name属性的值);
     ```
   	 * getName():获取的name的属性值
   * 获取文件名【文件名在请求头里面】:
     ```
      part.getHeader("Content-Disposition"):获取头信息,然后截取
     ```
   ```
    /*UpLoad.java为上传文件的Servlet类*/
    package javaee.servlet;
    import …………
    //设置访问调用这个Servlet的路径
    @WebServlet("/UpLoad")
    //说明该Servlet处理的是multipart/form-data类型的请求
    @MultipartConfig
    public class UpLoad extends HttpServlet{
        private static final long serialVersionUID = 1L;
        public UpLoad(){
            super();
        }
        protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
            this.doPost(request, response);
        }
        protected void doPost(HttpServletRequest request,HttpServletResponse response)
                throws ServletException,IOException{
            //说明输入的请求信息采用UTF-8编码方式
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            //Servlet3.0中新引入的方法，用来处理multipart/form-data类型编码的表单
            Part part = request.getPart("file");
            //获取HTTP头信息headerInfo=（form-data; name="file" filename="文件名"）
            String headerInfo = part.getHeader("content-disposition");
            //从HTTP头信息中获取文件名fileName=（文件名）
            String fileName = headerInfo.substring(headerInfo.lastIndexOf("=") + 2, headerInfo.length() - 1);
            //获得存储上传文件的文件夹路径
            String fileSavingFolder = this.getServletContext().getRealPath("/UpLoad");
            //获得存储上传文件的完整路径（文件夹路径+文件名）
            //文件夹位置固定，文件夹采用与上传文件的原始名字相同
            String fileSavingPath = fileSavingFolder + File.separator + fileName;
            //如果存储上传文件的文件夹不存在，则创建文件夹
            File f = new File(fileSavingFolder + File.separator);
            if(!f.exists()){
                f.mkdirs();
            }
            //将上传的文件内容写入服务器文件中
            part.write(fileSavingPath);
            //输出上传成功信息
            out.println("文件上传成功~！");
        }
    }
   ```
* 上传注意的问题
  1. 名字重复，采用随机生成名称
	 * 具体操作：在数据库中提供两个字段：
	   * 一个字段用来存放文件的用户上传的时候的真实名称  1.jpg
	   * 另一个字段用来存放文件存放路径  g:/sdfasdf.jpg
	 * 随机名称的方法:
	   * uuid
	   * 时间戳
  2. 文件安全
	 * 重要的文件存放在 web-inf 或者 meta-inf或者服务器创建一个路径【使用这一条是浏览器无法获取的】
	 * 不是很重要的文件 项目下

  3. 文件存放目录
		方式1:按日期
		方式2:按用户
		方式3:按固定文件的个数划分一个文件夹
		方式4:随机目录
			mkdirs()

  4. 存储
     1. 可以使用对拷流
     2. 也可以使用common-io.jar包
