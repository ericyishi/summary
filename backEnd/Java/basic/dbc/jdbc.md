# JDBC
### 概念
* JDBC（Java Data Base Connectivity,java数据库连接）是一种用于执行SQL语句的Java API，可以为多种关系数据库提供统一访问，它由一组用Java语言编写的类和接口组成。是Java访问数据库的标准规范
* JDBC需要连接驱动，不同的数据库管理系统就是用不同的驱动。
* JDBC是接口，驱动是接口的实现，没有驱动将无法完成数据库连接，从而不能操作数据库！每个数据库厂商都需要提供自己的驱动，用来连接自己公司的数据库，也就是说驱动一般都由数据库生成厂商提供。
### JDBC开发步骤
1. 注册驱动.
   * 首先创建lib目录，用于存放当前项目需要的所有jar包
   * 将数据库驱动包放入其中
   * 点击右键build path / Add to Build Path
   * JDBC规范定义驱动接口：java.sql.Driver，MySql驱动包提供了实现类：com.mysql.jdbc.Driver
     ```
      DriverManager.registerDriver(new com.mysql.jdbc.Driver());
     ```
     * DriverManager工具类，提供注册驱动的方法 registerDriver()，方法的参数是java.sql.Driver
     * 但是不推荐上面的写法:
       1. 硬编码，后期不易于程序扩展和维护
       2. 驱动被注册两次。
   * 通常开发我们使用Class.forName() 加载一个使用字符串描述的驱动类。
     * 如果使用Class.forName()将类加载到内存，该类的静态代码将自动执行。
       ```
        public class JDBCDemo {
	   	  	public static void main(String[] args)throws ClassNotFoundException,SQLException{

	   	  		Class.forName("com.mysql.jdbc.Driver");
	   	  	}
	   	  }
       ```

2. 获得连接.
   ```
    String url = "jdbc:mysql://localhost:3306/mybase";
    String username="root";
    String password="123";
    Connection con = DriverManager.getConnection(url, username, password);
   ```
3. 获得语句执行平台
   ```
    Statement stat = con.createStatement();

   ```
   * 获得语句执行平台, 通过数据库连接对象,获取到SQL语句的执行者对象
4. 执行sql语句
   * 常用方法：
     * int executeUpdate(String sql); --执行insert update delete语句.
       ```
        stat.executeUpdate("INSERT INTO sort(sname,sprice,sdesc) VALUES('sony电视机',5000,'疯狂涨价')");
       ```
     * ResultSet executeQuery(String sql); --执行select语句.
     * boolean execute(String sql); --执行select返回true 执行其他的语句返回false.
5. 处理结果集
   * 主要是对查询DQL做处理，执行insert、update、delete无需处理
   * ResultSet实际上就是一张二维的表格，我们可以调用其boolean next()方法指向某行记录，当第一次调用next()方法时，便指向第一行记录的位置，这时就可以使用ResultSet提供的getXXX(int col)方法(与索引从0开始不同，列从1开始)来获取指定列的数据：
      ```
       rs.next();//指向第一行
       rs.getInt(1);//获取第一行第一列的数据
      ```
   * 常用方法
      * Object getObject(int index) / Object getObject(String name) 获得任意对象
      * String getString(int index) / Object getObject(String name) 获得字符串
      * int getInt(int index) / Object getObject(String name) 获得整型
      * double getDouble(int index) / Object getObject(String name) 获得双精度浮点型
6. 释放资源
    * 与IO流一样，使用后的东西都需要关闭！关闭的顺序是先得到的后关闭，后得到的先关闭。
    ```
      rs.close()
      stat.close();
	  con.close();
    ```
* demo
  ```
    import java.sql.Connection;
    import java.sql.DriverManager;
    import java.sql.ResultSet;
    import java.sql.Statement;

    public class JDBCDemo1 {
        public static void main(String[] args) throws Exception{
            //1. 注册驱动
            Class.forName("com.mysql.jdbc.Driver");
            //2. 获取连接对象
            String url = "jdbc:mysql://localhost:3306/school";
            String username="root";
            String password="root";
            Connection con = DriverManager.getConnection(url, username, password);
            //3 .获取执行SQL 语句对象
            Statement stat = con.createStatement();
            // 拼写查询的SQL
            String sql = "SELECT * FROM student";
            //4. 调用执行者对象方法,执行SQL语句获取结果集
            // ResultSet executeQuery(String sql)  执行SQL语句中的select查询
            // 返回值ResultSet接口的实现类对象,实现类在mysql驱动中
            ResultSet rs = stat.executeQuery(sql);
            //5 .处理结果集
            // ResultSet接口方法 boolean next() 返回true,有结果集,返回false没有结果集
            while(rs.next()){
                //获取每列数据,使用是ResultSet接口的方法 getXX方法参数中,建议写String列名
                System.out.println(rs.getInt("id")+"   "+rs.getString("num")+
                        "   "+rs.getString("s_name")+"   "+rs.getString("sex"));
            }

            rs.close();
            stat.close();
            con.close();
        }
    }
  ```

### 防止sql注入
* 使用PreparedStatement预处理对象时，建议每条sql语句所有的实际参数，都使用逗号分隔。
  ```
     String sql = "insert into sort(sid,sname) values(?,?)";;
	 //PreparedStatement预处理对象代码：
	 PreparedStatement psmt = conn.prepareStatement(sql)
  ```
* 设置实际参数
  ```
   setString(2, "家用电器") 把SQL语句中第2个位置的占位符？ 替换成实际参数 "家用电器"
  ```
* demo
  ```
   public class JDBCDemo {
				public static void main(String[] args) throws Exception{
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3296/mybase";
					String username="root";
					String password="123";
					Connection con = DriverManager.getConnection(url, username, password);

					//拼写修改的SQL语句,参数采用?占位
					String sql = "UPDATE sort SET sname=?,sprice=? WHERE sid=?";
					//调用数据库连接对象con的方法prepareStatement获取SQL语句的预编译对象
					PreparedStatement pst = con.prepareStatement(sql);
					//调用pst的方法setXXX设置?占位
					pst.setObject(1, "汽车美容");
					pst.setObject(2, 49988);
					pst.setObject(3, 7);
					//调用pst方法执行SQL语句
					pst.executeUpdate();

					pst.close();
					con.close();
				}
			}
  ```
### JDBC工具类
* 获得数据库连接”操作，将在以后的增删改查所有功能中都存在，可以封装工具类JDBCUtils。提供获取连接对象的方法，从而达到代码的重复利用。
  ```
    public class JDBCUtils {
    				private JDBCUtils(){}
    				private static Connection con ;

    				static{
    					try{
    						Class.forName("com.mysql.jdbc.Driver");
    						String url = "jdbc:mysql://localhost:3296/mybase";
    						String username="root";
    						String password="123";
    						con = DriverManager.getConnection(url, username, password);
    					}catch(Exception ex){
    						throw new RuntimeException(ex+"数据库连接失败");
    					}
    				}

    				/*
    				 * 定义静态方法,返回数据库的连接对象
    				 */
    				public static Connection getConnection(){
    					return con;
    				}


    				public static void close(Connection con,Statement stat){

    					 if(stat!=null){
    						 try{
    							 stat.close();
    						 }catch(SQLException ex){}
    					 }

    					 if(con!=null){
    						 try{
    							 con.close();
    						 }catch(SQLException ex){}
    					 }

    				}


    				public static void close(Connection con,Statement stat , ResultSet rs){
    					 if(rs!=null){
    						 try{
    							 rs.close();
    						 }catch(SQLException ex){}
    					 }

    					 if(stat!=null){
    						 try{
    							 stat.close();
    						 }catch(SQLException ex){}
    					 }

    					 if(con!=null){
    						 try{
    							 con.close();
    						 }catch(SQLException ex){}
    					 }

    				}
    			}
    		//测试JDBCUtils工具类的代码
    		public class TestJDBCUtils {
    			public static void main(String[] args)throws Exception {
    				Connection con = JDBCUtils.getConnection();
    				PreparedStatement pst = con.prepareStatement("SELECT sname FROM sort");
    				ResultSet rs = pst.executeQuery();
    				while(rs.next()){
    					System.out.println(rs.getString("sname"));
    				}
    				JDBCUtils.close(con, pst, rs);
    			}
    		}
  ```

### 将数据表的结构保存为对象类
 ```
  //定义实体类Sort【数据库中有张Sort表】
			public class Sort {
				private int sid;
				private String sname;
				private double sprice;
				private String sdesc;
				public Sort(int sid, String sname, double sprice, String sdesc) {
					this.sid = sid;
					this.sname = sname;
					this.sprice = sprice;
					this.sdesc = sdesc;
				}
				public Sort(){}
				public int getSid() {
					return sid;
				}
				public void setSid(int sid) {
					this.sid = sid;
				}
				public String getSname() {
					return sname;
				}
				public void setSname(String sname) {
					this.sname = sname;
				}
				public double getSprice() {
					return sprice;
				}
				public void setSprice(double sprice) {
					this.sprice = sprice;
				}
				public String getSdesc() {
					return sdesc;
				}
				public void setSdesc(String sdesc) {
					this.sdesc = sdesc;
				}
				@Override
				public String toString() {
					return "Sort [sid=" + sid + ", sname=" + sname + ", sprice=" + sprice + ", sdesc=" + sdesc + "]";
				}
 ```
 ```
  //JDBC读取数据表sort,每行数据封装到Sort类的对象中
  //很多个Sort类对象,存储到List集合中

  public class JDBCDemo {
				public static void main(String[] args) throws Exception{
					//使用JDBC工具类,直接获取数据库连接对象
					Connection con = JDBCUtils.getConnection();
					//连接获取数据库SQL语句执行者对象
					PreparedStatement pst = con.prepareStatement("SELECT * FROM sort");
					//调用查询方法,获取结果集
					ResultSet rs = pst.executeQuery();
					//创建集合对象
					List<Sort> list = new ArrayList<Sort>();
					while(rs.next()){
						//获取到每个列数据,封装到Sort对象中
						Sort s = new Sort(rs.getInt("sid"),rs.getString("sname"),rs.getDouble("sprice"),rs.getString("sdesc"));
						//封装的Sort对象,存储到集合中
						list.add(s);
					}
					JDBCUtils.close(con, pst, rs);
					//遍历List集合
					for(Sort s : list){
						System.out.println(s);
					}
				}
			}
 ```

### 使用properties配置文件
* 通常命名为.properties
* 键值对形式存在
  ```
   driverClass=com.mysql.jdbc.Driver
   url=jdbc:mysql://localhost:3306/mybase
   username=root
   password=root
  ```
  ```
   //通过配置文件连接数据库
   public class JDBCUtilsConfig {
				private static Connection con ;
				private static String driverClass;
				private static String url;
				private static String username;
				private static String password;

				static{
					try{
						readConfig();
						Class.forName(driverClass);
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception ex){
						throw new RuntimeException("数据库连接失败");
					}
				}

				private static void readConfig()throws Exception{
					InputStream in = JDBCUtilsConfig.class.getClassLoader().getResourceAsStream("database.properties");
					 Properties pro = new Properties();
					 pro.load(in);
					 driverClass=pro.getProperty("driverClass");
					 url = pro.getProperty("url");
					 username = pro.getProperty("username");
					 password = pro.getProperty("password");
				}


				public static Connection getConnection(){
					return con;
				}

			}

  ```
  ```
  //测试上面代码
   public class TestJDBCUtils {
				public static void main(String[] args) {
					Connection con = JDBCUtilsConfig.getConnection();
					System.out.println(con);
				}
			}
  ```
