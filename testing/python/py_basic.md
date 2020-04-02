# Python基础概念
### 概念
* Python 是一种面向对象，解释型的动态语言。
* 特点
  * 优雅
  * 明确
  * 简单
* 文件格式以py结尾
* 区分大小写
* 避免使用记事本创建编辑，因为需要修改编码为UTF_8，否则中文无法解析。
* 交互式编程，类似于浏览器的控制台。
  * 进入交互式界面的方式：
     * 在windows系统中运行cmd，输入python
     * 运行idle


### 注释
* 单行注释
  ```
   # 注释内容
  ```
* 多行注释【文档注释】
  ```
    三个单引号(```)或者三个双引号(""")
  ```
  * 使用__doc__可以获取注释内容
    ```
     class test:
        """
         这是类的注释
        """
        def func1(self):
            """
             这是函数的注释
            """
    if __name__=="__main__":
        print(test.__doc__)#注意类型这里不用加上()
        print(test().func1.__doc__)#注意方法这里都是不加上()
    ```
    ```
       这是类的注释
    
         这是函数的注释
    ```

### 缩进
* python是使用缩进来控制语句块的。没有{}
* 缩进一定要保持一致，使用空格就全用空格，使用Tab就全用Tab。

### 编码建议
1. 所有python开头加上编码标志符
   ```html
    # coding:utf-8
   ```
      
### python下查看命令
1. help()帮助文档，写的比较详细
  * help()函数帮助我们了解模块、类型、对象、方法、属性的详细信息
  * 对于关键字，要加上双引号输入查询：help("关键字名")，help("print")
```
 import math
 help(math)
```
```
 NAME
    math

FILE
    (built-in)

DESCRIPTION
    This module is always available.  It provides access to the
    mathematical functions defined by the C standard.

FUNCTIONS
    acos(...)
        acos(x)

        Return the arc cosine (measured in radians) of x.

    acosh(...)
        acosh(x)

        Return the inverse hyperbolic cosine of x.

    asin(...)
        asin(x)

        Return the arc sine (measured in radians) of x.

    asinh(...)
-- More  --

``` 
2. dir() 概要文档，列出有的方法
   * dir()用来查询一个**类或者对象**所有属性和方法
```
 import math
 dir(math)
```
```
  ['__doc__', '__name__', '__package__', 'acos', 'acosh', 
  'asin', 'asinh', 'atan', 'atan2', 'atanh', 'ceil', 'copysign', 
  'cos', 'cosh', 'degrees', 'e', 'erf', 'erfc', 'exp', 'expm1',
   'fabs', 'factorial', 'floor', 'fmod', 'frexp', 'fsum', 
   'gamma', 'hypot', 'isinf', 'isnan', 'ldexp', 'lgamma', 
   'log', 'log10', 'log1p', 'modf', 'pi', 'pow', 'radians', 
   'sin', 'sinh', 'sqrt', 'tan', 'tanh', 'trunc']
```