# 操作数据库
### 数据库切换
* 查看当前数据库名称
    ```html
     db
    ```
    
* 查看所有数据库名称，列出所有在物理上存在的数据库
    ```html
     show dbs
    ```

* 切换数据库
    * 如果数据库不存在，则指向数据库【不会报错】，但不创建，直到插入数据或创建集合时数据库才被创建
    ```html
     use 数据库名称
    ```
* 默认的数据库为test，如果你没有创建新的数据库，集合将存放在test数据库中

* 数据库删除
  * 删除当前指向的数据库
  * 如果数据库不存在，则什么也不做
    ```
    db.dropDatabase()
    ```
### 集合
* 集合创建
  ```html
   db.createCollection(name,options)
  ```    
  * name是要创建的集合的名称
  * options是一个文档，用于指定集合的配置
  * 选项参数是可选的，所以只需要到指定的集合名称。以下是可以使用的选项列表：
    1. 不限制集合大小
       ```html
        db.createCollection("stu")
       ```
    2. 限制集合大小
       * 参数capped：默认值为false表示不设置上限，值为true表示设置上限
       * 参数size：当capped值为true时，需要指定此参数，表示上限大小，当文档达到上限时，会将之前的数据覆盖，单位为字节
         ```
          db.createCollection("stu2", { capped : true, size : 10 } )
         ```
* 查看集合
  ```html
   show collections
  ```      
  
* 删除集合
  ```html
   db.集合名.drop()
  ```     