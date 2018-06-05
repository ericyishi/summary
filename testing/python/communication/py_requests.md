# Requests包
### 概述
* requests是python实现的简单易用的HTTP库，基于python 内置库urllib
* 第三方库，安装：pip install -i https://pypi.douban.com/simple requests
### 用法
1. 请求方式
   ```
    response=requests.get('http://httpbin.org/get')
    response=requests.post('http://httpbin.org/post')
    response=requests.put('http://httpbin.org/put')
    等等
   ```

 * 带参数的请求
   ```
    import requests

    response = requests.get(http://httpbin.org/get?name=gemey&age=22)
    print(response.text)
   ```
 * 另一种请求参数
   * 另一种先将参数填写在dict中，发起请求时params参数指定为dict
   ```
    import requests

    data = {
        'name': 'tom',
        'age': 20
    }

    response = requests.get('http://httpbin.org/get', params=data)
    print(response.text)
   ```
   ```
    import requests
    data = {'name':'tom','age':'22'}
    response = requests.post('http://httpbin.org/post', data=data)
   ```
 * 传递json格式
   * 可以用 json.dumps() 方法把表单数据序列化。
   ```
     import requests

    data = {
        'name': 'tom',
        'age': 20
    }

    response = requests.get('http://httpbin.org/get', params=json.dumps(data))
    print(response.text)
   ```
 * 上传文件
    * 使用file参数
   ```
    import requests
    url='http://img.ivsky.com/upload'
    files={'files':open('123.txt','rb')}
    r=requests.post(url,files=files)

   ```
 * 请求添加头信息
   ```
     import requests
    heads = {}
    heads['User-Agent'] = 'Mozilla/5.0 ' \
                              '(Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 ' \
                              '(KHTML, like Gecko) Version/5.1 Safari/534.50'
     response = requests.get('http://www.baidu.com',headers=heads)
   ```
 * 使用代理【使用代理去爬取IP代理网站的IP与端口和类型】
   ```
    import requests
    import re

    def get_html(url):
        proxy = {
            'http': '120.25.253.234:812',
            'https' '163.125.222.244:8123'
        }
        heads = {}
        heads['User-Agent'] = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.221 Safari/537.36 SE 2.X MetaSr 1.0'
        req = requests.get(url, headers=heads,proxies=proxy)
        html = req.text
        return html

    def get_ipport(html):
        regex = r'<td data-title="IP">(.+)</td>'
        iplist = re.findall(regex, html)
        regex2 = '<td data-title="PORT">(.+)</td>'
        portlist = re.findall(regex2, html)
        regex3 = r'<td data-title="类型">(.+)</td>'
        typelist = re.findall(regex3, html)
        sumray = []
        for i in iplist: #ip地址
            for p in portlist: #port
                for t in typelist: # 协议类型
                    pass
                pass
            a = t+','+i + ':' + p
            sumray.append(a)
        print('高匿代理')
        print(sumray)


    if __name__ == '__main__':
        url = 'http://www.kuaidaili.com/free/'
        get_ipport(get_html(url))
   ```
2. 响应
 * 响应的常用参数
    ```
    import requests
    response = requests.get('http://www.baidu.com')
    print(response.status_code)  # 打印状态码
    print(response.url)          # 打印请求url
    print(response.headers)      # 打印头信息
    print(response.cookies)      # 打印cookie信息
    print(response.text)  #以文本形式打印网页源码
    print(response.content) #以字节流形式打印
    ```
    * 使用正确的编码，让响应文本正确显示
       ```
        response.encoding="utf-8"
        print(response.text)
       ```
 * 解析json
   * response.json()
   ```
   import requests

   response = requests.get('http://httpbin.org/get')
   print(response.text)
   print(response.json())  #response.json()方法同json.loads(response.text)
   print(type(response.json()))
   ```
 * 简单保存一个二进制文件
   ```
    import requests

    response = requests.get('http://img.ivsky.com/img/tupian/pre/201708/30/kekeersitao-002.jpg')
    b = response.content
    with open('F://fengjing.jpg','wb') as f:
        f.write(b)
   ```

3. 获取cookie
```
import requests

response = requests.get('http://www.baidu.com')
print(response.cookies)
print(type(response.cookies))
# 获取每一个cookie
for k,v in response.cookies.items():
    print(k+':'+v)
# 获取指定的cookie的值
print(response.cookies['PHPSESSION'])
```


4. 会话维持【用它来管理cookie，因为对于http请求是无状态，是有session让其有状态】
```
import requests

session = requests.Session()
session.get('http://httpbin.org/cookies/set/number/12345')
response = session.get('http://httpbin.org/cookies')
print(response.text)
```

5. 证书验证设置【用于https网站的访问必须使用】
   * Requests可以为HTTPS请求验证SSL证书，就像web浏览器一样。要想检查某个主机的SSL证书，你可以使用 verify 参数。
   * 如果你将 verify 设置为 False，Requests 能忽略对 SSL 证书的验证：
     * verify=False
```
import requests
from requests.packages import urllib3

urllib3.disable_warnings()  #从urllib3中消除警告
response = requests.get('https://www.12306.cn',verify=False)  #证书验证设为FALSE
print(response.status_code)

打印结果：200
```
6. 超时异常捕获
```
import requests
from requests.exceptions import ReadTimeout,HTTPError,RequestException

try:
    response = requests.get('http://www.baidu.com',timeout=0.5)
    print(response.status_code)
except ReadTimeout:
    print('timeout')
except HTTPError:
    print('httperror')
except RequestException:
    print('reqerror')
```
7. 重定向
   * 默认情况下，除了 HEAD, Requests会自动处理所有重定向。
   * 如果你使用的是GET, OPTIONS, POST, PUT, PATCH 或者 DELETE,，那么可以通过allow_redirects 参数禁用重定向处理
     ```
      r=requests.get("http://github.com",allow_redirects=False)
     ```
   * 如果使用的是HEAD，你也可以启用重定向
     ```
      r=requests.head("http://github.com",allow_redirects=False)
     ```
8. 历史请求
   * response.history()
### demo
1. 使用会话维持，模拟登录bugfree
```
import requests

data1 = {'LoginForm[username]': 'admin',
         'LoginForm[password]': 'admin',
         'LoginForm[language]': 'zh_cn',
         'LoginForm[rememberMe]': 0}

s = requests.session()
r = s.post("http://localhost/bugfree/index.php/site/login", data1)
```
2. 发帖至product_id=1的项目
```
import requests
data3 = {'BugInfoView[product_id]': '1',
         'isPageDirty':'1',
         'BugInfoView[title]': 'wanger2',
         'layer1_module': '0',
         'BugInfoView[productmodule_id]':  '0',
         'BugInfoView[assign_to_name]': 'zhangsan',
         'BugInfoView[mail_to]':'zhangsan,',
         'BugInfoView[severity]':None, '4',
         'Custom[BugType]': 'Bad Case',
         'Custom[HowFound]': 'Bug Bash',
         'Custom[OpenedBuild]': '1'
         }

r2 = s.post("http://localhost/bugfree/index.php/info/edit?type=bug&action=opened&product_id=1",data3)
```