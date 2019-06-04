# 视图
* 在django中，视图对WEB请求进行回应
* 视图接收reqeust对象作为第一个参数，包含了请求的信息
* 视图就是一个Python函数，被定义在应用booktest下的views.py中
    ```
     #coding:utf-8
    from django.http import HttpResponse

    def index(request):
        return HttpResponse("index")
    def detail(request,id):
        return HttpResponse("detail %s" % id)
    ```
    * 定义完成视图后，需要配置urlconf，否则无法处理请求
# URLconf
* 在新建的项目中，url.py文件配置（项目下的url.py是主url）
* Django中，定义URLconf包括正则表达式、视图两部分
* Django使用正则表达式匹配请求的URL，一旦匹配成功，则调用应用的视图
  * 注意：只匹配路径部分，即除去域名、参数后的字符串
* 在test1/urls.py插入booktest（这里是应用名），使主urlconf连接到booktest.urls模块
   ```
     url(r'^', include('booktest.urls')), #booktest.urls是应用下booktest新建的的urls.py
   ```

* 在booktest中的urls.py中添加urlconf
  ```
    from django.conf.urls import url
    from . import views
    urlpatterns = [
        url(r'^$', views.index),
        url(r'^([0-9]+)/$', views.detail),
    ]
  ```