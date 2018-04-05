# SQL高级查询
### 高级查询
* 聚合函数
  * COUNT() 返回结果集，行的数目
    * COUNT(*)与count(列)的区别在于count(列)会忽略null
  * SUM() 返回结果集，所有值的总和
  * AVG() 返回结果集，所有值的平均值
  * MAX() 返回结果集，所有值的最大值
  * MIN() 返回结果集，所有值的最小值
  ```
   注意：
   1.SELECT后面出现了聚合函数，那么这条查询就是按分组返回结果；
   2.出现了聚合函数，SELECT后面出现的普通列（即既不是聚合函数也不是分组列）,那么结果只会显示该列的第一行;
   3.部分数据库，SELECT后面不允许普通列与聚合函数或者分组列并存，会直接报错。
  ```

* 分组 GROUP BY
  ```
   SELECT 分组列 AS FROM 表 GROUP BY 分组列
  ```
  * 将数据行按照分组列来分组，结果是按每个分组输出一行结果。

  * HAVING子句
    * 从分组计算结果中进行过滤筛选。
    * 注意与WHERE语句的区别：
      1. where 是对分组前的数据进行过滤 ;having 是对分组后的数据进行过滤。
      2. where 后面不能使用聚合函数,having可以。

  ```
    SELECT depNo,count(*)
    FROM employee,
    WHERE salary>=2000
    GROUP BY depNo
    HAVING COUNT(*)>1
    # 找出薪水大于等于2000元且达标人数多于1人的部门编号，以及达标人数。
  ```


* 查询SQL语句执行顺序
   1. 首先执行FROM子句，从表中查找数据；
   2. 如果有WHERE子句，则根据其中过滤条件，从表中去掉不满足过滤条件的行；
   3. 根据GROUP BY子句中指定的分组列，对过滤后的表进行分组；
   4. 为每个组计算SELECT子句聚合函数的值，并为每组生成查询结果中的一行；
   5. 如果有HAVING子句，则根据HAVING子句过滤条件，再次对分组结果过滤；
   6. 如果有ORDER BY子句中，则根据ORDER BY子句中的列，对结果集进行排序。
   7. 如果LIMIT语句,再根据限定输出结果行数。
   8. 根据SELECT后面的字段确定显示那些数据。

   ```
   # 位置顺序也不能乱

   SELECT 聚合函数()，分组列名 FROM 表名
   WHERE 条件
   GROUP BY 列名
   HAVING 分组过滤条件
   ORDER BY <列名> ASC/DESC
   LIMIT

   ```

* 组合查询（子查询）
  * 子查询将作为虚表执行查询操作。可作为连接语句中的一个表，也可以作为选择语句中的一个值
  ```
   SELECT <列名>
   FROM <表名>
   WHERE 条件=子查询

   #如果返回条件是多值，要使用关键字IN来匹配【或者使用NOT IN】子查询中的返回的多条记录。

  ```

  * ANY子句
    1. ANY子句表示父查询字需要匹配一条子查询结果就可以执行。
    2. ANY子句中=ANY子查询与IN等效。
    3. ANY子句中>ANY代表大于最小值。
    4. ANY子句中<ANY代表小于最大值。

    ```
     # 找出员工中，只要比部门号为10的员工中的任何一个员工的工资高的员工的姓名个工资。也就是说只要比部门号为10的员工中的那个工资最少的员工的工资高就满足条件。
     SELECT ename,sal
     FROM emp
     WHERE sal > ANY(SELECT sal FROM emp WHERE deptno = 10);
    ```

  * ALL子句
    1. ALL子句中>ALL代表大于最大值
    2. ALL子句中<ALL代表小于最小值

    ```
    # 找到比部门号为20的员工的所有员工的工资都要高的员工，也就是比那个工资最高的员工的还要高的员工
     SELECT ename,sal
     FROM emp
     WHERE sal > all(SELECT sal FROM emp WHERE deptno = 20);
    ```
  * UNION子句
    * UNION 操作符用于合并两个或多个 SELECT 语句的结果集；
    * **请注意**，UNION 内部的 SELECT 语句必须拥有相同数量的列。列也必须拥有相似的数据类型。同时，每条 SELECT 语句中的列的顺序必须相同。
    * UNION 结果集中的列名总是等于 UNION 中第一个 SELECT 语句中的列名。
    * UNION,返回的是一个新的结果集，UNUION结果是取交集，UNION ALL取并集
    ```
    Employees_China:

    E_CN_ID	    E_CN_Name
    01	        Zhang, Hua
    02	        Wang, Wei
    03	        Carter, Thomas
    04	        Yang, Ming
    ```

    ```
     Employees_USA:

     E_US_ID	        E_US_Name
     01	                Yang, Ming
     02	                Bush, George
     03	                Carter, Thomas
     04	                Gates, Bill
    ```

     ```
        使用UNION
        SELECT E_CN_Name FROM Employees_China
        UNION ALL
        SELECT E_US_Name FROM Employees_USA

        结果为【 Yang, Ming出现1次】：
        E_CN_Name
        Zhang, Hua
        Wang, Wei
        Carter, Thomas
        Yang, Ming
        Bush, George
        Gates, Bill
    ```
    ```
        使用UNION ALL
        SELECT E_CN_Name FROM Employees_China
        UNION ALL
        SELECT E_US_Name FROM Employees_USA

        结果为【Yang, Ming出现两次】：
        E_CN_Name
        Zhang, Hua
        Wang, Wei
        Carter, Thomas
        Yang, Ming
        Yang, Ming
        Bush, George
        Gates, Bill
    ```


* 视图
  * 视图可以看做定义在MYSQL上的虚拟表，视图正如其名字的含义一样，是另一种查看数据的入口，常规视图本身并不存储实际数据，而仅仅是存储一个SELECT语句以及所涉及表的元数据METADATA
  * 创建视图
    ```
    CREATE VIEW 视图名(列1，列2...) AS 查询语句
    ```
    ```
    CREATE VIEW view_stu AS SELECT * FROM student;
    ```
  * 修改视图
    ```
    CREATE OR REPLACE VIEW 视图名(列1，列2...) AS 查询语句
    ```
    ```
    CREATE OR REPLACE VIEW view_stu AS SELECT * FROM student;
    ```
  * 使用视图【跟使用表一样即可】
  * 查看数据库中有的视图
    ```
    SHOW TABLES;
    ```
  * 查看视图详情【三种方式】
    ```
    DESC 视图名;
    SHOW TABLE STATUS LIKE ‘视图名’;
    SHOW CREATE VIEW 视图名;
    ```
  * 删除视图
    ```
    DROP VIEW 视图名
    ```
  ```
  视图的优点与缺点
  在程序设计的时候必须先了解视图的优缺点，这样可以扬长避短，视图具有如下的一些优点：
  ● 简单性。视图不仅可以简化用户对数据的理解，也可以简化他们的操作。那些被经常使用的查询可以被定义为视图，从而使用户不必为以后的操作每次都指定全部的条件。
  ● 安全性。通过视图用户只能查询和修改他们所能见到的数据。数据库中的其他数据则既看不见也取不到。数据库授权命令可以使每个用户对数据库的检索限制到特定的数据库对象上，但不能授权到数据库特定行和特定的列上。通过视图，用户可以被限制在数据的不同子集上。
  ● 逻辑数据独立性。视图可以使应用程序和数据库表在一定程度上独立。如果没有视图，应用一定是建立在表上的。有了视图之后，程序可以建立在视图之上，从而程序与数据库表被视图分割开来。
  视图也存在一些缺点，主要如下。
  ● 性能：SQL Server必须把视图的查询转化成对基本表的查询，如果这个视图是由一个复杂的多表查询所定义，那么，即使是视图的一个简单查询，SQL Server也把它变成一个复杂的结合体，需要花费一定的时间。
  ● 修改限制：当用户试图修改视图的某些行时，SQL Server必须把它转化为对基本表的某些行的修改。对于简单视图来说，这是很方便的，但是，对于比较复杂的视图，可能是不可修改的。搜索
  所以，在定义数据库对象时，不能不加选择地来定义视图，应该权衡视图的优点和缺点，合理地定义视图。
  ```
* 联接查询
  1. 表联接分类
     * 内联接【inner join】
     * 外联接
       1. 左外联接【left join】
       2. 右外联接【right join】
  2. 内联接
    ```
      #【显式】
      # INNER关键字可以省
      SELECT S.sname,C.score
      FROM student AS stu
      INNER JOIN course AS co
      ON stu.sno=co.sno
    ```
    上面可以简写成：

    ```
      #【隐式】
      #逗号代替JOIN，WHERE代替ON
      SELECT S.sname,C.score
      FROM student AS stu,course AS co
      WHERE stu.sno=co.sno
    ```

  3. 外联接
     * 注意: 所谓左右表只是针对JOIN而言，JOIN之前的为左表，JOIN之后的为右表

  4. 三者区别
     * left join(左联接) 返回包括左表中的所有记录和右表中联结字段相等记录
     * right join(右联接) 返回包括右表中的所有记录和左表中联结字段相等记录
     * inner join(等值连接) 只返回两个表中联结字段相等的行