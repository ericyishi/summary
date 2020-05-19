# urllib库
* 是python自带发送http请求的库
* urllib2 是 Python2.7 自带的模块(不需要下载，导入即可使用)
  * urllib2 官方文档：https://docs.python.org/2/library/urllib2.html
  * urllib2 源码：https://hg.python.org/cpython/file/2.7/Lib/urllib2.py
* 在 python3.x 中,引入包urllib2找不到，被改为urllib.request 

### urllib与urllib2的区别
* 在python中，urllib和urllib2不可相互替代的，而不是urllib2简单是urllib的升级版本
* rllib2可以接受一个Request类的实例来设置URL请求的headers，urllib仅可以接受URL。这意味着，你不可以伪装你的User Agent字符串等。
* urllib提供urlencode方法用来GET查询字符串的产生，而urllib2没有。这是为何urllib常和urllib2一起使用的原因
* 编码工作使用urllib的urlencode()函数，帮我们将key:value这样的键值对转换成"key=value"这样的字符串，解码工作可以使用urllib的unquote()函数。（注意，不是urllib2.urlencode() )
### urlopen方法
```html
   # urllib2_urlopen.py
  
  # 导入urllib2 库
  import urllib2
  
  # 向指定的url发送请求，并返回服务器响应的类文件对象
  response = urllib2.urlopen("http://www.baidu.com")
  
  # 类文件对象支持 文件对象的操作方法，如read()方法读取文件全部内容，返回字符串
  html = response.read()
  
  # 打印字符串
  print html
```
* 上面打印出来的内容，即为浏览器上打开百度主页， 右键选择“查看源代码”，你会发现，跟我们刚才打印出来的是一模一样。
* 通过有没有第二个参数data参数，来区分get和post。没有data即为get请求
* urllib2默认的User-Agent头为：Python-urllib/x.y（x和y是Python主版本和次版本号,例如 Python-urllib/2.7）
### request对象
* 如果要增加或修改报文头里面的内容需要创建一个 Request 实例来作为urlopen()的参数；
   ```html
     #urllib2_useragent.py
     
     import urllib2
     
     url = "http://www.itcast.cn"
     
     #IE 9.0 的 User-Agent，包含在 ua_header里
     ua_header = {"User-Agent" : "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;"} 
     
     #  url 连同 headers，一起构造Request请求，这个请求将附带 IE9.0 浏览器的User-Agent
     request = urllib2.Request(url, headers = ua_header)
     
     # 向服务器发送这个请求
     response = urllib2.urlopen(request)
     
     html = response.read()
     # 也可以指定编码,默认是utf8
     # html = response.read().decode("gbk")
     print html
   ```
* 添加更多的Header信息
  * Request.add_header() 添加/修改一个特定的header
  * Request.get_header()来查看已有的header
  ```html
   # urllib2_headers.py

   import urllib2
   
   url = "http://www.itcast.cn"
   
   #IE 9.0 的 User-Agent
   header = {"User-Agent" : "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;"} 
   request = urllib2.Request(url, headers = header)
   
   #也可以通过调用Request.add_header() 添加/修改一个特定的header
   request.add_header("Connection", "keep-alive")
   
   # 也可以通过调用Request.get_header()来查看header信息
   # request.get_header(header_name="Connection")
   
   response = urllib2.urlopen(req)
   
   print response.code     #可以查看响应状态码
   html = response.read()
   
   print html
  ```
* 随机的user-agent
  ```html
    # urllib2_add_headers.py
    
    import urllib2
    import random
    
    url = "http://www.itcast.cn"
    
    ua_list = [
        "Mozilla/5.0 (Windows NT 6.1; ) Apple.... ",
        "Mozilla/5.0 (X11; CrOS i686 2268.111.0)... ",
        "Mozilla/5.0 (Macintosh; U; PPC Mac OS X.... ",
        "Mozilla/5.0 (Macintosh; Intel Mac OS... "
    ]
    
    user_agent = random.choice(ua_list)
    
    request = urllib2.Request(url)
    
    #也可以通过调用Request.add_header() 添加/修改一个特定的header
    request.add_header("User-Agent", user_agent)
    
    # 第一个字母大写，后面的全部小写
    request.get_header("User-agent")
    
    response = urllib2.urlopen(req)
    
    html = response.read()
    print html
  ``` 
### urlencode
* URL 的构成字符必须是可写的 ASCII 字符，所以中文时候需要对 URL 进行 Encode 编码
* urllib提供urlencode方法进行编码，unquote进行解码
  ```html
   urllib.urlencode(values) 
  ```
  * 其中values为所需要编码的数据，并且只能为**字典**类型
  ```html
    import urllib

   
    keyword={'username':'张三'}
    data=urllib.urlencode(keyword) # 'username=%E5%BC%A0%E4%B8%89'

    urllib.unquote(data) # 'username=\xe5\xbc\xa0\xe4\xb8\x89'

    print urllib.unquote(date)  # username=张三
  ```
  * 通过urllib.urlencode()方法，将字典键值对按URL编码转换，从而能被web服务器接受