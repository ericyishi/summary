# 分层
* 案例：使用MVC思想完成转账操作

### MVC
1. 概念
   * 就是业务逻辑，代码，显示三者相分离的思想
   * M：model 模型
     * 作用：主要是封装数据，封装对数据的访问
   * V：view 视图
     * 作用：主要用于展示数据，一般jsp担任
   * C： ctrl 控制
     * 作用： 接受请求，找到相应的javabean完成业务逻辑
2. mvc的体现
    * servlet
       * 缺点：生成html内容太麻烦，所以产生了jsp
    * jsp
       * 缺点：阅读麻烦，维护困难，所以又有了javabean
    * jsp+javabean【这种设计模式，已经淘汰】
       * jsp的model1：
         * jsp：接收请求，展示数据
         * javabean【可重用组件】：和数据打交道

    * jsp+javabean+servlet
       * jsp的model2【mvc思想的体现】：
         * jsp：展示数据
         * javabean：和数据打交道
         * servlet：接受请求，处理业务逻辑
         ```
          //BeanUtils一套开发包，Apache公司提供 ，专门进行javabean操作，在web层各种框架中被使用，例如：struts 使用BeanUtils操作JavaBean 。
          使用步骤：
           1.导入jar包
           2.使用：
           * BeanUtils.populate( Object bean, Map properties )
           * 这个方法会遍历map<key, value>中的key，如果bean中有这个属性，就把这个key对应的value值赋给bean的属性。
         ```
### javaweb分层
1. web层
   * 作用：
     1. 展示数据
        * jsp
     2. 接收请求
        * servlet
            * 找到对应的service,调用方法，完成逻辑操作
            * 信息生成或者跳转
2. service【业务层核心】
   * 作用：
      1. 完成作业操作
      2. 调用dao层
3. dao（data access object 数据访问对象）
   * 持久层
   * 对数据库的curd操作
