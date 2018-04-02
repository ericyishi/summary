# 基础概念
* **实体** 现实世界中客观存在，并且相互区分的事物。
* **关系型模型** 用二维表的形式，用于表示实体与实体之间的联系的数据库模型。
* **sql语句的分类**
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

* **域** 每一个字段，取值范围就是域
* **域的完整性**  域完整性是对数据表中字段属性的约束,通常指数据的有效性,它包括字段的值域、字段的类型及字段的有效规则等约束,它
* **参照完整性**  主表中对应的那外键那一列的取值范围的限定
* **自定义完整性** 根据业务的要求来设置取值范围限定
* **主键**
* **选择主键的原则**
  * 最小性
  * 稳定性
* **主键约束** 非空且唯一
* **唯一约束** 只要求值唯一即可
* **数据库引擎常用类型**
  *  innoDB
  *  MyISAM
