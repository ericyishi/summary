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
  * 无输入参数和无输出参数的存储过程
  * 有输入参数的存储过程
### 函数
  * 概述
  * 分类
    1. 系统函数
      * 流程控制函数
        1. CASE
        2. IF
        3. IFNULL
        4. NULLIF
      * 字符串函数
      * 时间函数

    2. 自定义函数
      * 语法
        1. 创建
        2. 删除
        3. 查看
        4. 使用
### 触发器
  * 概述
  * 特点
  * 常见操作
  * 语法
    1. 创建
      * old和new的使用
    2. 删除
    3. 查看
    4. 使用
  * 条件处理器（异常处理）
    * 语法
      1. 创建
### 游标
  * 概念
  * 语法
    1. 定义
    2. 打开游标
    3. 取值
    4. 关闭游标
### 事务
  * 概述
  * **特性**(ACID)
    1. 原子性(Atomicity)
      * 事务是数据库的逻辑工作单位，事务中包括的诸操作要么全做，要么全不做。
    2. 一致性(Consistency)
      * 事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。
    3. 隔离性(Isolation)
      * 一个事务的执行不能被其他事务干扰。
    4. 持久性(Durability)
      * 一个事务一旦提交，它对数据库中数据的改变就应该是永久性的
  * 事务控制语句
  * 事务的处理方式
### 数据库的备份、还原
  * 备份
  * 还原
### 用户管理
  * 创建用户
  * 创建用户并授权
  * 删除用户
  * 显示用户权限













