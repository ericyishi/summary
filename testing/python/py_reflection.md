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
* setattr:动态添加一个方法或属性
* delattr:动态删除一个方法或属性

