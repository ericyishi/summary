# 视图
* 在django中，视图对WEB请求进行回应
* 视图必须**接收reqeust对象**作为第一个参数，包含了请求的信息
* 视图就是一个Python函数，被定义在应用booktest下的views.py中
* 视图view作用：接收请求、逻辑处理、调用数据、输出响应

    ```
       #coding:utf-8
      from django.http import HttpResponse
  
      def index(request): # request 是请求对象
          return HttpResponse("index") # HttpResponse为响应对象
      def detail(request,id):
          return HttpResponse("detail %s" % id)
    ```
    * 定义完成视图后，需要配置路由urlconf,通过url来跳转的

### URLconf
#### urlconf配置
* 在settings.py文件中通过ROOT_URLCONF指定根级url的配置
  ```html
   ROOT_URLCONF = 'test3.urls' # 可以看到其指向项目下为urls文件，所以我们只需要到对应文件下配置
  ```
* 通常我们不会再根url.py下面写各个应用的url，而是会在各应用里面单独创建url，而根目录指向即可
  1. 创建应用
        ```html
          python manage.py startapp booktest
        ```  
  2. 手动再应用目录下创建一个urls.py文件
  3. 在根目录的urls.py编写用于指向应用url的路由规则
     ```html
          urlpatterns = [
        url(r'^admin/', include(admin.site.urls)),
        url(r'^booktest/',include('booktest.urls')) # 新增，以后只要是/booktest的请求都会执行
        ]
     ```
  4. 配置booktest下urls.py文件
     ```html
      #-*- coding: utf-8 -*-
        from django.conf.urls import url
        import views
        urlpatterns=[
            url(r'^$',views.index)
        ]
     ```   
  5. 配置对应的views文件
     ```html
      from django.http import HttpResponse
      from django.shortcuts import render
      
      # Create your views here.
      def index(request):
          return HttpResponse('hello')
     ```  
  6. 启动服务访问验证
    
     ```html
       python manager.py runserver
       http://127.0.0.1:8000/booktest/  #就会页面上显示一个hello
     ```    
#### 正则获取值及传参
* 若要从url中捕获一个值，需要在它周围设置一对圆括号
  ```html
   url(r'^(\d+)/(\d+)/(\d+)$',views.num) # 正则\d+代表一个或多个数字
   # 注意url的斜杠与正则斜杠的方向
  ```
  * 上面是按照位置一一匹配，也可以按照指定形参名来匹配，?<形参名>值，如下
    ```html
     url(r'^(?P<n2>\d+)/(?P<n3>\d+)/(?P<n1>\d+)$',views.num)
    ```
  
  ```html
   http://127.0.0.1:8000/booktest/2020/03/22
  ```
  * 获取的值，也必须在对应的视图下设置3个参数用于接收
    ```html
     def num(request,n1,n2,n3): # 这里如果没有参数n1,n2,n3是会报错的
        return HttpResponse("y:%s,m:%s,d:%s"%(n1,n2,n3))
    ```
    
### HttpReqeust对象
* 服务器接收到http协议的请求后，会根据报文创建HttpRequest对象
* 视图函数的第一个参数是HttpRequest对象
* 在django.http模块中定义了HttpRequest对象的API

#### 属性
* 下面除非特别说明，属性都是只读的
* path：一个字符串，表示请求的页面的完整路径，不包含域名
* method：一个字符串，表示请求使用的HTTP方法，常用值包括：'GET'、'POST'
* encoding：一个字符串，表示提交的数据的编码方式
  * 如果为None则表示使用浏览器的默认设置，一般为utf-8
  * 这个属性是可写的，可以通过修改它来修改访问表单数据使用的编码，接下来对属性的任何访问将使用新的encoding值
* GET：一个类似于字典的对象，包含get请求方式的所有参数
* POST：一个类似于字典的对象，包含post请求方式的所有参数
* FILES：一个类似于字典的对象，包含所有的上传文件
* COOKIES：一个标准的Python字典，包含所有的cookie，键和值都为字符串
* session：一个既可读又可写的类似于字典的对象，表示当前的会话，只有当Django 启用会话的支持时才可用，详细内容见“状态保持”

#### 方法
* is_ajax()：如果请求是通过XMLHttpRequest发起的，则返回True   

#### QueryDict对象
* 定义在django.http.QueryDict
* request对象的属性GET、POST都是QueryDict类型的对象
* 与python字典不同，QueryDict类型的对象用来处理同一个键带有多个值的情况
* 方法GET()：根据键获取值
* 只能获取键的一个值
* 如果一个键同时拥有多个值，获取最后一个值
  ```html
    request.GET['键名']

  ```
* 方法get_list()：根据键获取值
* 将键的值以列表返回，可以获取一个键的多个值
  ```html
   request.GET.getlist('键名')  # 返回列表[u'1', u'3']
  ```
#### GET属性
* QueryDict类型的对象
* 包含get请求方式的所有参数
* 与url请求地址中的参数对应，位于?后面
* 参数的格式是键值对，如key1=value1
* 多个参数之间，使用&连接，如key1=value1&key2=value2
* 键是开发人员定下来的，值是可变的  
* 如，访问的url为
    ```html
      http://127.0.0.1:8000/booktest/testgetparams?a=1&b=2&c=3
    ```
* 定义路由如下：
    ```html
      url(r'^testgetparams$',views.getprams)
    ```
* 定义视图如下：
    ```html
     def getprams(request):
        a=request.GET['a']
        b=request.GET['b']
        c=request.GET['c']
        context={'a':a,'b':b,'c':c} #注意，传入模板前需要自己构建上下文内容
        return render(request,'manyparm.html',context)
    ```
* 定义模板如下：
  ```html
   <div>{{a}}</div>
   <div>{{b}}</div>
   <div>{{c}}</div>
  ```

### HttpResponse对象
* 在django.http模块中定义了HttpResponse对象的API
* HttpRequest对象由Django自动创建，HttpResponse对象由开发者创建
* 不调用模板，直接返回数据

#### 属性
* content：表示返回的内容，字符串类型
* charset：表示response采用的编码字符集，字符串类型
* status_code：响应的HTTP响应状态码
* content-type：指定输出的MIME类型
#### 方法
* init ：使用页内容实例化HttpResponse对象
* write(content)：以文件的方式写
* flush()：以文件的方式输出缓存区
* set_cookie(key, value='', max_age=None, expires=None)：设置Cookie
  * key、value都是字符串类型
  * max_age是一个整数，表示在指定秒数后过期
  * expires是一个datetime或timedelta对象，会话将在这个指定的日期/时间过期，注意datetime和timedelta值只有在使用PickleSerializer时才可序列化
  * max_age与expires二选一
  * 如果不指定过期时间，则两个星期后过期 
* delete_cookie(key)：删除指定的key的Cookie，如果key不存在则什么也不发生  
#### 子类HttpResponseRedirect重定向
* 重定向，服务器端自动跳转跳转
  * 模板
  ```html
   def redTest1(request):
    return HttpResponseRedirect('/booktest/redtest2')
   def redTest2(request):
    return HttpResponse('跳转后的页面')
  ```
  * urls
  ```html
    url(r'^redtest1$',views.redTest1),
    url(r'^redtest2$',views.redTest2)
  ```
  * 测试
  ```html
    http://127.0.0.1:8000/booktest/redtest1
  ```
   * 输入后就会将url地址变为http://127.0.0.1:8000/booktest/redtest2，页面显示内容为“跳转后的页面”
* 也可以直接简写为redirect
```html
from django.shortcuts import redirect
 def redTest1(request):
    return redirect('/booktest/redtest2')
``` 
#### 子类JsonResponse  
* 返回json数据，一般用于异步请求
