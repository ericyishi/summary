# 异常
### 概念
1. 错误
   * 语法错误
2. 异常
   * 运行期间检测到的错误是异常

### 格式
    ```
     try：
       需要检查的代码【认为某些代码可能会出错】
     except 指定的异常类型：
       捕获异常后的处理
     else：
       没有异常时候执行的语句
     finally：
       无论是否异常都会执行
    ```
    * “指定的异常类型”可以省略不写或者写Exception
    ```
     try：
       需要检查的代码
     except Exception as e：
       print(e)
    ```
    * 这种方式能打印出异常的类型
### 异常类基类
* 所有异常类都是继承于Exception
* python2.5以后，继承于新的基类BaseException，包括Exception也是
  ```
   try:
    print(a)
   except BaseException as e: #使用Exception也是可以的
    print(e)
  ```
  * python2中写法是用逗号“,”代替 as
### 抛出异常
  * 关键字raise
  * raise只能抛出python中提供的异常类（可以继承），自定义一个没有的类型，是无法使用的
  ```
   主动抛出异常终止程序
   raise 异常名称(‘异常描述’)
  ```
### 自定义异常

   ```
    try:
        name = input("请输入变量名称:")
        if name.isdigit():
            raise NameError("不要全用数字")
    except NameError as e:
        print(e)
   ```
   ```
   //自定义一个异常类继承于Exception
    class myerr(Exception):
        def __init__(self, err):
            Exception.__init__(self)
            self.err = err


    try:
        content = input("输入一个字符串：长度大于5：")
        if (len(content) < 5):
            raise myerr('the input is of length %d,expecting at lease 5 ' % len(content))
        else:
            print("print success")
    except myerr as var:
        print(var.err)

     # 输入123
     # 打印内容：the input is of length 3,expecting at lease 5
   ```