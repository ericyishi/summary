# python2与python3的区别

### 区别
```
 PYTHON3不是向下兼容PYTHON2，所以很多在python2里面能用的库在python3里面都不能用了。
```
1. print函数
* Python3中print为一个函数，必须用括号括起来；Python2中print为class
* python2：
  ```
    import platform
    print 'Python', platform.python_version()
	print 'Hello, World!'
	print('Hello, World!')
  ```
* python3：
  ```
    import platform
    print('Python', platform.python_version())
	print('Hello, World!')
  ```
2. long整型
* python2中当数字很大时会变成long类型，python3中没有这个概念都是int型【使用type()查看】
  * 自从Python2.2起，如果整数发生溢出，Python会自动将整数数据转换为长整数，所以在python3长整数数据后面不加字母L也不会导致严重后果
  ```
   python2：
   long(1)#1L，强制把int 1转化成长整型1L
   
   python3：
   long(1)#  name 'long' is not defined，找不到这个方法了
  
  ```  

3. 转码
* python3中使用网络数据传输必须是二进制字节码，所以需要将字符串转码。python2中则不需要,可以字符串传输
* python3新增的数据类型byte,Python2里面没有
  ```
    #PY2:
    >>> b = b"example"
    >>> type(b) # <type 'str'>
    
    #PY3:
     
     >>> b = b"example"
     >>> type(b)  # <class 'bytes'>
  ```
* bytes转string使用decode，string转bytes使用encode
* bytes主要是用于二进制的数据处理的数据类型，非常适合于socket编程
  ```
	  # bytes object
	  b = b"example"
	  print(b) # <class 'bytes'>
	 
	  # str object
	  s = "example"
	 
	  # str to bytes
	  bytes(s, encoding = "utf8")
	 
	  # bytes to str
	  str(b, encoding = "utf-8")
	 
	  # an alternative method
	  # str to bytes
	  str.encode(s)
	  # 或者使用：
	  s.encode() # b'example'
	  
	 
	  # bytes to str
      bytes.decode(b)
	  # 或者使用：
	  b.decode('utf-8') # u'example'
	  
  ```
  
4. 默认编码
  * python2默认编码是ASCII
  * python3，字符串的编码变成了unicode,文件默认编码变成了utf-8

5. input
 * Python2.x 和 Python3.x 中 raw_input( ) 和 input( ) 区别
   1. 在 Python2.x 中 raw_input( ) 和 input( )，两个函数都存在，其中区别为:
	  * raw_input( ) 将所有输入作为字符串看待，返回字符串类型。
	  * input( ) 只能接收"数字"的输入，在对待纯数字输入时具有自己的特性，它返回所输入的数字的类型（ int, float ）。
   2. 在 Python3.x 中 raw_input( ) 和 input( ) 进行了整合，去除了 raw_input( )，仅保留了 input( ) 函数，其接收任意任性输入，将所有输入默认为字符串处理，并返回字符串类型。  
      * 因为返回时字符串类型，对于其他类型需要强制转换
        ```html
          x=int(input("请输入一个数字"))
        ```

6. 除法/
 * python2中整数相除，丢弃小数部分
 * python3中整数相除，整数相除如果有小数部分，会保留。如果希望得到一个整数，使用//
 
7. range()
 * python2返回的是一个列表
   ```html
    range(1,10)
    # [1, 2, 3, 4, 5, 6, 7, 8, 9]
   ```
 * python3返回是一个迭代器 
   ```html
     x=range(1,10)
       for i in x:
         print(i)
   ```
8. 文件读写
   * Python2随机写入二进制文件
     ```
       with open('/python2/random.bin','w') as f:
          f.write(os.urandom(10))   #os.urandom()此方法返回一个字符串，该字符串表示适合加密用途的随机字节
     ```
     * python3这样写会报错，TypeError:must be str, not bytes
     * Python3给open函数添加了名为encoding的新参数，而这个新参数的默认值却是‘utf-8’。这样在文件句柄上进行read和write操作时，系统就要求开发者必须传入包含Unicode字符的实例，而不接受包含二进制数据的bytes实例。
   * 解决：
     ```
      with open('python3/rndom.bin','wb') as f:
         f.write(os.urandom(10))
     ```
 ### 更多
  * https://www.cnblogs.com/kendrick/p/7478304.html

### python自带转换工具
* C:\Python27\Tools\Scripts下面的2to3.py
* 运行
  ```html
   python 2to3.py 需要对比的python2文件
  ```  
* 查看帮助
  ```html
   python 2to3.py --help
  ```  

### 兼容性写法
* 判断不同的python版本方法为：
  ```html
   >>> import sys
   >>> sys.version_info.major #获取python的大版本号
   >>> sys.version_info # sys.version_info(major=2, minor=7, micro=15, releaselevel='final', serial=0)
  ```  