# 路由
### 作用
* 根据浏览器上请求url，来匹配自己在应用中的正则表达式，从而跳转到对应的视图来处理
### 概述
* django的路由系统作用就是使views里面处理数据的函数与请求的url建立映射关系。
* django的配置都在setting.py下，我们可以看到
  ```html
   ROOT_URLCONF = 'test2.urls'
  ```
  * 将这个配置指向了，项目test2下面urls.py文件下
* 使请求到来之后，根据urls.py里的关系条目，去查找到与请求对应的（views中）处理方法，从而返回给客户端http页面数据
  ```html
   urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
   ]
  ```
  * 默认配置/admin的后台管理的url,所以我们可以直接打开登录进admin的页面
  * 注意：匹配也是从‘ip:端口/’之后才开始作为匹配的内容
### urls
* django 项目中的url规则定义放在project 的urls.py目录下
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

### 使用 include() 配置 URL
* 如果项目非常庞大，应用非常多，应用的 URL 都写在根 urls.py 配置文件中的话，会显的非常杂乱，还会出现名称冲突之类的问题，这样对开发整个项目是非常不利的。
* 可以这样解决，把每个应用的 URL 写在它们各自的 urls.py 配置文件里，然后在项目下的 urls.py 里用 include() 函数引用
* demo
   1. 在应用 violet 里创建 urls.py 配置文件：
  ```

   from django.conf.urls import url
    from . import views

    urlpatterns = [
    url(r'^$', views.index), #这里 r'^$' 里面得加上 ^$ 。如果里面还要配置 URL 结尾记的加上反斜杠，如 r'^index/$'
    ]
  ```
   2. 项目的根 urls.py 配置文件改为：
  ```
    from django.conf.urls import url, include #在这里引入 include 函数
    from django.contrib import admin

    # 根 urls.py 针对应用配置的 URL 名称，是该应用所有 URL 的总路径，也可以说是应用的根路径
    urlpatterns = [
        url(r'^admin/', admin.site.urls), #这里也要注意正则表达式符号和结尾的反斜杠 /
        url(r'^violet/', include('violet.urls')), #这里引入应用 violet 下的 urls.py 配置文件
    ]
  ```