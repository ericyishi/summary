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
  ```
   python2��
   long(1)#1L��ǿ�ư�int 1ת���ɳ�����1L
   
   python3��
   long(1)#  name 'long' is not defined���Ҳ������������
  
  ```  

3. ת��
* python3��ʹ���������ݴ�������Ƕ������ֽ��룬������Ҫ���ַ���ת�롣python2������Ҫ,�����ַ�������
* python3��������������byte,Python2����û��
  ```
    #PY2:
    >>> b = b"example"
    >>> type(b) # <type 'str'>
    
    #PY3:
     
     >>> b = b"example"
     >>> type(b)  # <class 'bytes'>
  ```
* bytesתstringʹ��decode��stringתbytesʹ��encode
* bytes��Ҫ�����ڶ����Ƶ����ݴ�����������ͣ��ǳ��ʺ���socket���
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
	  # ����ʹ�ã�
	  s.encode() # b'example'
	  
	 
	  # bytes to str
      bytes.decode(b)
	  # ����ʹ�ã�
	  b.decode('utf-8') # u'example'
	  
  ```
  
4. Ĭ�ϱ���
  * python2Ĭ�ϱ�����ASCII
  * python3���ַ����ı�������unicode,�ļ�Ĭ�ϱ�������utf-8

5. input
 * Python2.x �� Python3.x �� raw_input( ) �� input( ) ����
   1. �� Python2.x �� raw_input( ) �� input( )���������������ڣ���������Ϊ:
	  * raw_input( ) ������������Ϊ�ַ��������������ַ������͡�
	  * input( ) ֻ�ܽ���"����"�����룬�ڶԴ�����������ʱ�����Լ������ԣ�����������������ֵ����ͣ� int, float ����
   2. �� Python3.x �� raw_input( ) �� input( ) ���������ϣ�ȥ���� raw_input( )���������� input( ) ����������������������룬����������Ĭ��Ϊ�ַ��������������ַ������͡�  
 
 ### ����
  * https://www.cnblogs.com/kendrick/p/7478304.html