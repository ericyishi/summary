# 模板
* 模板文件夹需要自己新建，一般路径放在项目下，取名templates,其文件夹下再新建应用名的文件夹
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
```
 from django.http import HttpResponse
 from django.template import RequestContext, loader

def index(request):
    template = loader.get_template('booktest/index.html')# 是上面templates文件夹下面的又多了booklist的应用名的文件夹
    return HttpResponse(template.render())
```
* **上面写法比较繁琐，一般使用下面的方式Render的简化**
  * Django提供了函数Render()简化视图调用模板、构造上下文
```
 from django.shortcuts import render

def index(reqeust):
    return render(reqeust, 'booktest/index.html')

```
### 在模板中加入数据
* render（request,template_name,context）,第三个参数即为数据
* context是字典格式，context={'name':123}
* 模板里面，需要的地方就用双花括号{{键名}}即可
```
 <p>{{name}}</p> # 根据键名，就可以往里面填入值，渲染结果就是123
```

### 从模型中取数据

