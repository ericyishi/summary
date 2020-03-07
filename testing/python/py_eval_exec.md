# eval()与exec()
* 可以动态将字符串解析成python代码来执行
### eval()方法
* eval(expression,globals=None,locals=None)
  * expression字符串简单表达式
  * globals，设置为全局的命名空间，就会使用全局定义的变量的值
  * locals，使用本地的变量的值
  * 如果globals和locals都没有设置，就是找上下文的变量值
  * 如果globals和locals都有设置，先使用locals的值，没有的值在使用globals里面的
    ```html
        #-*- coding: utf-8 -*-
        a = 10
        b = 20
        c = 30
        g = {'a': 6, 'b': 8}
        t = {'b': 100, 'c': 10}
        print(eval('a+b+c')) #60
        # print(eval('a+b+c', g)) #会报错，因为global里面找不到c，这时候eval的作用域就是g指定的这个字典了，也就是外面的c=30被屏蔽掉了，eval是看不见的
        print(eval('a+b+c', g, t)) #116.a使用的是globals里面的
    ```
### exec()方法
* exec(obj,globals=None,locals=None)
  ```html
    x=1
    y=exec('x=x+1')
    print(x,y)#2,None
    exec('a=[]\na.append(2)')#\n是换行
    print(a)# [2]
  ```
### 两者区别
* 第一个参数不同。eval是字符串表达式，exec是对象或字符串表达式
* 返回值。eval有返回值，exec无返回值
* 生命周期。eval就算表达式，生命周期就结束。exec存活周期更长，可以在外部继续使用

### 常见用法
* 类型转换：把以字符串包裹的转化为对应的列表，字典等类型
  ```html
    # 注意使用eval和exec两种方法在写法上有不同
    a = "{'name':'zhangsan','age':18}"
    print(type(a)) # <class 'str'>
    b = eval(a)
    print(type(b)) # <class 'dict'>
    c = "mydic={'name':'zhangsan','age':18}"
    print(type(c)) # <class 'str'>
    exec(c)
    print(type(mydic)) # <class 'dict'>
  ```