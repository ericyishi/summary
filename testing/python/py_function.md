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
* 函数也是变量，可以将函数赋值给一个变量。函数的本质是一串字符串，该字符串会保存在内存空间中，函数名是指向这个内存空间地址。
  ```
   a=outer()
   a()
  ```
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
     * 其中一个*号代表list或者tuple，两个\*\*代表map或者dic（字典）
     * 在形参前面使用*号，代表整个数据以元组的形式传入
       ```
        def add(self,a,b,*d):
          sum=a+b
          for i in d:
            sum += i
          return sum
        print(add(4,3,5))
       ```
     * 在形参前面使用**号，存放是以字典的方式
       * 参数在函数内部将被存放在以形式名为标识符的 dictionary 中，这时调用函数的方法则需要采用 arg1=value1,arg2=value2 这样的形式。
       ```
        >>> def a(**x):print x
        >>> a(x=1,y=2,z=3)
            {'y': 2, 'x': 1, 'z': 3} #存放在字典中
       ```
       * 如果传入(1,2,3)这样的形式是会报错的
     * 还可以两结合起来用：
       ```
        def foo(*args, **kwargs):
            print 'args = ', args
            print 'kwargs = ', kwargs
            print '---------------------------------------'
         
        if __name__ == '__main__':
            foo(1,2,3,4)
            foo(a=1,b=2,c=3)
            foo(1,2,3,4, a=1,b=2,c=3)
            foo('a', 1, None, a=1, b='2', c=3)
            
        输出结果如下：
        args =  (1, 2, 3, 4) 
        kwargs =  {} 
        --------------------------------------- 
        args =  () 
        kwargs =  {'a': 1, 'c': 3, 'b': 2} 
        --------------------------------------- 
        args =  (1, 2, 3, 4) 
        kwargs =  {'a': 1, 'c': 3, 'b': 2} 
        --------------------------------------- 
        args =  ('a', 1, None) 
        kwargs =  {'a': 1, 'c': 3, 'b': '2'} 
        ---------------------------------------
       ```
       * **注意：**同时使用*args和**kwargs时，必须*args参数列要在**kwargs前，像foo(a=1, b='2', c=3, a', 1, None, )这样调用的话，会提示语法错误“SyntaxError: non-keyword arg after keyword arg”。
     * 还有一个很漂亮的用法，就是创建字典：
       ```
         def kw_dict(**kwargs):
            return kwargs
            print kw_dict(a=1,b=2,c=3) == {'a':1, 'b':2, 'c':3}
            # 其实python中就带有dict类，使用dict(a=1,b=2,c=3)即可创建一个字典了。
       ```
### lambda函数
  1. 格式
     ```
      函数名=lambda 变量1，变量2: 函数体
      # 调用
      函数名(变量1，变量2)
	  * 参数可以多个，也可以不用赋给一个变量。例如排序
	  list1=[{"name":"rick","age":12},{"name":"ck","age":22},{"name":"fuji","age":18}]
	  list1.sort(key=lambda x:x['name'])
     ```
     ```
      calc = lambda x, y: x ** y
      print(calc(2,4))
     ```
  2. 注意事项
     * 主要是在定义单行函数使用
     * 没有显示地返回值【return】，执行后会默认直接将结果返回。
  3. 应用
     ```
	  def test(a,b,func):
	     result=func(a,b)
		 return result
	  num=test(11,22,lambda x,y:x+y)
	  print(num)
      num2=test(2,3,lambda x,y:x*y)
      print(num2) 	  
	 ```
	 * 上面代码可以优化，因为Python是运行时语言
	 ```
		#coding=utf-8
		import sys
		def test(a, b, func):
			result = func(a, b)
			return result
		value_a = input("请输入一个数:")
		value_b = input("请输入另外一个数:")
		func_new = input("输入一个匿名函数：")  #此处可以输入任意运算，如：lambda x,y:x*y
		print(sys.version[0])
		if(sys.version[0]=='3'):
			print("版本为python3才进入")
			func_new = eval(func_new)  # python3 中需要使用eval，因为python2中使用这个input没有问题，能够直接计算返回结果
		# 但是python3中会直接转化成字符串后报错，所以使用eval变为可以算的
		num = test(int(value_a), int(value_b), func_new)
		print(num)
		
	 ```

### 文档字符串
  * 函式体的第一个语句可以是三引号括起来的字符串， 这个字符串就是函数的
文档字符串，或称为docstring
  * 使用print(函数名.\_\_doc_\_\)输出文档

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


### if __name__ == '__main__'
  ```
   if __name__ == '__main__':
     代码
  ```
  * 这段代码写在每个模块的结尾
  * __name__ 是当前模块名，只有当模块被直接运行时模块名为 __main__ 。如果是在导入模块运行实际显示是模块名。
  * 当模块被直接运行时，以下代码块将被运行，当模块是被导入时，代码块不被运行。

### 嵌套函数
* 通过def关键字定义在另一个函数中的函数叫做嵌套函数
  ```html
   def foo():
     print('in foo')
     def boo():
       print('in boo')   
  ```