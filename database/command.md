# 常用命令
###
* **mysql -u 用户名 -p**  是连接mysql数据库服务器的命令，然后输入密码。

* **创建数据库设置字符集**
  ```
  create database 数据库名 character set utf8;
  ```

* **创建表设置数据库引擎**
  *  innoDB
  *  MyISAM
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
