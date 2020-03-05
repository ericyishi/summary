# 魔法方法
### 概念
1. 魔法方法就是指双下划綫开头和结尾的方法
2. 通常这类方法不需要主动调用，由特定的方法或行为触发，如__init__方法
3. 用途：通常使用魔方方法控制类的行为，实现对类的高级控制
4. 查看一个类有的方法：dir(类名)，如dir([])查看列表

### __repr__()
* 定制对象print显示规则
  ```html
       #-*- coding: utf-8 -*-
    class A:
        def __init__(self,name):
            self.name=name
        def __repr__(self):
            return 'Student[name='+self.name+"]" #类的自我描述一般格式，类名[attr1=value,attr2=value]
    
    a=A("zhang")
    print(a) 
    print(a.__repr__()) # 两行打印出来是一样的。没有重写__repr__之前显示的是内存地址<__main__.A object at 0x0086F070>，重写后显示Student[name=zhang]
  ```
## __del__()
* 定义对象的析构（销毁对象时，对资源占用的情况处理）方法
* Python 通过调用 __init__() 方法构造当前类的实例化对象，而本节要学的 __del__() 方法，功能正好和 __init__() 相反，其用来销毁实例化对象。
* 大多数情况下，Python 开发者不需要手动进行垃圾回收，因为 Python 有自动的垃圾回收机制（下面会讲），能自动将不需要使用的实例对象进行销毁。
* 常用于连接数据库，读取文件的后的关闭操作
```html
    #-*- coding: utf-8 -*-
    class B:
        def __init__(self,name):
            self.name=name
            self.f=open('1.txt')
        def __del__(self):
            self.f.close()
    b=B('lee')
```
```html
     class CLanguage:
        def __init__(self):
            print("调用 __init__() 方法构造对象")
        def __del__(self):
            print("调用__del__() 销毁对象，释放其空间")
    clangs = CLanguage()
    #添加一个引用clangs对象的实例对象
    c1 = clangs #c1变量引用了clang
    del clangs
    print("***********")
```
* 最后输出的结果：
* 可以看到，当程序中有其它变量（比如这里的 cl）引用该实例对象时，即便手动调用 __del__() 方法，该方法也不会立即执行。这和 Python 的垃圾回收机制的实现有关。

```html
     调用 __init__() 方法构造对象
    ***********
    调用__del__() 销毁对象，释放其空间
```
  * 解释上面：
    ```html
     Python 采用自动引用计数（简称 ARC）的方式实现垃圾回收机制。
     该方法的核心思想是：每个 Python 对象都会配置一个计数器，初始 Python 实例对象的计数器值都为 0，如果有变量引用该实例对象，其计数器的值会加 1，依次类推；
     反之，每当一个变量取消对该实例对象的引用，计数器会减 1。
    如果一个 Python 对象的的计数器值为 0，则表明没有变量引用该 Python 对象，即证明程序不再需要它，此时 Python 就会自动调用 __del__() 方法将其回收。
     
     以上面程序中的 clangs 为例，
     实际上构建 clangs 实例对象的过程分为 2 步，
     先使用 CLanguage() 调用该类中的 __init__() 方法构造出一个该类的对象（将其称为 C，计数器为 0），并立即用 clangs 这个变量作为所建实例对象的引用（ C 的计数器值 + 1）。
     在此基础上，又有一个 c1 变量引用 clangs（其实相当于引用 CLanguage()，此时 C 的计数器再 +1 ），这时如果调用del clangs语句，只会导致 C 的计数器减 1（值变为 1），因为 C 的计数器值不为 0，因此 C 不会被销毁（不会执行 __del__() 方法）。
    ```
* 如果我们重写子类的 __del__() 方法（父类为非 object 的类），则必须显式调用父类的 __del__() 方法，这样才能保证在回收子类对象时，其占用的资源（可能包含继承自父类的部分资源）能被彻底释放。
```html
    class CLanguage:
        def __del__(self):
            print("调用父类 __del__() 方法")
    class cl(CLanguage):
        def __del__(self):
            print("调用子类 __del__() 方法")
            super().__del__() #或者写成CLanguage.__del__(self) #一个是父类的实例调用，一个是通过类名直接调用，效果是一样的
    c = cl()
    del c
```
### __new__()
* 负责创建类的实例
* 注意__init__方法是创建实例后负责初始化，所以先有__new__ 再执行__init__

### __dir__()
* 查看对象的方法和属性名称
* 另外一个dir()是一个函数，调用__dir__()方法对其返回值进行排序，并返回一个列表
```html
    #-*- coding: utf-8 -*-
    class A:
        def __init__(self,name,age):
            self.name=name
            self.__age=age
    
    a=A('rick',18)
    print(a.__dir__())
    print(len(a.__dir__()))#28
    print(dir(a))
    print(len(dir(a)))#28
    print(len(dir(A)))#26
    print(dir(A))
```
* 内容一样，只是排序不同
* 注意dir的内容如果是类名，则不包括实例属性，如dir(A)就没有name、age

## __dict__
* 当作用于**类**时，存储所有实例共享的变量（例如：类属性）和类的方法
* 当作用于**实例对象**时，存储该对象所有的属性名和属性值
* 用途：一般用于动态读取和设置对象的属性
```html
 #-*- coding: utf-8 -*-
 class A:
     def __init__(self,name,age):
         self.name=name
         self.__age=age
 
 a=A('rick',18)
 print(a.__dict__) #{'name': 'rick', '_A__age': 18}
 print(A.__dict__) # {'__module__': '__main__', '__init__': <function A.__init__ at 0x0039CED0>, '__dict__': <attribute '__dict__' of 'A' objects>, '__weakref__': <attribute '__weakref__' of 'A' objects>, '__doc__': None}
 print(a.__dict__['name'])#与a.name效果一样
 # 还可以设置
 a.__dict__['name']='jack'
 print(a.name)
 # 增加属性
 a.__dict__['gender']='male' #但是仅对当前实例增加，不会对别的实例添加该属性
```
### 属性类
1. __getattribute__(self,xxxx):访问对象任意属性（即便不存在）时被自动调用
   * 举个栗子
        ```html
             #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
              def __getattribute__(self, item):
                  print("被访问的属性为%s"%(item))
          
          stu=Student('zhangsan',18)
          stu.name #执行后输出：被访问的属性为name
          stu.gender #执行后输出：被访问的属性为gender
          print(stu.name)#此时获取不到属性值了，原因是重写了__getattribute__方法但是没有返回值造成的
        ```
        * 修改的后的样子
        ```html
              #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
          
              def __getattribute__(self, item):
                  print("被访问的属性为%s"%(item))
                  return super().__getattribute__(item) # 调用父类的这个方法来获取
          
          stu=Student('zhangsan',18)
          stu.name #执行后输出：被访问的属性为name
        ```
        * 对于访问没有定义的属性，是会报错的，所以捕获异常并进行处理
        ```html
          #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
          
              def __getattribute__(self, item):
          
                  try:
                      print("访问了%s属性" % (item))
                      return super().__getattribute__(item)
                  except AttributeError as e:
                      print(e)
                      print('{}为未定义属性，请检查'.format(item))
          
          
          stu=Student('zhangsan',18)
          stu.gender #执行后输出：被访问的属性为gender，并会捕获异常进行处理
        ```
    
    
        
2. __getattr__(self,xxxx):访问**未定义的属性**时被调用
  ```html

  ```