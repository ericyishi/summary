# 装饰器与闭包

### 装饰器

 #### 概念
 * 是一个函数，为其他函数添加特定功能的函数。
 * @开头，放在其他函数前面
 * 装饰器=高阶函数+嵌套函数
   ```html
    import time
    def A():
        time.sleep(3)
        print("AAA")
    
    def mytimer(func):
        def B():
            start_time = time.time()
            func()
            end_time = time.time()
            print("运行时间", end_time - start_time)
        return B
    
    a=mytimer(A)
    a()
   ``` 
   * 还可以使用python自带的语法糖简化写法
 
 #### 基本原则【需要同时满足】
 * 装饰器不能修改被装饰器函数的源码【使用高阶函数，接收函数名作为形参】
 * 装饰器不会影响被装饰函数原来的调用方式【使用高阶函数，返回值中包含函数名】
   ```html
    #-*- coding: utf-8 -*-
    import time
    def A():
        time.sleep(3)
        print("AAA")
    
    def B(func):
        start_time=time.time()
        print(start_time)
        func()
        end_time=time.time()
        print(end_time)
        print("运行时间",end_time-start_time)
    B(A)  #改变了原来A的直接调用方式，不满足原则2，所以不是装饰器
   ```
 #### 语法糖
   ```html
    import time
    
    def mytimer(func):
        def B():
            start_time = time.time()
            func()
            end_time = time.time()
            print("运行时间", end_time - start_time)
        return B
    
    @mytimer
    def A():
        time.sleep(3)
        print("AAA")
    
    A()
   ```
   * 注意，装饰器函数要写在前面，先进行定义
   * @mytimer实际做的操作就是A=mytimer(A)赋值
   * 最后A()实际调用的是B(),所以如果被装饰的函数带参数，也得在这里传入
 #### 编写装饰器的思路
 1. 定义一个接受函数名作为参数的高阶函数
 2. 在高阶函数中定义一个嵌套函数，在该嵌套函数中：
    1. 封装想要的添加的功能代码
    2. 调用作为参数传入的函数名
    3. 返回嵌套函数的函数名
 
 #### 常见的类型
 1. 被装饰的函数带参数或者不带
    ```html
     def deco(func):
         def inner(*args,**kwargs):
              func(*args,**kwargs)
         return inner 
    ```
    ```
     import time
     
     def mytimer(func):
         def B(name):
             start_time = time.time()
             func(name)
             end_time = time.time()
             print("运行时间", end_time - start_time)
         return B
     
     @mytimer
     def A(name):
         time.sleep(3)
         print("AAA:",name)
     
     A('张三')
    ```
    * 还可以优化下，因为我们不确定被修饰的函数参数的个数，所以可以可变参数来传入
      ```html
        import time
        
        def mytimer(func):
            def B(*args,**kwargs):
                start_time = time.time()
                func(*args,**kwargs)
                end_time = time.time()
                print("runtime is", end_time - start_time)
            return B
        
        @mytimer
        def A(name):
            time.sleep(3)
            print("AAA:",name)
        
        @mytimer
        def C(age,name):
            time.sleep(1)
            print("CCC:",age,name)
        A('zhangsan')
        C(11,'wangxiao')
      ```
2. 装饰器本身带参数
   * 需要新加入一层嵌套函数，并且接收被装饰函数名作为参数，同时需要返回这个函数
   ```html
     def deco(param):#param 为装饰器本身的参数
         def outer(func):
             def inner(*args,**kwargs):
               func(*args,**kwargs)
             return inner 
         return outer
   
   ```
   ```html
     import time

     def mytimer(timer_type):
         print(timer_type)
         def outer(func): # 如果装饰器本身带上参数，又加了一层
              def B(*args,**kwargs):
                  start_time = time.time()
                  func(*args,**kwargs)
                  end_time = time.time()
                  print("runtime is", end_time - start_time)
                  print(timer_type)
              return B
         return outer
     @mytimer(timer_type='min') #用分来计时,A=mytimer(timer_type='min')(foo)
     def A(name):
         time.sleep(3)
         print("AAA:",name)
     
     A('zhangsan')
   ``` 
3. 被装饰器函数带返回值
   * 把内部执行的结果保存下来，再返回该参数即可
   ```html
     def deco(param):
         def outer(func):
           def inner(*args,**kwargs):
               res=func(*args,**kwargs)
               return res
           return inner    
         return outer()
   ```
   ```html
    import time

    def mytimer(timer_type):
        # print(timer_type)
        def outer(func): 
             def B(*args,**kwargs):
                 start_time = time.time()
                 res=func(*args,**kwargs)#需要通过变量保存下来
                 # print res
                 end_time = time.time()
                 # print(timer_type)
                 print("runtime is", end_time - start_time)
                 return res # 然后再返回出来
             return B
        return outer
    @mytimer(timer_type='min') #用分来计时,A=mytimer(timer_type='min')(foo)
    def A(name):
        time.sleep(3)
        # print("AAA:",name)
        return name
    
    print(A('zhangsan'))
   ```
 
### 闭包
 #### 闭包作用
 * 可以用来在一个函数与一组私有变量之间创建关联关系，在给定的函数被多次调用的过程中，让这些私有变量能够保持持久性
   ```html
    func_list=[]
    for i in range(3):
       def clos(i):# 这就是闭包，如果没加上这层，结果是3 3 3
           def myfunc(a):
               return i+a
           return myfunc
       func_list.append(myfunc(i))
      
    for f in func_list:
       print(f(1)) #1 2 3
   ```
 #### 闭包特征
 * 必须要有函数的嵌套，外层函数必须返回内层函数。外层函数相当于给内层函数提供一个包装起来的运行环境
 * 内层函数一定要用到外层函数传入的自由参数
     
### 闭包和装饰器的区别
* 相同点
  1. 都是函数嵌套，分为外层函数和内层函数，而且外层函数要返回内层函数
  2. 代码实现的逻辑类似
  3. 两者均可以实现额外的功能的目的
* 不同点
  * 装饰器：
    1. 外层函数称为装饰器
    2. 装饰器的外层函数主要是提供被装饰函数的引用
    3. 装饰器的外层函数不一定要提供变量
    4. 装饰器的目的：为被装饰器提供额外的功能
    5. 形式上看，闭包为装饰器的子集
  * 闭包：
    1. 外层函数称为闭包
    2. 闭包的外层函数主要是为了提供自由变量
    3. 闭包的外层函数必须提供自由变量，否则闭包没有意义
    4. 闭包的目的是为了保存函数运行环境和局部变量    