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

* 限制返回数据的行数
  ```
   LIMIT INDEX,LENGTH;
  ```
  * 写在查询语句的最后
  * 后面跟两个参数，第一个为数据开始的下标【从0开始】,第二个为截取数据的长度
  * limit 不用加括号括起参数。
  ```
   SELECT * FROM student LIMIT 3,10
  ```

* 排除重复
  ```
   SELECT DISTINCT 列名 FROM 表
  ```
  ```
   SELECT DISTINCT sno FROM score WHERE degree >70 AND degree<90 ;
  ```
* 选择操作(过滤操作)【where】
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