# 站点管理
* 站点分为“内容发布”和“公共访问”两部分
* “内容发布”的部分负责添加、修改、删除内容，无需重复造轮子，Django会根据定义的模型类完全自动地生成管理模块

### 创建管理员
* 创建一个管理员用户
  ```html
   python manage.py createsuperuser #按提示输入用户名、邮箱、密码
  ```
  ```html
   abc/abc@123.com/abc
  ```
* 启动服务器，通过“127.0.0.1:8000/admin”访问，输入上面创建的用户名、密码完成登录
* 进入管理站点，默认可以对groups、users进行管理

### 登录管理界面
1. 运行启动环境
  ```html
   python manage.py runserver 
  ```
2. 进入管理员页面，输入刚才创建的用户名、密码即可登录进入管理界面
  ```html
   http://127.0.0.1:8000/admin/
  ```
   * 进入管理站点，默认可以对groups、users进行管理  
   
### 管理本地化
* 项目的settings.py文件下修改
* 修改后重启一下服务，就能生效
  ```html
   LANGUAGE_CODE = 'zh-Hans' # 改为中文

   TIME_ZONE = 'Asia/Shanghai' # 时区改为中国上海
  ``` 
### 后台管理数据模型
* 这样登进去后台是没有我们创建的数据模型，还需要注册绑定一次
* 打开应用(booktest)/admin.py文件，注册模型
  ```html
   from django.contrib import admin
   from .models import *
   admin.site.register(BookInfo)
   admin.site.register(HeroInfo)
 
  ```    

### 定制后台界面
* Django提供了admin.ModelAdmin类
* 直接在admin.py文件中，通过定义ModelAdmin的子类，来定义模型在Admin界面的显示方式
  ```html
   class DecorationAdmin(admin.ModelAdmin):
    ...
  
   admin.site.register(注册类, DecorationAdmin) # 前者为模型类，后者为一个效果装饰类
  ```
#### 提供的可修改页面属性
##### 列表页属性
* list_display：显示字段，可以点击列头进行排序
  * list_display = ['pk', 'btitle', 'bpub_date']
    ```html
      class BookInfoAdmin(admin.ModelAdmin):
         list_display=['id','btitle','bpub_date'] # 在后台页面上就会显示id、btitle, bpub_date三个字段
     
      admin.site.register(BookInfo,BookInfoAdmin)
    ```
* list_filter：过滤字段，过滤框会出现在右侧，常用于分类
  * list_filter = ['btitle']
* search_fields：根据字段搜索，搜索框会出现在上侧
  * search_fields = ['btitle']
* list_per_page：分页，分页框会出现在下侧
  * list_per_page = 10
##### 添加、修改页属性
* fields：属性的先后顺序
  * fields = ['bpub_date', 'btitle']
* fieldsets：属性分类显示，下面会把btitle与bpub_date分别作为一个大块显示
  * fieldsets = [
    ('basic',{'fields': ['btitle']}),
    ('more', {'fields': ['bpub_date']}),
    ]  

#### 关联对象
* 我们知道Book与Hero的关系是1对多，除了上面配置，我们可以在Hero这边添加对应的Book信息以外，还可以配置在Book这边添加多个Hero信息
* 在admin.py中进行配置，步骤如下
  1. 新增关联对象的信息
     ```html
      class MoreHero(admin.StackedInline):   # 指定在内部添加的显示方式StackedInline
      model = HeroInfo  # 指定关联对象
      extra = 2  # 指定数量
     ```
     * 除了上面内嵌显示admin.StackedInline的方式，还有一种表格展示admin.TabularInline
  2. 在主类的装饰类上建立联系
     ```html
      class BookInfoAdmin(admin.ModelAdmin):  
        inlines = [MoreHero]
     ```
  3. 注册主类和其装饰类
     ```
      admin.site.register(BookInfo,BookInfoAdmin)
     ```   