# HTTP.Client包
### 概述
1. 这个包位于偏底层，常用的requests包也是基于它
2. 需要引入http.client包
### get请求
```
import http.client
 con = http.client.HTTPConnection("localhost")
 con.request("GET", "/bugfree/index.php/bug/list/1", headers={
     'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
      'Referer': 'http://localhost/bugfree/index.php/site/login',
      'charset': 'UTF-8',
      'Connection': 'keep-alive',
     })
 resp = con.getresponse()
 print(resp.status)
```
1. 建立连接 con=http.client.HTTPConnection("主机名")
2. 发送请求 con.request("方式"，"资源路径"，参数)
   * 参数这里可以是header、以及POST请求才有的请求体body
3. 获取响应 resp = con.getresponse()

### POST请求
1. 模拟bugfree登录，并获取cookie
   1. POST请求的header中'Content-Type'值为'application/x-www-form-urlencoded'
   2. 通过拿到header里面"Set-Cookie"字段获取所有的cookie里面的值
   3. 在按照格式重新整理下

```
import http.client

con = http.client.HTTPConnection("localhost")
body = 'LoginForm%5Busername%5D=admin&LoginForm%5Bpassword%5D=admin&LoginForm%5Blanguage%5D=zh_cn&LoginForm%5BrememberMe%5D=0'
con.request("POST", "/bugfree/index.php/site/login", headers={'Content-Type': 'application/x-www-form-urlencoded',
                                                              'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
                                                              }, body=body)
resp = con.getresponse()
cookie = resp.getheader("Set-Cookie")
# print(cookie)
lis = cookie.split(",")
# print(lis)
mycookie = ""
for i in range(1, len(lis)):
    result = lis[i].split(";")[0]
    if (result.find("=") != -1):
        # print(result)
        mycookie += lis[i].split(";")[0] + ";"
print(mycookie)
```

2. 模拟提交bug
   1. 因为这里是表单提交，通过fiddler抓包我们可以看到content-type是：multipart/form-data
   2. POST请求是通过请求体body来传数据的
   3. 对于getresponse拿到的响应体是乱码，我们需要在body的时候encode()一下
```
body = """------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[deleted_file_id]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[lock_version]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[product_id]"

2
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="isPageDirty"

1
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="templateTitle"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[title]"

李四
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="layer1_module"

0
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[productmodule_id]"

0
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[assign_to_name]"

zhangsan
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[mail_to]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[severity]"

1
------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[priority]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[related_bug]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[related_case]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[related_result]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="attachment_file[]"; filename=""
Content-Type: application/octet-stream


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[action_note]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW
Content-Disposition: form-data; name="BugInfoView[repeat_step]"


------WebKitFormBoundaryBG6jjTMRCSZP9NIW--



""".encode()
con = http.client.HTTPConnection('localhost')
con.request("POST", "/bugfree/index.php/info/edit?type=bug&action=opened&product_id=2",
            headers={'Content-Type': 'multipart/form-data; boundary=----WebKitFormBoundaryBG6jjTMRCSZP9NIW',
                     'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36',
                     'cookie': mycookie
                     }, body=body)
resp = con.getresponse()
print(resp.status)
```


