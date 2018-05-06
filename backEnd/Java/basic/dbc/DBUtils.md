# DBUtils
### 概念
* DBUtils是java编程中的数据库操作实用工具，小巧简单实用
* DBUtils封装了对JDBC的操作，简化了JDBC操作，可以少写代码。
* DBUtils就是JDBC的简化开发工具包。需要项目导入相关包才能使用。

### 核心功能
* Dbutils三个核心功能:
  1. QueryRunner中提供对sql语句操作的API.
  2. ResultSetHandler接口，用于定义select操作后，怎样封装结果集.
  3. DbUtils类，它就是一个工具类,定义了关闭资源与事务处理的方法

### QueryRunner核心类
* QueryRunner中提供对sql语句操作的API.
   * update(Connection conn, String sql, Object... params)  用来完成表数据的增加、删除、更新操作
     ```
        import org.apache.commons.dbutils.QueryRunner;

        import java.sql.Connection;
        import java.sql.SQLException;

        public class DBUtilDemo {
            public static void main(String args[]){
                insert();
            }
            public static void insert(){
                try {
                    //获取一个用来执行SQL语句的对象   QueryRunner
                    QueryRunner qr = new QueryRunner();

                    String sql = "INSERT INTO student(id,num,s_name,sex) VALUES(?,?,?,?)";
                    Object[] params = {null, 1200, "马马武","男"};
                    Connection conn = JDBCUtils.getConnection();
                    int line = qr.update(conn,sql,params);// 用来完成表数据的增加、删除、更新操作
                    //结果集处理
                    System.out.println("line = " + line);

                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
        }
     ```

   * query(Connection conn, String sql, ResultSetHandler<T> rsh, Object... params) 用来完成表数据的查询操作
### ResultSetHandler类
* 常用的类
  * ArrayHandler 将结果集中的第一条记录封装到一个Object[]数组中，数组中的每一个元素就是这条记录中的每一个字段的值
    ```
        import org.apache.commons.dbutils.QueryRunner;
        import org.apache.commons.dbutils.handlers.ArrayHandler;

        import java.sql.Connection;
        import java.sql.SQLException;

        public class ArrayHandlerDemo {
                private static Connection con = JDBCUtils.getConnection();
                public static void main(String[] args) throws SQLException {
                    arrayHandler();
                }
                /*
                 *  结果集第一种处理方法, ArrayHandler
                 *  将结果集的第一行存储到对象数组中  Object[]
                 */
                public static void arrayHandler()throws SQLException{
                    QueryRunner qr = new QueryRunner();
                    String sql = "SELECT * FROM student";
                    //调用方法query执行查询,传递连接对象,SQL语句,结果集处理方式的实现类
                    //返回对象数组
                    Object[] result = qr.query(con, sql, new ArrayHandler());
                    for(Object obj : result){
                        System.out.print(obj);//结果只有数据库中第一条记录
                    }
                }

        }
    ```
  * ArrayListHandler 将结果集中的每一条记录都封装到一个Object[]数组中，将这些数组在封装到List集合中。
    ```
     List<Object[]> result = qr.query(con, sql, new ArrayListHandler());
     for( Object[] objs  : result){
                //遍历对象数组
                for(Object obj : objs){
                    System.out.print(obj+"  ");
                }
                System.out.println();
            }
    ```
  * BeanHandler 将结果集中第一条记录封装到一个指定的javaBean中
    ```
        import org.apache.commons.dbutils.QueryRunner;
        import org.apache.commons.dbutils.handlers.BeanHandler;

        import java.sql.*;
        import java.util.ArrayList;

        public class BeanHandlerDemo {
            private static Connection con = JDBCUtils.getConnection();
            public static void main(String[] args) throws SQLException{
                beanHandler();
            }
            /*
             *  结果集第三种处理方法,BeanHandler
             *  将结果集的第一行数据,封装成JavaBean对象
             *  注意: 被封装成数据到JavaBean对象, Sort类必须有空参数构造
             */
            public static void beanHandler()throws SQLException{
                QueryRunner qr = new QueryRunner();
                String sql = "SELECT * FROM student";
                //调用方法,传递结果集实现类BeanHandler
                //BeanHandler(Class<T> type)
                Student s = qr.query(con, sql, new BeanHandler<Student>(Student.class));
                System.out.println(s.getS_name());

            }
        }
    ```
    * JavaBean就是一个类，在开发中常用封装数据。
    * 该类中的成员变量与数据库表中的字段相对应（变量名对应数据库表字段名、变量数据类型对应数据库表字段类型）
    * 具有如下特性
      1. 提供私有字段：private 类型 字段名;
      2. 提供getter/setter方法：
      3. 提供无参构造
      ```
          public class Student {

            private int id;
            private String num;
            private String s_name;
            private String sex;
            private int age;
            private String addr;
            private int cid;

            public Student() {
            }

            public int getId() {
                return id;
            }

            public void setId(int id) {
                this.id = id;
            }

            public String getNum() {
                return num;
            }

            public void setNum(String num) {
                this.num = num;
            }

            public String getS_name() {
                return s_name;
            }

            public void setS_name(String s_name) {
                this.s_name = s_name;
            }

            public String getSex() {
                return sex;
            }

            public void setSex(String sex) {
                this.sex = sex;
            }

            public int getAge() {
                return age;
            }

            public void setAge(int age) {
                this.age = age;
            }

            public String getAddr() {
                return addr;
            }

            public void setAddr(String addr) {
                this.addr = addr;
            }

            public int getCid() {
                return cid;
            }

            public void setCid(int cid) {
                this.cid = cid;
            }

        }

      ```
  * BeanListHandler 将结果集中每一条记录封装到指定的javaBean中，将这些javaBean在封装到List集合中
    ```
     List<ZhangWu> list = qr.query(conn, sql, new BeanListHandler<ZhangWu>(ZhangWu.class), params);
			//结果集处理
			for (ZhangWu zw : list) {
				System.out.println(zw);
			}
    ```
  * ColumnListHandler 将结果集中指定的列的字段值，封装到一个List集合中
    ```
     List<Object> list = qr.query(con, sql, new ColumnListHandler<Object>("sname"));
					for(Object obj : list){
						System.out.println(obj);
					}
    ```
  * ScalarHandler 它是用于单数据。例如select count(*) from 表操作
    ```
     String sql = "SELECT COUNT(*) FROM sort";
					//调用方法query,传递结果集处理实现类ScalarHandler
					long count = qr.query(con, sql, new ScalarHandler<Long>());
					System.out.println(count);
    ```
  * MapHandler 将结果集第一行封装到Map集合中,Key 列名, Value 该列数据
    ```
     Map<String,Object> map = qr.query(con, sql, new MapHandler());
					//遍历Map集合
					for(String key : map.keySet()){
						System.out.println(key+".."+map.get(key));
					}
    ```
  * MapListHandler 将结果集第一行封装到Map集合中,Key 列名, Value 该列数据,Map集合存储到List集合
    ```
     List<Map<String,Object>> list = qr.query(con, sql, new MapListHandler());
					//遍历集合list
					for( Map<String,Object> map : list ){
						for(String key : map.keySet()){
							System.out.print(key+"..."+map.get(key));
						}
						System.out.println();
	    }
    ```
