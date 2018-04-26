# Python连接数据库
### 连接数据库步骤
  1. 导入pymysql包【前提是已经安装的这个第三方的库】
     ```
      import pymysql
     ```
  2. 连接数据库
     ```
      # 快速创建一个连接，并返回链接对象
      # connect(url,username,password,databaseName,charset)
      db = pymysql.connect('localhost', 'root', 'root', 'test', charset='utf8')
     ```
     * 通常使用配置文件来传入连接参数
       ```
        config = {
        'host': '127.0.0.1',
        'port': 3306,
        'user': 'root',
        'password': 'root',
        'db': 'school',
        'charset': 'utf8',
        'cursorclass': pymysql.cursors.DictCursor
        }
        db = pymysql.connect(**config)
       ```

  3. 创建游标
     ```
      cur = db.cursor()  # 通过连接对象去获取一个游标对象
     ```
  4. 通过游标来操作sql语句
     ```
      cur.execute(sql)
     ```
  5. 提交事务
     ```
      db.commit()
     ```
  6. 关闭连接
     ```
      db.close()
     ```

### 游标对象CUR的常用方法
  1. execute(sql) 执行一条sql语句
     ```
      sql="insert into stu value(1,'zhang1',36,a)"
      cur.execute(sql)
     ```
  2. executemany(sql,dataset) 批量插入数据
     * sql语句写成占位字符串的形式。【**注意**此处有个坑，使用executemany方法，sql语句填入的值都应该是%s，否则是会报错的】
     * dataset 可以写成列表嵌套元组的形式：[(),(),()]
     ```
      studentInfo = [(8, '张三', '男', 12, 'a1'), (9, 'lee', '女', 20, 'a2'), (10, 'lee', '女', 20, 'a2')]
      sql = "insert into student values(%s, %s, %s, %s, %s);" # 虽然数据id是int型的，但是这里要写成%s,但是存入数据库依然是int型
      cur.executemany(sql, params)
     ```
  2. fetchall() 返回所有的查询结果
     ```
      print(cur.fetchall())
     ```
  3. fetchone() 返回一条查询结果
  4. fetchmany(size) 返回指定长度的查询结果

### 连接对象DB的常用方法
  1. rollback() 即撤销指定的sql语句(只能回退insert delete update语句)，**回滚到上一次commit的位置**
  2. commit() 提交事务，提交未存储的事务

### 异常处理
  1. 格式
      ```
       try:
         语句1
         语句2
       except:
         异常处理语句1
      ```
  2.  demo
      ```
       try:
        cur = db.cursor()  # 通过链接对象去获取一个游标对象
        sql = "insert into " + tname + " values(%s, %s, %s, %s, %s);"
        cur.executemany(sql, params)
        db.callback() # 这条是错误的语句，没有callback()方法，因此会进入异常处理操作
       except:
        print("操作失败")
        db.rollback()
        return
       db.commit()  # 提交事务
       db.close()
       print("执行插入操作成功")
      ```
