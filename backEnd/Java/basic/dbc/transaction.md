# 事务
### Connection接口
* 常用api：
  * setAutoCommit(false); //关闭自动提交
  * commit(); 事务提交
  * rollback(); 回滚
  * rollback(回滚点);
  * setSavePoint(); 设置还原点
### 转账案例
1. 使用jdbc的方式
   * 步骤：
     1. 数据库和表
     2. 新建一个项目
     3. 导入jar包和工具类
        * 驱动jdbcUtils
        * c3p0以及其配置文件和工具类
        * dbutils
     4. 新建一个account.jsp表单
     5. 提交给accountservlet处理
        1. 接收三个参数
        2. 调用accountservice.account 方法完成转账操作
        3. 打印信息
     6. account方法的内容:
        1. 调用jdbc不考虑事务
        2. 调用dao完成转出操作
        3. 调用dao完成转入操作
     7. 编写dao层
   * 上面方法没有考虑事务，
     * 需要在service中进行转账之前开启事务。
     * 所有操作都成功，就提交，否则回滚。
     * 为了保证所有的操作都在一个事务中，必须保证是同一个连接。
     * 在service层中我们获取了连接，开启了事务，如何dao层使用此连接？
       1. 方式1：向下传递参数【不规范】
           ```
            try{
             //0.开启事务
             conn=JdbcUtils.getConnection();
             conn.setAutoCommit(false);
             //1.转出
             dao.accountOut(con,fromUser,money);
             //2.入转
             dao.accountIn(con,toUser,money);
             //3.事务提交
             conn.commit();
             // 释放连接
             JdbcUtils.closeConn(conn);


            }catch(Exception e){
              e.printStackTrace();
               // 事务回滚
               conn.rollback();
               JdbcUtils.closeConn(conn);
              throw e;
            }
           ```
       2. 方式2：可以将connection对象绑定在当前线程上。
          * jdk中有一个ThreadLocal类可以实现绑定在线程上
          * ThreadLocal类的实例通常是类中的private static字段
          * ThreadLocal的方法【内部是一个map集合】
            * set(Object value) 将内容与线程绑定
            * Object get() 获取当前线程绑定的内容
            * remove() 将当前线程和内容解绑
          ```
           //是在工具类DataSourceUtil中修改
           先创建一个ThreadLocal类
           private static ThreadLocal<Connection> tl =new ThreadLocal<>();

           //修改获取的连接
            public static Connection getConnection() throws SqlException{
             Connection conn=tl.get();
             if(conn==null){
             conn=ds.getConnection();
             //绑定
             tl.set(conn);
             }
             return conn;
            }

            // 修改释放
            public static void closeConn(Connection conn){
             if(conn!= null){
              try{
               conn.close();
               //当前的线程解绑
               tl.remove();
              }catch(SQLException e){
                e.printStackTrace();
              }
              conn=null;
             }
            }
          ```
2. 使用DBUtils控制使用【重点】
   * 步骤
     1. 创建queryrunner
        * 构造方法：
          * new QueryRunner(DataSource ds)：自动事务
          * new QueryRunner():手动事务
        * 常用方法：
          * update(Connection conn,String sql,Object params):执行curd方法
            ```
             qr.update(DataSourceUtils.getConnection(),sql,money,toUser);
            ```
     2. 编写sql
     3. 执行sql



