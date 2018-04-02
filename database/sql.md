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
