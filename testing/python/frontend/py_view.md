# 视图
* 在django中，视图对WEB请求进行回应
* 视图**接收reqeust对象**作为第一个参数，包含了请求的信息
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

