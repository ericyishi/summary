# 视图
* 在django中，视图对WEB请求进行回应
* 视图**接收reqeust对象**作为第一个参数，包含了请求的信息
* 视图就是一个Python函数，被定义在应用booktest下的views.py中
    ```
     #coding:utf-8
    from django.http import HttpResponse

    def index(request):
        return HttpResponse("index")
    def detail(request,id):
        return HttpResponse("detail %s" % id)
    ```
    * 定义完成视图后，需要配置urlconf，,通过url来跳转的

