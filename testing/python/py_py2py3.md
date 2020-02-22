# python2与python3的区别
### 区别
```
 PYTHON3不是向下兼容PYTHON2，所以很多在python2里面能用的库在python3里面都不能用了。
```
1. print函数
* Python3中print为一个函数，必须用括号括起来；Python2中print为class
* python2：
  ```
    print 'Python', python_version()
	print 'Hello, World!'
	print('Hello, World!')
  ```
* python3：
  ```
    print('Python', python_version())
	print('Hello, World!')
  ```
2. long整型
* python2中当数字很大时会变成long类型，python3中没有这个概念都是int型【使用type()查看】
  * 自从Python2.2起，如果整数发生溢出，Python会自动将整数数据转换为长整数，所以如今在长整数数据后面不加字母L也不会导致严重后果
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
   
 ### 更多
  * https://www.cnblogs.com/kendrick/p/7478304.html