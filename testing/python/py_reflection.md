# 反射
### 概念
* 通过**字符串的形式**在**运行时动态**修改程序的变量，方法以及属性的操作
* 对于反射操作中所有的修改都会在**内存中**进行，不会修改代码
* 目的：主要提高代码在运行时的灵活性

### 涉及的方法
* hasattr(object,str):输入一个字符串，判断对象有没有这个方法或属性。返回布尔值
* getattr(object,str):获取对象的属性值或方法的引用。如果是方法，则返回方法的**引用**；如果是属性则直接返回值；如果属性或方法不存在，则抛出异常
  * func=getattr(people,sleep)
  * 执行：func() # 调用对应的sleep方法
    ```html
     content=input("请输入你想调用的方法或属性名")
     if hasattr(people,content):
        try:
          func=getattr(people,content)
          func() 
        except TypeError as e: 
           print(getattr(people,content))
    ```
* setattr(object,str,value):动态添加一个方法或属性
  * 添加属性
    ```html
     #-*- coding: utf-8 -*-
       class A:
           def __init__(self,name):
               self.name=name
           def sleep(self):
               print("{}正在睡".format(self.name))
       
       
       a=A("zhangsan")
       setattr(a,"age",3) #新增属性
       print(dir(a)) #check的方式1
       print(getattr(a,'age')) #check的方式2
    ```
  * 添加方法
    * setattr(obj,"新定义的方法名",obj外的一个方法引用)  
* delattr(obj,str):动态删除一个属性或方法。
  ```html
#-*- coding: utf-8 -*-
    def run():
        print("在跑")
    class A:
        def __init__(self,name):
            self.name=name
        def sleep(self):
            print("{}正在睡".format(self.name))
    
    a=A("zhangsan")
    # setattr(a,"age",3) #新增属性
    # print(dir(a)) #check的方式1
    # print(getattr(a,'age')) #check的方式2
    setattr(a,"a_run",run)
    print(dir(a))
    delattr(a,'a_run')
    print(dir(a))
    delattr(a,'sleep') # 注意这里删除本来的方法会报错的。
    # func()
    print(dir(a))
  ```
  * 删除对象本身方法会报错的原因是：
  
  ```html
    delattr和setattr其实都只能针对对象的属性，
    刚刚看到的setattr动态设置的方法之所以能被delattr删除，
    是因为setattr添加一个方法时，本质上是设置一个属性，
    这个属性指向新添加的函数的地址，所以调用这个属性的时候，执行了方法而已，
    而不是真正把这个方法加到这个对象上。
    所以就是删除不了实际的定义的方法。
    只能删除属性或方法的引用。
    所以作者之所以把方法名叫做setattr和delattr，名副其实，诚不我欺也
  ```
    
