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