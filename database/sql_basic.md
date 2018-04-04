# SQL基础
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