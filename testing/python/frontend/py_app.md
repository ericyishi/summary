# 创建应用
* 创建项目后我们需要创建应用
* 一个项目可以创建多个应用
* 创建应用的位置，需要到manage.py文件下运行
  ```html
    python manage.py startapp 应用名
    python manage.py startapp booktest
  ```
  * 创建后就会在项目多了一个应用名的文件夹【与项目文件夹以及manage.py文件同级】，下面包含这样的结构
    ```
     _____
      |
      ------booktest【应用名】
         |
         -------migrations【一个文件夹】
         |
         -------__init__.py
         |
         -------admin.py
         |
         -------models.py
         |
         -------tests.py
         |
         -------views.py
    ```
    
### 创建模型的步骤
1. 定义模型类
2. 注册应用
3. 生成迁移文件，并执行生成表
 
### 定义模型类
* 在应用下面有个models.py文件，这里可以编写我们自己的模型的代码
* 这个文件，默认已经引入了models模块：from django.db import models
* 有一个数据表，就有一个模型类与之对应  
* 模型类继承自models.Model类
  ```html
    class BookInfo(models.Model):
       pass 
  ```
  * **注意**:这里必须要继承django的models.Model，因为要使用django的model，不这样写就是个普通类，没法与数据库建立映射关联。
* 模型里的字段类型，需要使用django的，参考下面的字段类型    
  ```html
   from django.db import models

    # Create your models here.
    class BookInfo(models.Model):
        btitle=models.CharField(max_length=20)
        bpub_date=models.DateTimeField()
        def __str__(self):
             return self.btitle
        
    class HeroInfo(models.Model):
        hname=models.CharField(max_length=10)
        hgender=models.BooleanField()
        hcontent=models.CharField(max_length=1000)
        hbook=models.ForeignKey(BookInfo) # 通过外键建立与BookInfo对象的关系
  ```
  * 模型类创建好后，django会自动帮助我们创建表结构。与数据库里面的语句也是有映射关系的，我们无需自己写主键id
  * 所以django中无需写一条sql语句，直接按照其model结构，即可建立关系了。
  * 当输出对象时，会调用对象的str方法
### 注册应用
* 需要到项目文件夹下的settings.py文件，将应用名booktest加入到installed_apps中
  ```html
   INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'booktest'
   )
  ``` 
  
### 迁移数据
* 定义好模型类后，生成迁移文件，再执行迁移文件，在数据库中创建表
* 步骤：
  1. 生成迁移文件
     ```html
      python manage.py makemigrations
     ```
     * 运行成功后，会有如下语句，并在migrations下面多了0001_initial.py文件
        ```html
        Migrations for 'booktest':
           0001_initial.py:
            - Create model BookInfo
            - Create model HeroInfo
        ```
  2. 执行迁移，生成表【即到对应的数据库里面执行sql语句】
     ```html
      python manage.py migrate
     ```
     * 运行成功后，会有如下语句：
       ```html
        Operations to perform:
          Synchronize unmigrated apps: messages, staticfiles
          Apply all migrations: booktest, admin, auth, sessions, contenttypes
        Synchronizing apps without migrations:
          Creating tables...
            Running deferred SQL...
          Installing custom SQL...
        Running migrations:
          Rendering model states... DONE
          Applying contenttypes.0001_initial... OK
          Applying auth.0001_initial... OK
          Applying admin.0001_initial... OK
          Applying contenttypes.0002_remove_content_type_name... OK
          Applying auth.0002_alter_permission_name_max_length... OK
          Applying auth.0003_alter_user_email_max_length... OK
          Applying auth.0004_alter_user_username_opts... OK
          Applying auth.0005_alter_user_last_login_null... OK
          Applying auth.0006_require_contenttypes_0002... OK
          Applying booktest.0001_initial... OK
          Applying sessions.0001_initial... OK
       ```
  
### 字段类型
```
 class DemoA(models.Model):
   title=models.CharField(max_length=20)
   ...
```
* AutoField：一个根据实际ID自动增长的IntegerField，通常不指定
  * 如果不指定，一个主键字段将自动添加到模型中
* BooleanField：true/false 字段，此字段的默认表单控制是CheckboxInput
* NullBooleanField：支持null、true、false三种值
* CharField(max_length=字符长度)：字符串，默认的表单样式是 TextInput
* TextField：大文本字段，一般超过4000使用，默认的表单控件是Textarea
* IntegerField：整数
* DecimalField(max_digits=None, decimal_places=None)：使用python的Decimal实例表示的十进制浮点数
    * DecimalField.max_digits：位数总数
    * DecimalField.decimal_places：小数点后的数字位数
* FloatField：用Python的float实例来表示的浮点数
* DateField[auto_now=False, auto_now_add=False])：使用Python的datetime.date实例表示的日期
    * 参数DateField.auto_now：每次保存对象时，自动设置该字段为当前时间，用于"最后一次修改"的时间戳，它总是使用当前日期，默认为false
    * 参数DateField.auto_now_add：当对象第一次被创建时自动设置当前时间，用于创建的时间戳，它总是使用当前日期，默认为false
    * 该字段默认对应的表单控件是一个TextInput. 在管理员站点添加了一个JavaScript写的日历控件，和一个“Today"的快捷按钮，包含了一个额外的invalid_date错误消息键
    * auto_now_add, auto_now, and default 这些设置是相互排斥的，他们之间的任何组合将会发生错误的结果
* TimeField：使用Python的datetime.time实例表示的时间，参数同DateField
* DateTimeField：使用Python的datetime.datetime实例表示的日期和时间，参数同DateField
* FileField：一个上传文件的字段
* ImageField：继承了FileField的所有属性和方法，但对上传的对象进行校验，确保它是个有效的image    

### 检验
1. 进入Python shell去验证我们是否创建成功
   * 注意：还是需要使用下面命令进入,而不是我们平时控制台输入python进入
   ```html
     python manage.py shell
   ```
2. 引入包
   ```html
    from booktest.models import *
    from datetime import datetime
 
   ```  
3. 查询命令
* 新建图书信息
   ```html
    In [2]: b=BookInfo()

    In [3]: b.btitle='abc'

    In [4]: from datetime import datetime

    In [5]: b.bpub_date=datetime(year=1990,month=1,day=10)

    In [6]: b.save()
   ```    
4. 查询所有的图书信息
   ```html
    BookInfo.objects.all()
   ``` 
   * 返回是一个对象，如果我们要返回值，需要对模型文件再添加一个方法
     ```html
        def __str__(self):
             return self.btitle
     ```  
     * 注意这里添加方法后，无需迁移，因为迁移的是数据结构，这里的方法只是对数据进行操作，只需重新进入python shell就能够生效
       ```html
         from booktest.models import *
         BookInfo.objects.all()  # 返回值：[<BookInfo: abc>]
       ```
* 查询指定的图书信息
  ```html
   b=BookInfo.objects.get(pk=1) # <BookInfo: abc>
   b=BookInfo.objects.get(btitle='abc') # <BookInfo: abc>
  ``` 
  * pk是primary key主键的缩写
* 输出对象以及值
  ```html
   b
   b.btitle
   b.bpub_date
  ```    
* 修改值
  ```html
   b.btitle='zhangsan'
   b.save()
 
  ```  
  * b.save()才会把修改后的值同步到数据库里面去，否则关闭shell重新打开又是原来的值
  
* 删除实例对象
  ```html
   b.delete()
  ```
* 创建实例对象
  ```html
   b2=BookInfo()
  ```  
  