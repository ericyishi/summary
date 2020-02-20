# SQL命令-DDL、DML
## DDL
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
    * 数据库名不用引号包裹

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
	* 显示内容为：
	```
	  CREATE TABLE `goods` (
      `g_id` int(11) NOT NULL AUTO_INCREMENT,
      `g_name` varchar(50) NOT NULL,
      `producer` varchar(50) NOT NULL,
	  `price` float NOT NULL,
      `pic` varchar(20) NOT NULL,
      `stockNum` int(11) NOT NULL,
       PRIMARY KEY (`g_id`)
	   ) ENGINE=InnoDB DEFAULT CHARSET=utf8
	```
	
* **查看表的定义创建的语句**
    ```
     SHOW CREATE TABLE 表名;
    ```

* **查看表下各字段的定义情况，包括类型以及约束**
    ```
      DESC 表名;
    ```
	* 展示结果如下：
	```
	    +----------+-------------+------+-----+---------+----------------+
		| Field    | Type        | Null | Key | Default | Extra          |
		+----------+-------------+------+-----+---------+----------------+
		| g_id     | int(11)     | NO   | PRI | NULL    | auto_increment |
		| g_name   | varchar(50) | NO   |     | NULL    |                |
		| producer | varchar(50) | NO   |     | NULL    |                |
		| price    | float       | NO   |     | NULL    |                |
		| pic      | varchar(20) | NO   |     | NULL    |                |
		| stockNum | int(11)     | NO   |     | NULL    |                |
		+----------+-------------+------+-----+---------+----------------+
	```
	 
* 删除表
    ```
     DROP TABLE 表名;
    ```
  * 通过外键约束联系在一起的表不能被删除。要先删除外键约束。

* **复制表**
    ```
      CREATE TABLE 目标库."源表"  AS SELECT * FROM  源库."源表名";
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
	```
	  alter table goods modify price varchar(30) not null;
	```
     * 将varchar长度由50改成30，但是注意其他参数也得带上，如：not null,因为不带的话，生效后该自带就会变成可以为空了。
	 
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
    * 对于已存在的列需要添加约束可以使用
      ```
       ALTER TABLE 表名 ADD CONSTRAINT UNIQUE(字段名);
       或者
       ALTER TABLE 表名 MODIFY 字段名 类型 UNIQUE;
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


## DML
* 插入数据行
    ```
     INSERT INTO 表名(字段)VALUES('对应字段的值');
    ```
    * 字段名可以省略，但是后面的值需要一一匹配，包括类型，精度。
    ```
     INSERT INTO student VALUES("张三",1,79);
    ```
    * 每次插入一行数据，不能只插入半行或者几列数据；插入的数据是否有效将按照整行的完整性的要求来检查。

* 插入多行数据
    ```
    INSERT INTO AddrBook(tname,taddr,temail)
    SELECT sName,sAddr,sEmail
    FROM student;
    # 选择student表下的字段sName,sAddr,sEmail的数据插入AddrBook表下的tname、taddr、temail字段下
    # AddrBook是已经建好的
    ```
    或者
    ```
    insert into score values
    ("张三",1,79);
    ("张三",2,34);
    ("李四",1,56);
    ("李四",2,60);
    ("王五",3,45);
    ("张三",3,87);
    ("李四",3,92);
    ("王五",1,77);
    ```
* 更新数据行
   ```
    UPDATE 表名 SET <列名=更新值>[WHERE<更新条件>]
   ```
   ```
    UPDATE school SET location='中国';
    或者
    UPDATE score SET score=score+5
    WHERE score<=50;
   ```
* 删除表(**注意三种方式的区别**)
  ```
   TRUNCATE TABLE 表名
  ```
  ```
   TRUNCATE TABLE stu
  ```
  ```
   DROP TABLE stu
  ```
  ```
   DELETE FROM stu
  ```
  * DROP 直接表删掉了
  * TRUNCATE 干掉表,重新创建,不会记录删除详细日志，因而数据不能回滚
    * truncate属于DDL(数据定义语言 )语句
    * 表结构、列、约束不变
    * 不能用于有外键约束的表
    * 全局记录自增的记录值重新开始编号
    * 速度快
  * DELETE 一条一条数据删除
    * DELETE 属于DML(数据操作语言)语句
    * DELETE 逐条删除
    * 且保留全局记录自增的记录值
    * 执行时间久
   ```
    开发中很少使用delete,数据无价,删除有物理和逻辑(常用),
    逻辑删除一般会在表中添加一个字段(isdel:若值为1,代表删除了;若为0代表没有删除),
    此时的删除操作变成了更新操作.
   ```
 * 删除数据
   ```
   DELETE FROM 表名 [WHERE  条件];
   ```
   ```
    DELETE  FROM user WHERE username='jerry';
   ```


