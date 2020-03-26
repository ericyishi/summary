# 模板
### 创建模板
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
* 除了DIRS定义了一个目录列表，模板引擎按列表顺序搜索这些目录以查找模板源文件
* 还有一种APP_DIRS属性，告诉模板引擎是否应该在每个已安装的应用中查找模板【方便项目的迁移】
  ```html
   'DIRS': [os.path.join(BASE_DIR, 'app1/templates')],    ## templates
   'APP_DIRS': True,
  ```
  * 'DIRS': [os.path.join(BASE_DIR, 'app1/templates')] 是指向 BASE_DIR/app1/templates文件夹中去取模板
* 两者区别：
  1. 指定公用的templates路径，所有apps都可以调用，方便快捷。
  2. app专用的templates不需要指定，这样当要复用这个app的时候，不需要考虑templates路径问题   

### 调用模板
* 是在view.py视图文件中去调用
* **下面写法比较繁琐，一般使用后面的方式Render的简化**
```
 from django.http import HttpResponse
 from django.template import RequestContext, loader #需要loader来加载模板

def index(request):
    template = loader.get_template('booktest/index.html')# 加载模板。是上面templates文件夹下面的又多了booklist的应用名的文件夹
    context = RequestContext(request,{})
    return HttpResponse(template.render(context)) # 把模板渲染后作为响应返回给客户
```

* Django提供了函数Render()简化视图调用模板、构造上下文【常用，这样写方便】
```
 from django.shortcuts import render

 def index(reqeust):
    context={}
    return render(reqeust, 'booktest/index.html',context)

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
* <%%>中为模板语法，里面为类似python代码，Django模板语言，简称DTL
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

### 定义模板
* 模板语言的结构：
  1. 变量：{{变量名}} 
     * 注意：只有变量是双花括号
  2. 标签：{%代码块%}
  3. 过滤器：|
  4. 注释：{# 需要注释的内容 #}
  
##### 变量
* 当模版引擎遇到一个变量，将计算这个变量，然后将结果输出
* 变量名必须由字母、数字、下划线（不能以下划线开头）和点组成
* 当模版引擎遇到点(".")，会按照下列顺序查询处理：
  1. 字典查询，例如：foo["bar"]
  2. 属性或方法查询，例如：foo.bar
  3. 数字索引查询，例如：foo[bar]
  4. 如果变量不存在， 模版系统将插入'' (空字符串)      
* 在模板中调用方法时不能传递参数
  ```html
   class HeroInfo(models.Model):
    ...
    def showName(self):
        return self.hname
  ```
  ```html
   {{hero.showname}} # showname是一个方法，后面不用跟上执行的小括号
  ```
##### 过滤器
* 用在变量后边主要是为了计算
* 语法
  ```html
   { { 变量|过滤器 }}
  ```  

* 使用管道符号 (|)来应用过滤器
* 通过使用过滤器来改变变量的计算结果
* 可以在if标签中使用过滤器结合运算符 
  ```html
  {%for hero in list%}
   {%if forloop.counter|divisibleby:"2"%} #求余
     <div style="color:red">{{hero.showname}}</div>
   {%else%}
     <div style="color:blue">{{hero.showname}}</div>
   {endif}
  {%empty%}
     <div>啥也没有找到</div>
  {%endfor%}
  ```
* 系统提供的过滤器：[点击查看](https://www.cnblogs.com/huangxm/p/6286144.html) 
  
##### 标签
* 语法：{ % tag % }
* 作用
  * 在输出中创建文本
  * 控制循环或逻辑
  * 加载外部信息到模板中供以后的变量使用    

1. for循环标签
   ```html
    {%for ... in ...%}
    循环逻辑
    {{forloop.counter}}表示当前是第几次循环
    {%empty%}
    给出的列表为或列表不存在时，执行此处
    {%endfor%}
   ``` 
2. if标签   
   ```html
    { %if ...%}
    逻辑1
    { %elif ...%}
    逻辑2
    { %else%}
    逻辑3
    { %endif%}
   ```     
3. include：加载模板并以标签内的参数渲染
   ```html
    { %include "foo/bar.html" % }
   ```

4. url：反向解析
   * 链接的url是有配置url动态生成，好处在于以后变成路由的url匹配规则，不会改变模里面的url
   ```html
    { % url 'namespace:name' '参数1' '参数2' %}
    <a href="{%url 'booktest:show' %}">点击</a>
   ```
   * 根目录的urls，include下面的第二个参数叫namespace
     ```html
      url(r'^booktest/',include('booktest.urls',namespace='booktest'))
 
     ```
   * 应用下的url,第三个参数name，通常name的值与前面views后面相同  
     ```html
      url(r'^abc/$',views.show,name='show')
     ```
   * 如果url带上参数，那么反向解析的url也需要保持一致
     ```html
      url(r'^(\d+)/(\d+)$',views.show,name='show')
     ```  
     ```  
      { % url 'namespace:name' '123' '456' %} 
     ```  
5. csrf_token：这个标签用于跨站请求伪造保护
   ```html
    { % csrf_token %}
   ```
6. 布尔标签：and、or，and比or的优先级高
7. block、extends：详见“模板继承”
8. autoescape：详见“HTML转义”    
##### 注释
1. 单行注释
   ```html
    {# 注释内容 #}
   ```
2. 多行注释
   ```html
    {% comment %}
      this is a comment 
    {% endcomment %}  
   ```
 
### 模板继承
* block标签：在父模板中预留区域，在子模板中填充
  ```html
   base.html文件
 
   {%block 预留块的名称%}
     这里可以定义默认值
     如果不定义默认值，则表示空字符串
   {%endblock 预留块的名称}
  ```
  * 为了更好的可读性，可以给endblock标签一个名字，但不是必须的  
* extends继承：继承，写在模板文件的第一行
  ```html
   sub.html文件
  
   {%extends "base.html"%} #写在第一行，注意引用父文件时候要考虑路径问题
   {%block 预留块的名称%}
    替换父模板中的内容
   {%endblock 预留块的名称}
 
  ```
* 注意：
  * 如果在模版中使用extends标签，它必须是模版中的第一个标签
  * 不能在一个模版中定义多个相同名字的block标签
  * 子模版不必定义全部父模版中的blocks，如果子模版没有定义block，则使用了父模版中的默认值
  * 使用可以获取父模板中block的内容

### html转义
* 默认html的标签尖括号会被转义，因为默认使用escape过滤器
  * 视图中希望传一个html语言内容给模板
  ```html
   def index(request):
    return render(request, 'temtest/index2.html',
                  {
                      't1': '<h1>hello</h1>'
                  })
  ```
  * 默认情况下会被转义，因为处于安全考虑
    
    ```html
     {{t1}} # 得不到我们想要的结果 
     {{t1|escape}} # 默认的效果
    ```
  * 会被转义的符号
    ```html
     < 会转换为&lt;
     > 会转换为&gt;
     ' (单引号) 会转换为&#39;
     " (双引号)会转换为 &quot;
     & 会转换为 &amp;
    ``` 

  * 对于变量，使用关闭转义的过滤器safe
    ```html
     {{t1|safe}} 
    ```
  * 对于代码块
    ```html
      { % autoescape off %}
       {{ body }}
     { % endautoescape %}
    ```
    * 标签autoescape接受on或者off参数
    * 自动转义标签在base模板中关闭，在child模板中也是关闭的  