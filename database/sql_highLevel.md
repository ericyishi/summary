# 高级特性
### 概述
* mysql高级特性是mysql数据库对标准SQL的一个扩充。
* 其他数据库中也有，SQL SERVER是T-SQL,Oracle有PL-SQL.内容上大同小异，语法上有差异。

### 变量
* 变量的分类
  1. 用户变量
     * 形式是以@开头的。
     * 用户变量只对当前用户生效。作用域是整个会话期间【使用命令行重新登录建立一个新的连接，再使用select @vame结果为null】。
     ```
      SET @vname="rick"
     ```
  2. 系统变量
     * 形式是@@开头的。
     * 由系统定义，以硬编码的方式写在my.ini文件中
     * 系统变量分类
       1. 全局变量
          * 在MYSQL启动的时候由服务器自动将他们的初始值为默认值，这些默认值可以通过更改my.ini这个文件来更改。
          * my.ini的路径在 select @@datadir查询结果的上一级路径【修改了my.ini文件后，需要重启数据库服务】
          * 通过 SHOW GLOBAL VARIABLES; 命令查看所有全局变量
       2. 会话变量
          * 会话变量在每次建立一个新的链接的时候，由MYSQL来初始化，MYSQL会将当前所有的全局变量的值复制一份，来作为会话变量。
          * **也就是说，如果在建立会话以后，没有手动更改会话变量与全局变量的值，那么所有这些值都是一样的。**
     * 全局变量与会话变量的区别
       * 对全局变量的修改会影响到整个服务器的用户，但是对会话变量的修改，只会影响到当前的用户(也就是当前的数据库连接)

  3. 局部变量
     * 使用declare定义
       ```
        DECLARE local_gender CHAR(1) DEFAULT "male";
       ```
     * 赋值
       ```
       # 方式1：直接赋值
        SET local_gender="female";
       ```
        或者
       ```
       # 方式2： 选择复制
        SELECT sex INTO local_gender FROM stu WHERE sname="zhangsan";
       ```
     * 显示值
       ```
        SELECT local_gender;
       ```
     * 作用范围。局部变量只在begin-end语句块之间有效。在begin-end语句块运行完之后，局部变量就消失了。
     * 局部变量前面不能加@，不要与会话变量同名，避免覆盖。
### 流程控制
* **注意**
  1. mysql中没有{},只有BEGIN和END，代替{}
  2. 输出使用SELECT
* 分支
  * IF
    ```
     IF 条件 THEN
       动作1;
     ELSEIF 条件2 THEN
       动作2;
     ELSE
       动作3;
     ENDIF;
    ```
  * CASE
    ```
     CASE 变量值
      WHEN 条件1 THEN 语句1
      WHEN 条件2 THEN 语句2
      ELSE
        语句3
     END CASE;
    ```
    ```
     CREATE PROCEDURE p()
      BEIGIN
       DECLARE v INT DEFAULT 1;
       CASE v
        WHEN 2 THEN SELECT v;
        WHEN 3 THEN SELECT 0;
        ELSE
         BEGIN
          SELECT 'HELLO';
         END;
        END CASE;
      END;
    ```
* 循环
  * REPEAT
   ```
    标签名: REPEAT
      循环体
     UNTIL 退出循环条件
     END REPEAT 标签名;

     # 标签名是可以省略的，视情况而定。
   ```
   ```
    CREATE PRODUCE dorepeat(p1 INT)
     BEGIN
      SET @X=0;
      iter: REPEAT
       SET @X=@X+1;
       SELECT @X;
       UNTIL @X>p1 END REPEAT iter;
     END
   ```
  * WHILE
   ```
    标签名: WHILE 执行条件 DO
       循环体
    END WHILE 标签名
   ```
   ```
    CREATE PROCEDURE dowhile()
    BEGIN
      DECLARE v INT DEFAULT 5;
      WHILE v>0 DO
       SELECT v;
       SET v=v-1;
      END WHILE
     END
   ```
  * 跳出循环
    * 跳出本次循环【作用类似于continue语句。只出现在REPEAT、WHILE、LOOP语句】
    ```
     ITERATE 标签名
    ```
    * 跳出循环体【作用类似于break;】
    ```
    LEAVE 标签名
    ```
### 存储过程
 * 概述
   * 存储过程是一种数据库对象，将一组预编译的SQL语句以一个存储单元的形式存储在服务器上，方便用户调用。
 * 优点
   * 提高性能。存储过程是只编译一次，然后将编译好的代码保存在高速缓存中，以后直接调用，可以提高代码执行效率。
   * 安全。只给用户访问存储过程的权限，而不授予用户访问表和视图的权限。
   * 减少网络流量。存储过程存在服务器上，不用在客户端编写大量的sql语句，调用时，只需传递执行过程的执行命令和返回结果。
 * 缺点
   * 不方便调试。
   * SQL本身是一种结构化查询语言，但不是面向对象的的，本质上还是过程化的语言，面对复杂的业务逻辑，过程化的处理会很吃力。同时SQL擅长的是数据查询而非业务逻辑的处理，如果如果把业务逻辑全放在存储过程里面，违背了这一原则。
 * 存储过程语法
   * 创建
     ```
      CREATE PROCEDURE 存储过程名字(参数)
      BEGIN
        内容
      END

      # 参数([IN|OUT|INOUT] 参数名 类型)
        # IN输入型参数：只读的。CALL调用时**必须是明确的值**，可以是变量，不能为空值。【默认是IN】
        # OUT输出型参数：可写的。**可以是一个未经过初始化变量**，它的值可以任意输出。
        # INOUT，在调用时可以不给明确的值，在过程中也可以任意修改，任意输出。
      ```
      ```
       CREATE PROCEDURE proc_demo(OUT param1 INT)
       BEGIN
         SELECT COUNT(*) INTO param1 FROM t;
       END

       调用：
       CALL proc_demo(@a)
       SELECT @a
      ```

    * 调用
      ```
       CALL 存储过程名();
       # 如果没有使用use指定使用某个指定的数据库，要写全：
       # CALL 数据库名.存储过程名();
      ```
    * 查看存储过程的详情
      ```
       SHOW CREATE PROCEDURE 存储过程名;
      ```
 * 分类
   * 无输入参数和无输出参数的存储过程【很少使用】
     ```
      CREATE PROCEDURE proc_search()
      BEGIN 
        SELECT * FROM stu;
      END
     ```
   * 有输入参数的存储过程
     ```
     # 根据学生名字查询该学生的平均成绩和总分
      CREATE PROCEDURE pro_stu_score(IN sName VARCHAR(20),OUT avgScore FLOAT,OUT sumScore FLOAT)
      BEGIN
        SELECT AVG(score),SUM(score) INTO avgScore,sumScore FROM sc,stu WHERE sc.sno=stu.sno WHERE stu.name=sName; 
      END
      CALL pro_stu_score("lee Smith",@uavg,@usum);
      SELECT @uavg,@usum
     ```

### 函数
  * 概述
   * 函数功能类似于存储过程，只是存储过程没有返回值，函数有返回值，存储过程的参数类型比函数多。
   * 函数与存储过程的调用方式不同。
  * 分类
    1. 系统函数
      * 流程控制函数
        1. CASE
        2. IF
	 ```
	  IF(表达式1，表达式2，表达式3);
	  
	  # 如果表达式1的返回值结果为true，则执行表达式2的结果，否则表达式3

	 ```
	 ```
	  SELECT IF(1>2,2,3);
	 ```
        3. IFNULL
	 ```
	  IFNULL(表达式1，表达式2);
	  # 如果表达式1不为null,则返回表达式1，否则返回表达式2
	 ```
	 ```
          SELECT IFNULL(1,0)//输出值为0
          SELECT IFNULL(NULL,10)//输出值为NULL;
	 ```
        4. NULLIF
	 ```
	  NULLIF(表达式1,表达式2);
	  # 若表达式1等于表达式2，则返回NULL，否则返回表达式1
	 ```
	 ```
	  SELECT NULLIF(1,1)//返回值为NULL
	 ```
      * 字符串函数
        * 下面的函数都是系统内置的可以直接调用
	        * CONCAT(S1,S2,...Sn); //将S1，S2,...Sn连接成字符串。
	        * CONCAT(SEP,S1,S2,...Sn)；//将S1，S2,...Sn连接成字符串，并用Sep字符间隔。
	        * SUBSTRING(str,index,length);//从下标index【下标从1开始】开始以length长度来截取字符串
	        ```
	         UPDATE COURSE SET CNAME=SUBSTRING("www.baidu.com",2,3) WHERE CID=1;
	         # 截取的结果是：ww.
	        ```
             SUBSTRING_INDEX(str,seprator,length);//从分隔符分隔，截止到以第length长度之前的来截取字符串
	        ```
             SUBSTRINGINDEX("www.baidu.com",".",2);
	         # 截取的结果是：www.baidu
	        ```
	        * TRIM(str);//去除字符串首尾的所有空格
	        * UUID();//生成具有唯一值的字符串， UUID很好用的一点是这样设计出来的id永远不会是重复的
	        * LAST_INSERT_ID();//返回最后插入的id值【在使用MySQL时，若表中含自增字段（auto_increment类型），则向表中insert一条记录后，可以调用last_insert_id()来获得最近insert的那行记录的自增字段值】
	     
      * 时间函数
         * CURDATE()或者CURRENT_DATE() //返回当前的日期
         * CURTIME()或者CURRENT_TIME() //返回当前的时间
         * DATE_ADD(date,INTERVAL int type)//返回的日期date加上间隔时间int结果(int必须按照关键字进行格式化)
         ```
          SELECT OrderId,DATE_ADD(OrderDate,INTERVAL 2 DAY) AS OrderPayDate
          FROM Orders
         ```
         * DATE_SUB(date,INTERVAL int type)// 从日期减去指定的时间间隔。
         * DATE_FORMAT(date,format)//用于以不同的格式显示日期/时间数据。
         ```
          DATE_FORMAT(NOW(),'%d %b %y')
         ```
         * NOW() //返回当前的日期和时间
         format 规定日期/时间的输出格式。
    2. 自定义函数
      * 语法
        1. 创建
        ```
         CREATE FUNCTION func_name(参数)
         RETURNS type [DETERMINSTIC|NOT DETERMINSTIC(默认)]
         BEGIN
           函数体
           RETURN
         END
        # 返回值确定性DETERMINSTIC，优化用，如果输入值跟上次一样，就不再计算，直接返回上次结果。
        # 必须至少一个return语句
        # 声明的地方时returns！
        ```
        ```
         CREATE FUNCTION func_sum(num1 INT,num2 INT)
         RETURNS INT
         BEGIN
           DECLARE i INT DEFAULT num1；
           DECLARE result INT DEFAULT 0;
           WHILE i<= num2 DO
           SET result=result+i;
           SET i=i+1;
           END WHILE;
           RETURN result;
         END

        ```

        2. 删除
        ```
         DROP FUNCTION [IF EXISTS] func_name;
        ```
        3. 查看
        ```
          SHOW CREATE FUNCTION func_name;
        ```
        4. 使用
        ```
         SELECT 数据库名.函数名;
         # 注意与存储过程的区别，不是CALL
        ```
### 触发器
  * 概述
    * 触发器是一种特殊类型的存储过程，不由用户直接调用。主要用于强制类型完整性设置。
  * 特点
    * 不能通过名称被直接调用。
    * 用于MYSQL约束、默认值和规则的完整性检查。
  * 语法
    1. 创建
      ```
        CREATE TRIGGER 触发器名字 触发时间 触发事件 ON 表名 FOR EACH ROW
        BEGIN
         逻辑体
        END
        # 触发时间:[BEFORE|AFTER]
        # 触发事件：[INSERT|UPDATE|DELETE]
        # 逻辑体中不能再对本表进行INSERT、UPDATE、DELETE操作，以免递归循环触发。
      ```
      * old和new的使用
        * 即操作前状态，和操作后状态
           ```
             # 定义一个触发器tri_student_check_sex ,用于检测向student表插入数据性别列（sex）和年龄列（age）的有效性 （只包含 男 女, 触发器用于插入之前，默认为男，年龄0-100 有效，默认为0）
                CREATE TRIGGER tri_student_check_sex BEFORE INSERT ON student FOR EACH ROW
                    BEGIN
                      IF NEW.sex !="男" AND (或使用&&) NEW.sex != "女" THEN
                      SET NEW.sex = "男";
                      END IF;
                      IF NEW.age < 0 OR NEW.age >100 then
                      SET NEW.age = 0;
                      END IF;
                   END
           ```
	
    2. 删除
      ```
       DROP TRIGGER [IF EXISTS]触发器名字
      ```
    3. 查看
      ```
       SHOW CREATE TRIGGER 触发器名字
      ```
    4. 使用
      ```
       无需手动调用，触发器自动监听状态变化
      ```

  * 条件处理器（异常处理）
    * 条件处理器相当于对异常的处理，当出现某种错误时候，将交由相应的处理器进行处理。
    * 语法
      1. 创建
      ```
       DECLARE 处理动作 HANDLER FOR 异常状态,[异常状态,...] 执行语句
       # 处理动作:[CONTINUE(继续执行),EXIT(跳出BEGIN END 语句块)]
       # 异常状态:[mysql_erroe_code|NOT FOUND|SQLWARNING|SQLEXCEPTION]
      ```
      ```
       DROP PROCEDURE IF EXISTS exp_pro_demo;
       CREATE PROCEDURE exp_pro_demo(IN p_name VARCHAR(10))
       BEGIN
        DECLARE vname VARCHAR(10) DEFAULT "hello";
        # 所有局部变量的申明必须放在异常声明的前面，会话变量无此限制。
        DECLARE EXIT HANDLER FOR NOT FOUND SET @info='data not found';
        SELECT `sname` INTO vanem from stu where sname=p_name;
        SELECT vname;
       END

       # 调用
       CALL exp_pro_demo('VINCENT');//传入一个没有的值@info的值就被赋予data not found
       SELECT @info;
      ```
### 游标
  * 概念
     * 游标(cursor) 是一个存储在MYSQL服务器上的数据库查询，它不是一条SELECT语句，而是被该语句检索出来的**结果集**。
     * 游标主要用于交互式应用。
     * **注意：MYSQL游标只能用于存储过程(和函数)**
  * 语法
    1. 定义
       ```
        DECLARE 游标名 CURSOR FOR 查询语句
       ```
       * 游标的内容是来源于SELECT语句的查询结果
    2. 打开游标
       ```
        OPEN 游标名;
       ```
       * 用前面定义的SELECT语句把数据实际检索出来。
    3. 取值
       ```
        FETCH 游标名 INTO 变量1,变量2,...
       ```

    4. 关闭游标
       ```
        CLOSE 游标名;
       ```
       * 在结束使用游标时，必须关闭游标。
       ```
        # 将读者表根据性别，分离到两张两张表中

         CREATE PROCEDURE pro_divideGender
         BEGIN
          DECLARE v_rid INT,
          DECLARE v_rcompany VARCHAR(10),
          DECLARE v_rname VARCHAR(10),
          DECLARE v_rsex VARCHAR(10),
          DECLARE v_rgrade VARCHAR(10),
          DECLARE v_raddr VARCHAR(50),
          DECLARE t_break INT DEFAULT FALSE;
          DECLARE readerInfo_cur CURSOR FOR SELECT * FROM reader;
          DECLARE CONTINUE HANDLER FOR NOT FOUND SET t_break=TRUE;
          OPEN readerInfo_cur;
          outter:WHILE TRUE DO
            FETCH readerInfo_cur INTO v_rid,v_rcompany, v_rsex,v_rname,v_raddr;
            IF t_break THEN
              LEAVE outter;
            ELSE
               IF v_rsex="男" THEN
                 INSERT INTO reader_male values(v_rid,v_rcompany, v_rsex,v_rname,v_raddr);
               ELSE
                 INSERT INTO reader_female values(v_rid,v_rcompany, v_rsex,v_rname,v_raddr);
               ENDIF;
            ENDIF;
          END WHILE outter;
          CLOSE readerInfo_cur;
         END
       ```
### 事务
  * 概述
    * 事务作为单个逻辑单元的执行的一系列操作
    * 多个操作作为一个整体向系统提交，要么执行，要么都不执行，事务是一个不可分割的工作逻辑单元。
    * 适用于多用户同时操作的数据通系统，例如：订票，银行，保险，证券等。
    * **注意**MyISAM:不支持事务，适用于只读程序提高性能。
  * **特性**(ACID)
    1. 原子性(Atomicity)
      * 事务是数据库的逻辑工作单位，事务中包括的诸操作要么全做，要么全不做。
    2. 一致性(Consistency)
      * 事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。
      * 比如银行系统转账过程，要么转账金额从一个账户转入另一个账户，要么两个账户都不变，没有其他情况。
    3. 隔离性(Isolation)
      * 一个事务的执行不能被其他事务干扰。
    4. 持久性(Durability)
      * 一个事务一旦提交，它对数据库中数据的改变就应该是永久性的
  * 事务控制语句
    1. 开启一个事务
      ```
       BEGIN;
       或者
       START TRANSACTION
      ```
    2. 提交事务
      ```
       COMMIT;
       或者
       COMMIT WORK;
      ```
    3. 回滚
      ```
       ROLLBACK;
      ```
  * 事务的处理方式
    * 方式1: 用 BEGIN, ROLLBACK, COMMIT来实现
      ```
       BEGIN 开始一个事务
       ROLLBACK 事务回滚
       COMMIT 事务确认
      ```
    * 方式2: 直接用 SET 来改变 MySQL 的自动提交模式:
      ```
       SET AUTOCOMMIT=0 禁止自动提交
       SET AUTOCOMMIT=1 开启自动提交
      ```
   * DEMO
      ```
       mysql> use RUNOOB;
       Database changed
       mysql> CREATE TABLE runoob_transaction_test( id int(5)) engine=innodb;  # 创建数据表
       Query OK, 0 rows affected (0.04 sec)

       mysql> select * from runoob_transaction_test;
       Empty set (0.01 sec)

       mysql> begin;  # 开始事务
       Query OK, 0 rows affected (0.00 sec)

       mysql> insert into runoob_transaction_test value(5);
       Query OK, 1 rows affected (0.01 sec)

       mysql> insert into runoob_transaction_test value(6);
       Query OK, 1 rows affected (0.00 sec)

       mysql> commit; # 提交事务
       Query OK, 0 rows affected (0.01 sec)

       mysql>  select * from runoob_transaction_test;
       +------+
       | id   |
       +------+
       | 5    |
       | 6    |
       +------+
       2 rows in set (0.01 sec)

       mysql> begin;    # 开始事务
       Query OK, 0 rows affected (0.00 sec)

       mysql>  insert into runoob_transaction_test values(7);
       Query OK, 1 rows affected (0.00 sec)

       mysql> rollback;   # 回滚
       Query OK, 0 rows affected (0.00 sec)

       mysql>   select * from runoob_transaction_test;   # 因为回滚所以数据没有插入
       +------+
       | id   |
       +------+
       | 5    |
       | 6    |
       +------+
       2 rows in set (0.01 sec)
      ```
### 数据库的备份、还原
  * 备份
    1. 导出整个数据库(包括数据库中的数据）
        ```
         MYSQLDUMP -u用户名 -p密码 数据库名 > 备份的数据库名字.sql
        ```
        ```
         MYSQLDUMP -uroot -pjsb backup > backup.sql
        ```
    2. 备份MySQL数据库某个(些)表
       ```
        MYSQLDUMP -u用户名 -p密码 数据库名字 数据库表名1 数据库其他表名2 > 备份数据库名字.sql
       ```
    3. 同时备份多个MySQL数据库
       ```
        MYSQLDUMP -u用户名 -p密码 --databases 需要备份的数据库名字1 需要备份的数据库名字2  > 备份数据库名字.sql
       ```
       * 注意：
          1. --databases  是 "--";
          2. 需要备份的数据库名字1 需要备份的数据库名字2 中间是空格。
    4. 仅仅备份数据库结构
       ```
        MYSQLDUMP --no-data -h主机名 -u用户名 -p密码 --databases 需要备份的数据库名字1 需要备份的数据库名字2  > 备份数据库名字.sql
       ```
    5. 备份服务器上所有数据库
       ```
        MYSQLDUMP --all-databases -h主机名 -u用户名 -p密码 > 备份数据库名字.sql
       ```
    6. 直接将MySQL数据库压缩备份
       ```
        MYSQLDUMP -u用户名 -p密码 数据库名字  | GZIP >备份的数据库名字.sql.gz
       ```
  * 还原
    1. 还原MySQL数据库的命令
       ```
          MYSQL -h主机名 -u用户名 -p密码  需要恢复的数据库名字 < 已备份的数据库名字.sql 
       ```
       ```
          MYSQL -uroot -pjsb bk < bk.sql
       ```
    2. 还原压缩的MySQL数据库
       ```
         GUNZIP < 刚开始备份集中的数据库名字.sql.gz | MYSQL -u用户名字 -p用户密码 需要恢复的数据库名字
       ```
### 用户管理
  * 创建用户
     * 只创建用户
       ```
        CREATE USER 用户名 IDENTIFIED BY '密码'

       ```
     * 创建用户并分配权限
       ```
        GRANT 权限类型 PRIVILEGES ON *.* TO '将权限授予哪个用户' IDENTIFIED BY '密码'; 
        
	     # 权限类型:[ALL|SELECT|INSERT|DELETE|UPDATE]
	     # ON:on：表示这些权限对哪些数据库和表生效，格式：数据库名.表名，这里写“*”表示所有数据库，所有表。如果我要指定将权限应用到test库的user表中，可以这么写：test.user
         # to：将权限授予哪个用户。格式：”用户名”@”登录IP或域名”。%表示没有限制，在任何主机都可以登录。比如：”yangxin”@”192.168.0.%”，表示yangxin这个用户只能在192.168.0IP段登录
       ```
       ```
        GRANT SELECT ON db2.invoice TO 'jack'@'localhost';
	    # 将数据库db2下的invoice的查看权限表授权给jack'@'localhost
       ```
  * 删除用户
       ```
        DROP USERS '用户名'@'主机名';
       ```
       ```
        DROP USER 'yangxin'@'localhost';
       ```
  * 显示用户权限
       ```
         SHOW GRANTS FOR 用户名； //查看指定用户的权限
       ```
       ```
         SHOW PROFILES; //查看所有权限
       ```













