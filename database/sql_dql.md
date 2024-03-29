# SQL命令-DQL
### 简单查询
* 查询全部所有行和列
  ```
   SELECT * FROM 表名
  ```
* 查询部分列
  ```
   SELECT 列名1，列名2 FROM 表名
  ```
  * **注意**:如果查询的类名与表名是数据库的关键字，那么需要用引号括起来才行。
  ```
  例如查询订单表（order），与数据库中ORDER重名,查询需要将表名用引号括起来
   SELECT * FROM "ORDER";
  ```

* 使用AS命名列
  ```
   SELECT 列名 AS 别名 FROM 表名
  ```
  ```
   SELECT id AS 教师工号,pro AS 专业 FROM teacher
  ```
  ```
   SELECT salary+bonus AS 收入 FROM employees
  ```
  * +连接的数据类型必须兼容
  * +连接必须为数值类型，比如int，decimal，float等。
  * 别名可以用引号括起来，也可以不用。

* 限制返回数据的行数【LIMIT】
  ```
   LIMIT INDEX,LENGTH;
  ```
  * 写在查询语句的最后
  * 后面跟两个参数，第一个为数据开始的下标【从0开始】,第二个为截取数据的长度
  * limit 不用加括号括起参数。
  ```
   SELECT * FROM student LIMIT 3,10 #代表从第四条数据开始取，长度为10，即4到13行的数据，共10条
  ```
  * oracle限制行数没有 limit用法，但有伪列rownum
  ```html
   select * from (select t.*,rownum rn from student t) n where n.rn>=4 and n.rn<14
 
   select * from student where rownum<14 minus select * from student where rownum>3
  ```

* 排除重复【DISTINCT】
  ```
   SELECT DISTINCT 列名 FROM 表
  ```
  ```
   SELECT DISTINCT sno FROM score WHERE degree >70 AND degree<90 ;
  ```
* **选择操作(过滤操作)【where】**
  * where是表达式 , 当值为真 , 则取出该行
    ```
	 select * from user where 1; // 取出所有行
     select * from user where 0; // 一行都取不出来
	```
  * 单条件选择
    ```
     SELECT 列名 FROM 表 WHERE 条件=值
    ```
  * 多条件选择
    ```
     SELECT 列名 FROM 表 WHERE 条件=值 AND/OR 条件=值
    ```

  * SQL中的运算符
    * =
    * \>
    * <
    * \>=
    * <=
    * !=或者<>
  * 逻辑表达式
    * AND 或者 &&
    * OR 或者 ||
    * NOT 或者 !
  * 范围操作
    * 除了使用上面运算符以外，还可以使用BETWEEN AND或者NOT BETWEEN AND
    ```
      SELECT 列 FROM 表 WHERE 条件 (NOT) BETWEEN 下限 AND 上限;
    ```
  * 多值匹配
    * OR
    ```
     SELECT 列 FROM 表 WHERE 条件1=值1 OR 条件1=值2 OR 条件1=值3;
    ```
    * 上面的写法可以使用关键字IN
     ```
     SELECT 列 FROM 表 WHERE 条件1 IN(值1,值2,值3);
     ```
    * NOT IN
  * 注意：逻辑表达式也有优先级，AND高于OR,下面的例子可以看出
    ```html
      select * from product p where p.pid=12 OR p.pid=13 AND p.price>15
      --这里会把产品id为13的且价格大于15元的做并集处理。其实我们本意是筛选产品id为12或13且价格大于15元
      select * from product p where (p.pid=12 OR p.pid=13) AND p.price>15
      --可以加个括号或者使用in
      select * from product p where p.pid in(12,13) AND p.price>15
  
    ```  
  * 模糊查询
    * LIKE
      * % : 匹配任意长度的字符串，0或N个
      * _ ：有且只有一个
    ```
     SELECT 列 FROM 表 WHERE 条件 LIKE 通配符;
    ```
    ```
       # 找出姓名是以“张”开头的所有学生信息
         SELECT * FROM student WHERE sname LIKE "张%";
    ```
    ```
       # 找出姓名是以“张”开头且是两个字的所有学生信息
         SELECT * FROM student WHERE sname LIKE "张_";

       # 找出四个字的姓名的学生信息
         SELECT * FROM student WHERE sname LIKE "____";
    ```
	 * like除了模糊查询，在复制表的时候也可以只复制结构不要内容：CREATE TABLE new1 LIKE old2;

  * 空行查询
    * NULL
      * 注意关键字是IS，而不是等于号=
    ```
     SELECT 列 FROM 表 WHERE 条件 IS NULL;
    ```
    ```html
     SELECT * FROM table(表名) WHERE 字段 IS NULL or trim(字段)=''；
    ```
* 排序 ORDER BY + 列名 + 升降序
  * 升序【ASC】【不指名排序关键字，默认是升序】
  * 降序【DESC】
  * 多列排序中间用逗号分隔,优先级是按照列名的顺序确认优先级
  ```
   # 查询学生信息，以年龄升序，性别降序排列
   SELECT * FROM student ORDER BY age,gender DESC;
  ```
  * 值为空放在最后nulls last
  ```html
   SELECT * FROM student ORDER BY age DESC nulls last;
  ```

