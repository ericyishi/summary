# 连接池
### 概念
* 实际上就是存放连接的池子(容器)
* 在开发中“获得连接”或“释放资源”是非常消耗系统资源的两个过程
* 为了解决此类性能问题，通常情况我们采用连接池技术，来共享连接Connection。
* 这样我们就不需要每次都创建连接、释放连接了，这些操作都交给了连接池
* 归还连接调用close()方法，不是销毁连接，只是归还进连接池

### 种类
* Java为数据库连接池提供了公共的接口：javax.sql.DataSource，各个厂商需要让自己的连接池实现这个接口。这样应用程序可以方便的切换不同厂商的连接池！
* DataSource接口，它是java与每种数据库连接池 连接的规范标准
* 常用连接池：DBCP【tomcat使用的技术】、C3P0【Hibernate、Spring】
* 单独使用DBCP需要3个包：common-dbcp.jar,common-pool.jar
* C3P0是一个开放源代码的JDBC连接池，在使用时需要导入c3p0-*.jar包。
* DBCP有着比C3P0更高的效率，但是实际应用中，DBCP可能出现丢失连接的可能，而C3P0稳定性较高。因此在实际应用中,C3P0使用较为广泛。
### DBCP
* 导入mysql驱动包
  ```
   mysql-connector-java-5.1.37-bin.jar
  ```
* 先要导入dbcp的jar包以及pool的jar包
  ```
   commons-dbcp-1.4.jar
   commons-pool-1.5.6.jar
  ```
* 创建连接池
  * BasicDataSource类 是 DataSource接口的实现类
  ```
	    import org.apache.commons.dbcp.BasicDataSource;
	    import javax.sql.DataSource;
	    public class JDBCUtils {
	        public static final String DRIVER = "com.mysql.jdbc.Driver";
	        public static final String URL = "jdbc:mysql://localhost:3306/school";
	        public static final String USERNAME = "root";
	        public static final String PASSWORD = "root";
	        /*
	         * 创建连接池BasicDataSource
	         */
	        public static BasicDataSource dataSource = new BasicDataSource();
	        //静态代码块
	        static {
	            //对连接池对象 进行基本的配置
	            dataSource.setDriverClassName(DRIVER); // 这是要连接的数据库的驱动
	            dataSource.setUrl(URL); //指定要连接的数据库地址
	            dataSource.setUsername(USERNAME); //指定要连接数据的用户名
	            dataSource.setPassword(PASSWORD); //指定要连接数据的密码
	        }
	        /*
	         * 返回连接池对象
	         */
	        public static DataSource getDataSource(){
	            return dataSource;
	        }
	    }
	  
  ```
* 测试连接池（使用了dbutils）
  * 导入dbutil的包
    ```
     commons-dbutils-1.6.jar
    ```
  ```
		import org.apache.commons.dbutils.QueryRunner;
		import org.apache.commons.dbutils.handlers.BeanHandler;
		
		import java.sql.SQLException;
		
		public class Demo {
		    public static  void main(String args[]){
		        Demo d=new Demo();
		        d.insert();
		        d.update();
		        d.delete();
		        d.search();
		    }
		    // 插入功能
		
		    public void insert(){
		        try {
		            //获取一个用来执行SQL语句的对象   QueryRunner
		            QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		            String sql = "INSERT INTO student(s_name,num,sex,age) VALUES(?,?,?,?)";
		            Object[] params = {"秋翔", 1006, "女",21};
		            int line = qr.update(sql,params);
		            //结果集处理
		            System.out.println("line = " + line);
		
		        } catch (SQLException e) {
		            throw new RuntimeException(e);
		        }
		    }
		
		    //删除功能
		
		    public void delete(){
		        try {
		            //创建一个QueryRunner对象，用来完成SQL语句的执行
		            QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		            //执行SQL语句
		            String sql = "DELETE FROM student WHERE s_name = ?";
		            Object[] params = {"秋翔"};
		            int line = qr.update(sql, params);
		            //结果集的处理
		            System.out.println("line="+line);
		
		        } catch (SQLException e) {
		            throw new RuntimeException(e);
		        }
		    }
		
		    //更新功能
		
		    public void update(){
		        try {
		            //创建一个QueryRunner对象，用来完成SQL语句的执行
		            QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		            //执行SQL语句
		            String sql = "UPDATE student SET addr = '欢乐芝麻街' WHERE num=?";
		            Object[] params = {"1200"};
		            int line = qr.update(sql, params);
		            //结果集的处理
		            System.out.println("line="+line);
		
		        } catch (SQLException e) {
		            throw new RuntimeException(e);
		        }
		    }
		
		    //查询功能,将结果集中第一条记录封装到一个指定的javaBean中。
		
		    public void search(){
		        try{
		            //获取QueryRunner
		            QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		            //执行SQL语句
		            String sql = "SELECT * FROM student";
		            Object[] params = {};
		            Student p = qr.query(sql, new BeanHandler<Student>(Student.class), params);
		            //结果集处理
		            System.out.println(p);
		
		        } catch(SQLException e){
		            throw new RuntimeException(e);
		        }
		    }
		  }
  
  ```
* 常用配置项
  * 必须项
    * driverClassName 数据库驱动名称
    * url 数据库的地址
    * username 用户名
    * password 密码
  * 非必须项
    * maxActive 最大连接数量
    * minIdle 最小空闲连接
    * maxIdle 最大空闲连接
    * initialSize 初始化连接

