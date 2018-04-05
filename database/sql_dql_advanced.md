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
    * 从分组计算结果中进行过滤筛选.注意与WHERE语句的区别
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
   7. 如果LIMIT语句,再根据限定输出结果行。

   ```
   # 位置顺序也不能乱

   SELECT 聚合函数()，分组列名 FROM 表名
   WHERE 条件
   GROUP BY 列名
   HAVING 分组过滤条件
   ORDER BY <列名> ASC/DESC
   LIMIT

   ```
