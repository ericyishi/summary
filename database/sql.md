# SQL命令(mysql为例)
### mysql连接
* **mysql -u 用户名 -p**  是连接mysql数据库服务器的命令，然后输入密码。





### SQL(Structured Query Language)结构化查询语言
* 用于管理关系型数据库，并与数据库中数据进行通信的语言。
* 不同的RDBMS，即关系数据库管理系统(Relational Database Management System)对SQL写法上有所不同。
* 不区分大小写，但习惯将内置命令大写。
### SQL语句的分类

* DDL(Data Definition Language)
  * **create**
  * **alter**
  * **drop**
  * **rename**
  * **truncate**
* DML(Data Manipulation Language)
  * **insert**
  * **update**
  * **delete**
* DQL(Data Query Language)
  * **select**
* DCL(Data Control Language)
  * **grant** 授权
  * **revoke** 解除授权
### SQL注释
  * 使用 #注释一行
    ```
     #1.查看全班的平均成绩、最高分，最低分。
    ```
  * 使用 -- 注释一行【注意中间有空格】
    ```
     -- 1.查看全班的平均成绩、最高分，最低分。
    ```

 * 使用/* */
     ```
      /* 这是一个在行中间的注释 */


      /*
       这是一个
       多行注释的形式
      */
    ```
### 数据库的操作
* 创建数据库
    ```
     CREATE DATABASE 数据库名;
    ```

* 查看所有的数据库
    ```
     SHOW DATABASES;
    ```

* 删除数据库
    ```
     DROP DATABASE 数据库名;
    ```

* 使用数据库
    ```
     USE 数据库名;
    ```

* 创建数据库时设置字符编码集
    ```
     CREATE DATABASE 数据库名 CHARACTER SET utf8;
    ```

* 修改数据库字符编码集
    ```
     ALTER DATABASE 数据库名 CHARACTER SET=utf8;
    ```

### 表的操作
* 创建表
   * 表名在一个数据库中必须唯一。列名在一个表内也必须唯一。
    ```
     CREATE TABLE 表名(
            列名 数据类型 约束
     );
    ```

    ```
    CREATE TABLE goods(g_id INT PRIMARY KEY AUTO_INCREMENT,
                       g_name VARCHAR(50) NOT NULL,
                       producer VARCHAR(50) NOT NULL,
                       price FLOAT NOT NULL,
                       pic VARCHAR(20) NOT NULL,
                       stockNum INT NOT NULL
                     );
    ```
* 查看数据库中所有的表
    ```
      SHOW TABLES;
    ```

* **查看表的定义**
    ```
     SHOW CREATE TABLE 表名;
    ```

* **查看表下某个字段的定义**
    ```
      DESC 字段名;
    ```
* 删除表
    ```
     DROP TABLE 表名;
    ```
  * 通过外键约束联系在一起的表不能被删除。要先删除外键约束。

* **复制表**
    ```
      CREATE TABLE 新表名 AS(SELECT * FROM 被复制的表名);
    ```
    ```
     只复制结构，不要内容
      CREATE TABLE 新表名 LIKE 被复制的表名;
    ```

* 修改表名
    ```
     ALTER TABLE 表名 RENAME TO 新表名;
    ```

* 添加列
    ```
      ALTER TABLE 表名 ADD 列的定义
      如：
       ALTER TABLE t_parent ADD addr VARCHAR(50) NOT NULL;
    ```

* **更改列的定义**

    ```
     ALTER TABLE 表名 MODIFY 列名 定义;
     如：
      ALTER TABLE t_parent MODIFY id INT(11) AUTO_INCREMENT;--修改自增属性
    ```

* 删除列
    ```
    ALTER TABLE 表名 DROP 列名
    如：
    ALTER TABLE t_parent DROP addr; --删除addr字段
    ```

* 创建主键的方法
    * 1.直接在字段定义后面声明主键
       ```
        CREATE TABLE 表名(
          id INT PRIMARY KEY,
          ...
        -- 由系统默认指定主键名
        -- 如果要查看主键名 SHOW CREATE TABLE 表名
        )
       ```
    * 2.用constraint声明主键
       ```
        CREATE TABLE 表名(
          id INT,
          CONSTRAINT 主键名 PRIMARY KEY(ID)
        )
        -- 这里需要指定主键名
       ```
    * **3.也可以不用constraint**
       ```
       CREATE TABLE 表名(
         id INT,
         cno NOT NULL,
         PRIMARY KEY(id,cno) #复合主键
       )
       ```

    * **4.对于已建好的表要修改字段为主键**
       ```
        ALTER TABLE 表名 MODIFY 列名 类型 PRIMARY KEY;
        或者
        ALTER TABLE 表名 ADD CONSTRAINT PRIMARY KEY(列名);
       ```

* 删除主键
    ```
      ALTER TABLE 表名 DROP PRIMARY KEY;
    ```
* 创建外键
    ```
      CREATE TABLE 表名(
       sid INT,
       FOREIGN KEY(sid) references 主表(sid)
      );
    ```
   * 指定外键在update或delete时候的行为
     * 外键表为子表，引用的主键那张表为主表（或者叫父表）
     * 子表创建一个父表中不存在的外键值，InnoDB会拒绝任何INSERT或者UPDATE操作。
     * 父表试图update或者delete子表中存在或匹配的外键值，最终动作取决于外键约束定义中的ON UPDATE和ON DELETE
     * InnoDB支持5种不同的动作，如果没有指定ON DELETE或者ON UPDATE，默认动作为RESTRICT
       * RESTRICT【默认】:拒绝删除或者更新父表。
       * NO ACTION：InnoDB拒绝删除或者更新父表。
       * SET NULL:从父表中删除或者更新对应的列，同时将子表中的外键列设为空。【但这些外键列没有被设为not null时才有效】
       * CASCADE: 从父表中删除或更新对应的列，同时自动删除或更新表中匹配的行。
         * ON DELETE CANSCADE
         * ON UPDATE CANSCADE
       ```
        CREATE TABLE 表名(
         sid INT,
         FOREIGN KEY(sid) REFERENCES 主表(sid) ON UPDATE CASCADE
        )
        //父表更新，子表跟随更新
       ```
       ```
        CREATE TABLE 表名(
         sid INT,
         FOREIGN KEY(sid) REFERENCES 主表(sid) ON DELETE CASCADE ON UPDATE CASCADE
        )
        //父表删除或更新，子表跟随相应操作
       ```
       ```
       CREATE TABLE 表名(
        sid INT,
        FOREIGN KEY(sid) REFERENCES 主表(sid) ON DELETE RESTRICT ON UPDATE CASCADE
         )
         //父表更新，子表更新。拒绝删除。
       ```
* 创建默认值
    ```
     CREATE TABLE 表名(
     字段 类型 DEFAULT '默认值'
     )
    ```
    ```
     CREATE TABLE demo(
      sex varchar(20) DEFAULT '男'
      )
    ```
* 创建自增长
  * AUTO_INCREMENT
  * 必须要先设置主键，才能自增长。一张表里只能有一个自增长。

   ```
     CREATE TABLE demo(
          id INT PRIMARY KEY AUTO_INCREMENT
      )
   ```
* 创建唯一约束
    ```
     CREATE TABLE demoI(
      username VARCHAR(50) UNIQUE
     )
    ```
* 创建非空约束
    ```
     CREATE TABLE demoI(
           addr VARCHAR(50) NOT NULL
          )
    ```
* 创建检查约束
  * MYSQL 不支持check。
  * 所以对于离散值要使用SET或者ENUM
  * 连续值只能通过触发器
    ```
      CREATE TABLE demoI(
                sex SET('男','女')
               )
    ```
* **创建表时设置数据库引擎**
  ```
    mysql> create table test(
        -> id int(10) unsigned not null auto_increment,
        -> name varchar(10) character set utf8,
        -> age int(10),
        -> primary key(id)
        -> )
        -> engine=MyISAM
        -> ;
  ```

### 数据类型
* 整数数据类型
  * TINYINT
  * SMALLINT
  * MEDIUMINT
  * INT
  * BIGINT
* 浮点数据类型
  * FLOAT
  * DOUBLE
* 定点数据类型
  * DECIMAL(P,D)
  * P为精度，D为小数。
  ```
   DECIMAL(4,2)
   精度(总长度为4位，小数为2位)
  ```
* 字符串类型
  * CHAR(M)
  * VARCHAR(M)
  * TINYTEXT 文本型
  * TEXT
  * BINARY(M) 固定长度为 n 字节
  * VARBINARY(n|max) 可变长度，n 的取值范围为 1 至 8,000，max 是指最大存储空间是 2^31-1 个字节，即最大4GB；
* 二进制数据类型
  * TINYBLOB
  * BLOB
  * MEDIUMBLOB
  * LONGBLOB
* 日期和时间数据类型
  * YEAR 格式：YYYY
  * DATE  格式：YYYY-MM-DD
  * TIME  格式：HH:MM:SS
  ```
      时间。范围是’-838:59:59’到’838:59:59’
  ```
  * TIMESTAMP  格式：YYYY-MM-DD HH:MM:SS
  ```
   时间戳。范围是’1970-01-01 00:00:00’到2037年。
   TIMESTAMP列用于INSERT或UPDATE操作时记录日期和时间。
  ```
  * DATETIME  格式：YYYY-MM-DD HH:MM:SS
  ```
   支持的范围是’1000-01-01 00:00:00’到’9999-12-31 23:59:59’。
  ```
