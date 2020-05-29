# requests库
### 简介
* Python HTTP 库，支持Python 2.6~3.5
* 底层实现其实就是 urllib3，继承了urllib2的所有特性。
* Requests支持HTTP连接保持和连接池，支持使用cookie保持会话，支持文件上传，支持自动确定响应内容的编码，支持国际化的 URL 和 POST 数据自动编码。
* 文档：开源地址：https://github.com/kennethreitz/requests
* 文档：中文文档 API： https://requests.readthedocs.io/zh_CN/latest/

### get请求（headers参数 和 parmas参数）
```
 response = requests.get("http://www.baidu.com/")

 # 也可以这么写
 # response = requests.request("get", "http://www.baidu.com/")
```
* 添加 headers 和 查询参数
   * 如果想添加 headers，可以传入headers参数来增加请求头中的headers信息
   * 如果要将参数放在url中传递，可以利用 params 参数
     * 如果是传入多个参数，直接在字典里写入多个即可
       ```
         parm={'a':'123','b':'456'}
       ```

  ```
    import requests

    kw = {'wd':'长城'}
     user_agent = [
            "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
            "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50",
            "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0",
            "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.3; rv:11.0) like Gecko",
            "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)",
            "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0)",
            "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)",
            "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)",
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0.1) Gecko/20100101 Firefox/4.0.1"
            ]
			
     headers =  {'User-Agent': random.choice(user_agent)}

    # params 接收一个字典或者字符串的查询参数，字典类型自动转换为url编码，不需要urlencode()
    response = requests.get("http://www.baidu.com/s?", params = kw, headers = headers)

    # 查看响应内容，response.text 返回的是Unicode格式的数据
    print response.text

    # 查看响应内容，response.content返回的字节流数据 b'xxxx'
    print respones.content

    # 查看完整url地址
    print response.url

    # 查看响应头部字符编码
    print response.encoding

    # 查看响应码
    print response.status_code
  ```
  * 使用response.text 时，Requests 会基于 HTTP 响应的文本编码自动解码响应内容，大多数 Unicode 字符集都能被无缝地解码。
  * 使用response.content 时，返回的是服务器响应数据的原始二进制字节流，可以用来保存图片等二进制文件。
### post请求
```
 response = requests.post("http://www.baidu.com/", data = data)
```
* 传入data数据
  *  对于 POST 请求来说，我们一般需要为它增加一些参数。那么最基本的传参方法可以利用 data 这个参数。
```
 import requests

 formdata = {
     "type":"AUTO",
     "i":"i love python",
     "doctype":"json",
     "xmlVersion":"1.8",
     "keyfrom":"fanyi.web",
     "ue":"UTF-8",
     "action":"FY_BY_ENTER",
     "typoResult":"true"
 }

 url = "http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=null"

 headers={ "User-Agent": "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36"}

 response = requests.post(url, data = formdata, headers = headers)

 print response.text

 # 如果是json文件可以直接显示
 print response.json()
```
### 代理（proxies参数）
* 如果需要使用代理，你可以通过为任意请求方法提供 proxies 参数来配置单个请求：
```
 import requests

 # 根据协议类型，选择不同的代理
 proxies = {
   "http": "http://12.34.56.79:9527",
   "https": "http://12.34.56.79:9527",
 }

 response = requests.get("http://www.baidu.com", proxies = proxies)
 print response.text
```
* 私密代理
```
 import requests

 # 如果代理需要使用HTTP Basic Auth，可以使用下面这种格式：
 proxy = { "http": "mr_mao_hacker:sffqry9r@61.158.163.130:16816" }

 response = requests.get("http://www.baidu.com", proxies = proxy)

 print response.text
```
### web客户端验证
* 基本身份认证 HTTP Basic Auth
   ```
    import requests

    auth=('test', '123456')

    response = requests.get('http://192.168.199.107', auth = auth)

    print response.text
   ```
### cookies 和 Sission
* 如果一个响应中包含了cookie，那么我们可以利用 cookies参数拿到：
  ```
   import requests

   response = requests.get("http://www.baidu.com/")

   # 7. 返回CookieJar对象:
   cookiejar = response.cookies

   # 8. 将CookieJar转为字典：
   cookiedict = requests.utils.dict_from_cookiejar(cookiejar)

   print cookiejar

   print cookiedict
  ```
  ```
   <RequestsCookieJar[<Cookie BDORZ=27315 for .baidu.com/>]>

   {'BDORZ': '27315'}
  ```
* session
  * 在同一个 Session 实例发出的所有请求之间保持 cookie
    ```
     import requests

     # 1. 创建Session对象，可以保存Cookie值
     ssion = requests.Session()

     # 2. 处理 headers
     headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36"}

     # 3. 需要登录的用户名和密码
     data = {"email":"mr_mao_hacker@163.com", "password":"alarmchime"}

     # 4. 发送附带用户名和密码的请求，并获取登录后的Cookie值，保存在ssion里
     ssion.post("http://www.renren.com/PLogin.do", data = data)

     # 5. ssion包含用户登录后的Cookie值，可以直接访问那些登录后才可以访问的页面
     response = ssion.get("http://www.renren.com/410043129/profile")

     # 6. 打印响应内容
     print response.text
    ```
	* 另外Sessions不能保持手动构建的cookie,原来requests只能保持 cookiejar 类型的cookie，而我们手动构建的cookie是dict类型的。所以要把dict转为 cookiejar类型
	  ```
	   # 两者转换
	   #将CookieJar转为字典：
       cookies = requests.utils.dict_from_cookiejar(r.cookies)

       #将字典转为CookieJar：
       cookies = requests.utils.cookiejar_from_dict(cookie_dict, cookiejar=None, overwrite=True)

       #其中cookie_dict是要转换字典

       转换完之后就可以把它赋给cookies 并传入到session中了：

       s = requests.Session()
       s.cookies = cookies

	  ```
# 处理HTTPS请求 SSL证书验证
  * 要想检查某个主机的SSL证书，你可以使用 verify 参数（默认为True）
  * 如果SSL证书验证不通过，或者不信任服务器的安全证书，则会报出SSLError，为了正常访问改为Flase
    ```
     r = requests.get("https://www.12306.cn/mormhweb/", verify = False)
    ```