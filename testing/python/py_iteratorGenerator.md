# 迭代器与生成器

### 迭代器
 #### 迭代对象的概念
 * 在python任意对象中，只要它定义了可以返回一个迭代器的__iter__方法，或者定义了可以支持下标索引的__getitem__方法，那么它就是一个可迭代对象。
 ```html
  dir([])#就能看到列表中有__iter__方法
 ```
 * 即迭代对象可以用for循环遍历
 
 #### 如何判断一个对象是否为迭代对象
 * 方法1：isinstance(对象,Iterable)
   ```html
    #-*- coding: utf-8 -*-
    from collections import Iterable #需要导入collections库
    class A:
        pass
    print(isinstance([],Iterable))#True
    print(isinstance(A,Iterable)) #False
   ```
 * 方法2：hasattr+ __getitem__
   ```html
    print(hasattr([],'__getitem__')) #True
    print(hasattr([],'__iter__')) #True
   ```
 #### 将普通对象变为可迭代对象
 * 增加__getitem__方法
   ```html
      #-*- coding: utf-8 -*-
      from collections import Iterable
      class A:
          def __init__(self,people):
              self.people=people
          def __getitem__(self, item): #item是解释器帮我们维护的索引值，在for循环中，索引就从0开始计数
              return self.people[item]
      
      a=A(['p1','p2','p3'])
      # for i in a.people:
      #     print i
      for i in a:
          print i
   ```
 #### 迭代器对象
 * 与可迭代对象是两个不同的概念
 * 迭代器对象就是同时实现了__next__和__iter__方法的对象。
 * 其中__iter__方法返回迭代器自身
 * __next__方法不断返回迭代器下一个值，直到容器中没有更多的元素时则抛出StopIteration异常来终止迭代
 * 也没有固定的长度，所以len()也不可以用
 * 迭代器迭代完后里面就没有东西了，只能迭代一次
   ```html
    for i in a_iter: # a_iter是一个可迭代对象
        print(i)
    for i in a_iter: # 这个循环将没有值输出
        print(i) 
   ```
 * 为什么有了迭代对象，还要有迭代器？
   * 迭代器是工厂模式，节约内存空间。这也是使用迭代器的原因，所以可以一次性生成无限多的元素而不会内存溢出
   ```html
    #-*- coding: utf-8 -*-

    from itertools import count
    counter =count(start=10)#从10开始取，无上限
    print(dir(counter))
    print(next(counter))
    print(next(counter))
   ```
 #### 如何判断是否是迭代器
   ```html
    from collections import Iterator
    from itertools import count
    counter =count(start=10)#从10开始取，无上限
    
    print(isinstance(counter,Iterator))#True

   ```  
 #### 强制转化为迭代器
   * iter()方法
   ```html
    a = [1, 2, 3]
    print(type(a)) #<type 'list'>
    a_iter = iter(a)  # 将a这个可迭代对象变为迭代器对象
    print(type(a_iter))#<type 'listiterator'>
    print(next(a_iter)) #1
    print(next(a_iter)) #2
    print(next(a_iter)) #3
    print(next(a_iter)) #报错StopIteration
    
   ```
### 生成器
 #### 概念
 * 生成器是一种特殊的迭代器
 * 更加优雅，不需要像迭代器一样写__iter__()和__next__()方法了
 * 只需使用yield关键字，只要一个函数使用了一个或多个yield关键字，这个函数就会变成一个生成器
 * 使用"next(生成器实例)"或"生成器实例.send(None)"来预激活 
 * 使用for循环每次循环实际就是调用的next()，最后for循环会自行处理StopIteration异常
 
 #### yield关键字
 * 程序在代码中遇到yield会返回结果
 * 保留当前函数的函数的运行状态，等待下一次调用，**下次调用从上一次返回yield出开始执行后面的语句**，这也是与return的区别
   ```html
    def demo():
    print('hello')
    yield 5
    print('world')
    c=demo() #并没有直接执行
    print(next(c))#使用next才会进入，并执行到yield之前的语句
    print(next(c))#从打印'world'开始，并报StopIteration异常结束
   ```
 #### 其他方法
 * send()方法
   * 可以像next()一样调用生成器
   * 另外send方法在调用生成器时，可以同时给生成器传递数据到生成器的内部【next不行】
   ```html
    #-*- coding: utf-8 -*-
    def demo():
        print('hello')
        t=yield 5 #t是用于接收send传入的值，而非是后面yield返回的5
        print('world')
        print(t) #123
    
    c=demo() #并没有直接执行
    print(next(c))#使用next才会进入，并执行到yield之前的语句
    c.send("123")
   ```
   * 第一次使用send()方法时候，必须要传入一个None，不能直接传参
 #### 生成器创建
 1. 上面在函数中使用yield  
 2. 通过元组包裹生成
    ```html
     a=(i for i in range(10))
    ```