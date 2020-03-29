# 其他知识点
### 管理静态文件
  * 类型于单独的css、js、图片这些被html文件所需要，而又不会有太大隐私的文件。静态文件用来修饰html等模板

  ##### 配置静态文件
  * 在settings 文件中定义静态内容
  ```html
   STATIC_URL = '/static/' # 逻辑的static路径
   STATICFILES_DIRS = [
      os.path.join(BASE_DIR, 'static'), # 物理上有一个static文件夹
  ]
  ```
  * 在项目下，与应用同级配置物理文件夹以及图片static/应用名/图片名：static/booktest/a.png
  
  ##### img标签下配置 
  * 方法一：硬编码
    ```html
     <img src="/static/booktest/a.png"/>
    ```
    * 解析为：127.0.0.1:8000/static/booktest/a.png
    * 这里的/static是逻辑路径 STATIC_URL 中值，如果在settings中改变，那么模板中图片路径也需要改
  
  * 方法二：在模板中可以使用static编码
    ```html
     { % load static from staticfiles %} #模板文件第一行引入
   
     <img src="{ % static "booktest/a.png" %}" alt="My image"/>
    
    ```
    * static 的值会随着settings中STATIC_URL 改变而改变
 
### 中间件
  * 是一个轻量级、底层的插件系统
  * 在不破坏原有逻辑的情况下，可以介入Django的请求和响应处理过程，修改Django的输入或输出
  * 是django的切面编程的思想，其他MVC框架中叫法略有不同，django中叫‘中间件’
  * 激活：添加到Django配置文件中的MIDDLEWARE_CLASSES元组中
  * 每个中间件组件是一个独立的Python类，可以定义django提供的固定的方法中的一个或多个
    * __init__() :无需任何参数，服务器响应第一个请求的时候调用一次，用于确定是否启用当前中间件
    * process_request(request)：执行路由前调用，返回None或HttpResponse对象
    * process_view(request, view_func, view_args, view_kwargs)：调用视图之前被调用，在每个请求上调用，返回None或HttpResponse对象
    * process_template_response(request, response)： 调用模板前调用，返回实现了render方法的响应对象
    * process_response(request, response)：所有响应返回浏览器之前被调用，在每个请求上调用，返回HttpResponse对象 
    * process_exception(request,response,exception)：视图发生异常时调用，返回一个HttpResponse对象
  *   
    ```html
    
     客户端--process_request()-->【URL】--process_view()-->【view】--process_template_response()-->【template html】
                                         |                                                           |                          
                                         |                                                           |
                                         |                                                           |                          
                                         |--process_exception()--------------------------->-- process_response() -->客户端

    ```
  * 一个例子：自定义异常处理
    1. 在应用下，与settings.py同级目录下创建myexception.py文件，定义类MyException，实现process_exception方法
        ```html
         from django.http import HttpResponse
         class MyException():
             def process_exception(request,response, exception):
                 return HttpResponse(exception.message)
        ```
    2. 将类MyException注册到settings.py中间件中
       ```html
         MIDDLEWARE_CLASSES = (
             'test1.myexception.MyException', # 应用名.模块名.类名
             ...
         )
       ```    
    3. 定义视图，并发生一个异常信息，则会运行自定义的异常处理
       ```html
        def myExp(request): 
            a1=int('abc') # 这个类型转换会报错，从而触发异常,从而页面上显示异常message
            return HttpResponse('abc')
       ```   
### 分页
* Django提供了一些类实现管理数据分页，这些类位于django/core/paginator.py中
##### paginator对象
* p=Paginator(列表,int)：返回分页对象，参数为列表数据，int为每页数据的条数 
  ```html
   list1 = AreaInfo.objects.all()
   p=Paginator(list1,10)  # 每10条数据为一页
  ```     
* 属性
  * count：对象总数
  * num_pages：页面总数
  * page_range：页码列表，从1开始，例如[1, 2, 3, 4]
* 方法   
  * page(num)：返回指定页的数据的对象。下标以1开始，如果提供的页码不存在，抛出InvalidPage异常
##### page对象
* Paginator对象的page()方法返回Page对象，不需要手动构造  
  ```html
   p=Paginator(list1,10) 
   currentPage=p.page(1) # 获取第一页数据，返回一个对象，再模板里面遍历获取值
    
  ```
* 属性
  * object_list：当前页上所有对象的列表
  * number：当前页的序号，从1开始
  * paginator：当前page对象相关的Paginator对象
    * 这样又能够调取Paginator对象里面page_range的属性，来显示所有分页条数
      ```html
       {% for index in page.paginator.page_range %}
       {% if index == page.number %} #注意==两边要空一格，否则会报错
         {{ index }}
       {% endif %}
         <a href="/herolist/{{index}}/">{{index}}</a> 
       {% endfor %}   
      ```
* 方法  
  * has_next()：如果有下一页返回True
  * has_previous()：如果有上一页返回True
  * has_other_pages()：如果有上一页或下一页返回True
  * next_page_number()：返回下一页的页码，如果下一页不存在，抛出InvalidPage异常
  * previous_page_number()：返回上一页的页码，如果上一页不存在，抛出InvalidPage异常
  * len()：返回当前页面对象的个数

   