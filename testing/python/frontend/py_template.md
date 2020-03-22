# 模板
* 模板文件夹需要自己新建，一般路径放在项目下，与应用同级，取名templates,其文件夹下再新建应用名的文件夹,便于管理，不同的应用模板放对应的文件夹下
* 模板中文件通常为html文件
* 还需要在settings.py文件中，设置TEMPLATES的DIRS值
  ```
  TEMPLATES=[
  {
    'DIRS': [os.path.join(BASE_DIR, 'templates')],# 指加入当前路径下的，templates文件夹
   }
   ]

  ```
### 调用模板
* 是在view.py视图文件中去调用
* **下面写法比较繁琐，一般使用后面的方式Render的简化**
```
 from django.http import HttpResponse
 from django.template import RequestContext, loader #需要loader来加载模板

def index(request):
    template = loader.get_template('booktest/index.html')# 加载模板。是上面templates文件夹下面的又多了booklist的应用名的文件夹
    return HttpResponse(template.render()) # 把模板渲染后作为响应返回给客户
```

* Django提供了函数Render()简化视图调用模板、构造上下文【常用，这样写方便】
```
 from django.shortcuts import render

 def index(reqeust):
    return render(reqeust, 'booktest/index.html')

```

### 在模板中加入数据
* render（request,template_name,context）,第三个参数即为数据
```
 from .models import * # 从models里面拿数据3
 def show(request,id):# 这里的id 是url正则表达式里面取出来
  book=BookInfo.objects.get(pk=id) #获取book信息
  herolist=book.heroinfo_set.all() #把该book中的heroinfo拿出来
  context={'list':herolist} # 放入字典里，键名为list
  return render(reqeust, 'booktest/show.html',context
```
* context是字典格式，context={'name':123},context会整体传入模板中
* 模板里面，需要的地方就用双花括号{{键名}}即可
```
 <p>{{name}}</p> # 根据键名，就可以往里面填入值，渲染结果就是123
```

### 从模型中填入数据
* <%%>中为模板语法，里面为类似python代码
```
<%for i in list%>
<%endfor%>
```
```html
 <ul>
   <%for i in list%>
     <li>{{i.hname}}</li>
   <%endfor%>
 </ul>
```
### 模板中超链接跳转
```html
 <ul>
   <%for book in list%>
    <li> <a href="{{book.id}}">{{book.title}}</a></li>
   <%endfor%>
 </ul>
```
* 这里获取到的id数据也是需要用双花括号
* 同时需要配置url

### 从url中正则匹配中取数据
* 取到数据作为参数传递给view
```
   url(r'^([0-9]+)/$', views.detail),
   或者也可以写成
   url(r'(\d+)',views.detail)
```
* 注意：这里正则中使用**小括号**括起来，就是代表取这个数据，作为**参数**传入view中,所以在view定义接收方法的时候需要再写一个形参
  ```html
   def detail(request,myid):
     book= BookInfo.objects.get(pk=id) #根据id找到book对象
     herolist=book.heroinfo_set.all() #表示该book所有heroinfo的集合,heroinfo为关联对象，heroinfo_set为返回集合，固定写法【1对多的关系】all()为查询对象里面的值
     context={'list':herolist}
     return render(request,'booktest/show.html',context)
  ```


### 自带的HTTP错误视图模板
* Django原生自带几个默认视图用于处理HTTP错误
* 只有关闭了debug模式，才有效果
* 类型：
  1. 404 (page not found) 视图
  2. 500 (server error) 视图
  3. 400 (bad request) 视图
* 使用：
  1. 项目下有templates文件夹，没有自行创建 
  2. 配置settings文件，把该文件夹纳入dir路径
     ```html
       'DIRS': [os.path.join(BASE_DIR,'templates')],
     ```
  3. 在templates文件夹下创建相关的错误视图模板
     * 404.html，内容根据实际而写【500.html同理】
  4. settings下配置，关闭debug模式，并配置能访问的主机名，全部都可以写*
     ```html
      # SECURITY WARNING: don't run with debug turned on in production!
      DEBUG = False
      
      ALLOWED_HOSTS = ['*']
     ```      
  5. 测试
     ```html
      http://127.0.0.1:8000/booktest/aaa # 没有定义aaa这个url，则会直接触发404的视图去调用404.html的模板
     ```   