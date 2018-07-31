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

3. 转码
* python3中使用网络数据传输必须是二进制字节码，所以需要将字符串转码。python2中则不需要,可以字符串传输
* bytes转string使用decode，string转bytes使用encode
  ```
	  # bytes object
	  b = b"example"
	 
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
	  'example'.encode('utf-8')
	  
	 
	  # bytes to str
      bytes.decode(b)
	  # 或者使用：
	  b'\xe2\x82\xac20'.decode('utf-8')
  ```
 ### 更多
  * https://www.cnblogs.com/kendrick/p/7478304.html