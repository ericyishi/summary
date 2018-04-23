# 函数
### 1. 概述
* 作用域
  * L （Local） 局部作用域
  * E （Enclosing） 闭包函数外的函数中
  * G （Global） 全局作用域
  * B （Built-in） 内建作用域
  ```
  x = int(2.9)  # 内建作用域

  g_count = 0  # 全局作用域
  def outer():
    o_count = 1  # 闭包函数外的函数中
    def inner():
      i_count = 2  # 局部作用域
  ```
  * global只有在函数内部对变量进行全局声明，该变量才是一个完整的全局变量(在函数外部可以对该变量进行任意操作)

### 定义与使用
* 1.格式
  ```
   def 函数名():
      函数体

   # 调用
   函数名()
  ```
  * 没有显示使用return返回值，默认是返回None
### 传参
  1. 必需传参
     * 默认情况下，实际参数，要跟定义的形参个数、位置保持一致
  2. 关键字参数
     * 可以指定传入的实参对应哪一个形参的
     ```
      def minus(a, b):
       return a - b
       print(minus(b=4, a=5)) # 1
     ```
  3. 默认参数
     * 可以在不传入参数时赋默认值，当传入值时，使用传入的值
        ```
         def add(a,b=5):
            return a+b
         print(add(5, 10))  # 15
         print(add(5))  # 10
        ```
        ```
        # 一个默认值的demo
         def count(str, substr, begin=0, end=0):
           begin = begin or 0
           end = end or len(str)
           str = str[begin:end]
           return str.count(substr)


         str = "abcabcabc"

         print(count(str, "c"))
         print(count(str, "c", 0))
         print(count(str, "c", 0, 9))
         print(count(str, "c", 5, 9))
        ```
  4. 不定长参数
     * 在形参前面使用*号，代表不定长参数
       ```
        def add(*b):
          sum=0
          for i in b:
            sum =sum +i
          return sum
        print(add(4,3,5))
       ```
### lambda函数
  1. 格式
     ```
      函数名=lambda 变量1，变量2: 函数体
      # 调用
      函数名(变量1，变量2)
     ```
     ```
      calc = lambda x, y: x ** y
      print(calc(2,4))
     ```
  2. 注意事项
     * 主要是在定义单行函数使用
     * 没有显示返回值【return】，执行后默认直接将结果返回。

### 文档字符串
  * 函式体的第一个语句可以是三引号括起来的字符串， 这个字符串就是函数的
文档字符串，或称为docstring
  * 使用print(函数名.__doc__)输出文档

  ```
   def myCount(str, substr):
    """
     @AUTHOR:rick
     @FUNC:COUNT THE NUMBER of substr from main str
     @ARGS:arg1:main str
           arg2:sub str
     @RETURN the count，int
    """
    return (len(str.split(substr)) - 1)

   print(myCount.__doc__)
  ```
