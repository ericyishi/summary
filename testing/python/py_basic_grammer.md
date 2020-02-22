# 基础语法
### 输入与输出
* 输入input()
  * 输入的类型都是字符串，所以需要强制转换成其他需要的类型
    ```
    例如：接收int类型的值
     X = int(input("请输入一个数字"))
    ```
	* input 里面的内容为提示信息
* 输出print()
    ```
     print()
    ```
```
  #Python2.x 和 Python3.x 中 raw_input( ) 和 input( ) 区别
   1、在 Python2.x 中 raw_input( ) 和 input( )，两个函数都存在，其中区别为:
	raw_input( ) 将所有输入作为字符串看待，返回字符串类型。
	input( ) 只能接收"数字"的输入，在对待纯数字输入时具有自己的特性，它返回所输入的数字的类型（ int, float ）。
   2、在 Python3.x 中 raw_input( ) 和 input( ) 进行了整合，去除了 raw_input( )，仅保留了 input( ) 函数，其接收任意任性输入，将所有输入默认为字符串处理，并返回字符串类型。
```	

### 关键字
* 可以在交互式界面使用下面方式方式查询内置了哪些关键字
   ```
    >>> import keyword
    >>> keyword.kwlist
   ```
   ```
    ['and', 'as', 'assert', 'break', 'class', 'continue', 'def', 
    'del', 'elif', 'else', 'except', 'exec', 'finally', 'for', 
    'from', 'global', 'if', 'import', 'in', 'is', 'lambda',
     'not', 'or', 'pass', 'print', 'raise', 'return', 'try',
      'while', 'with', 'yield']
   ```
* 目前一共33个关键字，除 True、False 和 None 外，其他关键字均为小写形式
  1. **False** 布尔类型的值，表示假，与 True 相反type(False)为bool
  2. **None** None 比较特殊，表示什么也没有，它有自己的数据类型type(None)为 NoneType
  3. **True** 布尔类型的值，表示真，与 False 相反
  4. **and** 用于表达式运算，逻辑与操作
  5. **as** 用于类对象替换
     ```
       1、导入对象的时候，起到别称的作用，比如现在用Remote代替的就是WebDriver 

       from .webdriver import WebDriver as Remote
 

       2、可以与with组合起来，即经典的with as 用法，with后面紧跟着的对象，会调用它的__enter__方法，返回的对象会赋值给temp

        with object as temp：
 
        pass
      3、与except组合起来，看下面，捕获到Exception对象会赋值给e

        try:
         pass
        except Exception as e:
         pass

     ```
  6. **assert** 断言，用于判断变量或者条件表达式的值是否为真
       * 它用于对一个 bool 表达式进行断言，如果该 bool 表达式为 True，该程序可以继续向下执行；否则程序会引发 AssertionError 错误。 
         ```
           assert x>=0,'x is less than 0' #当为false时候抛出异常，显示后面的内容
          
           等同于：
           if x<0:
             raise Exception,'x is less than 0' 
             
         ```
  7. **break** 中断循环语句的执行
  8. **class** 用于定义类
  9. **continue** 跳出本次循环，继续执行下一次循环
  10. **def** 用于定义函数或方法
  11. **del** 删除变量或序列的值
  12. **elif** 条件语句，与 if、else 结合使用
  13. **else** 条件语句，与 if、elif 结合使用。也可用于异常和循环语句
  14. **except** except 包含捕获异常后的操作代码块，与 try、finally 结合使用
  15. **finally** 用于异常语句，出现异常后，始终要执行 finally 包含的代码块。与 try、except 结合使用
  16. **for** for 循环语句
  17. **from** 用于导入模块，与 import 结合使用
  18. **global** 定义全局变量
  19. **if** 条件语句，与 else、elif 结合使用
  20. **import** 用于导入模块，与 from 结合使用
      ```
       import math
       print(math.pi)
      ```
  21. **in** 判断变量是否在序列中
  22. **is** 判断变量是否为某个类的实例
  23. **lambda** 定义匿名函数
  24. **nonlocal** 用于标识外部作用域的变量
  25. **not**  用于表达式运算，逻辑非操作
  26. **or** 用于表达式运算，逻辑或操作
  27. **pass** 空的类、方法或函数的占位符
  28. **raise**  异常抛出操作
  29. **return** 用于从函数返回计算结果
  30. **try** try 包含可能会出现异常的语句，与 except、finally 结合使用
  31. **while** while 循环语句
  32. **with** 简化 Python 的语句
  33. **yield** 用于从函数依次返回值

### 变量
* Python 中的变量不需要声明。每个变量在使用前都必须赋值，变量赋值以后该变量才会被创建。
* 在 Python 中，变量就是变量，它没有类型，我们所说的"类型"是变量所指的内存中对象的类型。
* 等号（=）用来给变量赋值。
```
 name = "rick"
 print(name)
```
* 变量快速赋值
  ```
   a,b,c=1,2,3
   d,e=(1,2)
   f,g=[3,4]
  ```
* 进行值互换(这是python才有的)
  ```
   a=3,b=4
   a,b=b,a
   
   #还有两种通用方法
   ①会引入第三个变量
   c=a
   a=b
   b=c
   ②不引入第三个变量
   a=a+b
   b=a-b
   a=a-b
  ```

### 占位符
* 占位符就是先占住一个固定的位置，等到数据再往里面添加内容。
* 常在print()函数中使用。
* 常用类型：
  1. **%d** 代表整数
  2. **%f** 代表浮点数
  3. **%s** 代表字符串
  4. **%e** 科学计数
  5. **%c** 字符型
  6. **%x** 十六进制整数
  7. **%X** 时间格式
  8. **%%** %符号
  * **对于我们也不知道打印什么类型的时候用%r**
* 格式
  ```
   %占位符类型 %值
  ```
   * 中间的空格只是为了看着好看，不是必须打空格
  ```
   print("%d+%d=%d" %(1, 2, 1 + 2))
  ```
   * 多个值输出括号括起来，逗号分隔
   
  * 如果输出的值是变量，也需要这样使用
    ```
	 age=18
	 print("年龄为%d"%age)
	```
  * 可以指定浮点小数点后的长度
    ```
     # 保留小数点后两位
     c=2 * math.pi * r
     print("计算后的值为:%.2f" %(c))
    ```
  * 填入的数据也可以是字典类型
    ```
     x="this is a %(obj)s"% {"obj":"pen"}
     print(x) # this is a pen
	 # 注意要把(key)值放在%和s中间
    ```

### 格式化format
  * Python2.6 开始，新增了一种格式化字符串的函数 str.format()，它增强了字符串格式化的功能。相对于老版的%格式方法，它有很多优点。
    1. 在%方法中%s只能替代字符串类型，而在format中不需要理会数据类型
    2. 单个参数可以多次输出，参数顺序可以不相同
    3. 填充方式十分灵活，对齐方式十分强大
    4. 官方推荐用的方式，%方式将会在后面的版本被淘汰
  ```
    a = "i am {},age {}".format("seven",18,"alex")
    print(a) # i am seven,age 18
    b = "i am {},age {}, {}".format(*["seven", 18 ,"alex"])
    print(b) # i am seven,age 18, alex
    c = "i am {0}, age {1}, really {0}".format("seven", 18)
    print(c) # i am seven, age 18, really seven
    d = "i am {0}, age{1}, really {0}".format(*["seven", 18])# 列表前面加一个*
    print(d) # i am seven, age18, really seven
    e = "i am {name}, age {age}, really {name}".format(name="seven", age = 18)
    print(e) # i am seven, age 18, really seven
    f = "i am {name}, age {age}, rally {name}".format(**{"name":"seven", "age":18}) # 字典前面加两个**
    print(f) # i am seven, age 18, really seven
    g = "i am {0[0]},age{0[1]}, really{0[2]}".format([1,2,3],[11,22,33])
    print(g) # i am 1,age2, really3
    h = "i am {:s}, age {:d}, money {:f}".format("seven", 18, 888.1)
    print(h) # i am seven, age 18, money 888.100000
    i = "i am {:s}, age {:d}".format(*["seven", 18])
    print(i) # i am seven, age 18
    j = "i am {name:s}, age {age:d}".format(name="seven",age=18)
    print(j) # i am seven, age 18
    k = "i am {name:s}, age {age:d}".format(**{"name":"seven","age":18})
    print(k) # i am seven, age 18
    m = "numbers:{0:b},{0:o},{0:d},{0:x},{0:%}".format(15) # 2进制、8进制、10进制、16进制、显示百分比（默认显示小数点后6位）
    print(m) # numbers:1111,17,15,f,1500.000000%
    tpl = "numbers: {num:b},{num:o},{num:d},{num:x},{num:X}, {num:%}".format(num=15)
    print(tpl) # numbers: 1111,17,15,f,F, 1500.000000%
  ```























