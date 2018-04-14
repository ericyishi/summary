# SQL基础
### 在cmd下登录MYSQL数据库：
* **mysql -u 用户名 -p**  是连接mysql数据库服务器的命令，然后输入密码。

### SQL(Structured Query Language)结构化查询语言
* 用于管理关系型数据库，并与数据库中数据进行通信的语言。
* 不同的RDBMS，即关系数据库管理系统(Relational Database Management System)对SQL写法上有所不同:MySQL、Oracle...。
* 不区分大小写，但习惯将内置命令大写。
### SQL语句的分类

* DDL(Data Definition Language)
  * **CREATE**
  * **ALTER**
  * **DROP**
  * **RENAME**
  * **TRUNCATE**
* DML(Data Manipulation Language)
  * **INSERT**
  * **UPDATE**
  * **DELETE**
* DQL(Data Query Language)
  * **SELECT**
* DCL(Data Control Language)
  * **GRANT** 授权
  * **REVOKE** 解除授权
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
  * **注意：**
     * 符合日期、时间格式的字符串，可以由mysql自动转换为日期时间格式的值，如"2018-04-02 15:12:30"