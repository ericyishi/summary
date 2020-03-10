# MongoDB
* 是一个基于分布式文件存储的NoSQL数据库
* 由C++开发的，性能高
* 目的是为了WEB应用提供可扩展性的高性能数据存储解决方案

### MongoDB 特点
* 面向集合的存储：适合存储JSON风格文件的形式
* 模式自由：可以把不同结构的文档存储在同一个数据库里
* 支持内存存储，也支持传统的硬盘存储

### 与关系型数据库名词的对比
| 关系型数据库               | mongodb      |
| -------------------------| ------------ |
| database                 | database     |
| table                    | collection   |
| row                      | document     |
| column                   | field        |
| index                    | index        |
| table joins              | mongodb不支持 |
| primary key              | primary key  |
* mongodb三要素：数据库、集合、文档
* 文档：就是一个对象，由键值对组成，是json格式的扩展
* 集合：类似于关系数据库中的表，存储多个文档，结构不固定，如下面三个没有关系文档可以存储在一个集合中：
  ```html
   {'name':'zhangsan','gender':'male'}
   {'name':'lisi','age':10}
   {'id':'001','isPay':false}
  ```
  
### 基本操作
1. [安装说明](mongodb_install.md) 
2. [操作数据库和集合](mongodb_operate.md)
3. [数据类型](mongodb_dataType.md)
4. 
