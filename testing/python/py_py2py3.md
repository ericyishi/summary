# python2��python3������
### ����
```
 PYTHON3�������¼���PYTHON2�����Ժܶ���python2�������õĿ���python3���涼�������ˡ�
```
1. print����
* Python3��printΪһ��������������������������Python2��printΪclass
* python2��
  ```
    print 'Python', python_version()
	print 'Hello, World!'
	print('Hello, World!')
  ```
* python3��
  ```
    print('Python', python_version())
	print('Hello, World!')
  ```
2. long����
* python2�е����ֺܴ�ʱ����long���ͣ�python3��û����������int�͡�ʹ��type()�鿴��
  * �Դ�Python2.2������������������Python���Զ�����������ת��Ϊ����������������ڳ��������ݺ��治����ĸLҲ���ᵼ�����غ��  

3. ת��
* python3��ʹ���������ݴ�������Ƕ������ֽ��룬������Ҫ���ַ���ת�롣python2������Ҫ,�����ַ�������
* bytesתstringʹ��decode��stringתbytesʹ��encode
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
	  # ����ʹ�ã�
	  'example'.encode('utf-8')
	  
	 
	  # bytes to str
      bytes.decode(b)
	  # ����ʹ�ã�
	  b'\xe2\x82\xac20'.decode('utf-8')
  ```
 ### ����
  * https://www.cnblogs.com/kendrick/p/7478304.html