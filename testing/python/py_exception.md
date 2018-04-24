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

### 自定义异常
   * 关键字raise
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
        content = input("输入一个字符串：长度小于5")
        if (len(content) < 5):
            raise myerr('the inout is of length%d,expecting at lease 5 ' % len(content))
        else:
            print("print success")
    except myerr as var:
        print(var.err)
   ```