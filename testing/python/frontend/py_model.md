# 模型

### 开发步骤
1. 创建虚拟环境
2. 安装django
3. 创建项目
4. 创建应用
5. 在models.py中定义模型类
   1. 在models.py中定义模型类，要求继承自models.Model
   2. 把应用加入settings.py文件的installed_app项
   3. 生成迁移文件
   4. 执行迁移生成表
   5. 使用模型类进行crud操作
6. 定义视图
7. 配置url
8. 创建模板

### 定义模型
* 在模型中定义属性，会生成表中的字段
* django根据属性的类型确定以下信息：
    * 当前选择的数据库支持字段的类型
    * 渲染管理表单时使用的默认html控件
    * 在管理站点最低限度的验证
* django会为表增加自动增长的主键列，每个模型只能有一个主键列，如果使用选项设置某属性为主键列后，则django不会再生成默认的主键列
* 属性命名限制
    * 不能是python的保留关键字
    * 由于django的查询方式，不允许使用连续的下划线

### 定义属性
* 定义属性时，需要字段类型
* 字段类型被定义在django.db.models.fields目录下，为了方便使用，被导入到django.db.models中
* 使用方式
    * 导入from django.db import models
    * 通过models.Field创建字段类型的对象，赋值给属性
* **对于重要数据都做逻辑删除，不做物理删除，实现方法是定义isDelete属性，类型为BooleanField，默认值为False**

### 字段类型
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

### 字段选项
* 通过字段选项，可以实现对字段的约束
* 在字段对象时通过关键字参数指定
* null：如果为True，Django 将空值以NULL 存储到数据库中，默认值是 False
* blank：如果为True，则该字段允许为空白，默认值是 False
  * 对比：null是数据库范畴的概念，blank是表单验证证范畴的
* db_column：字段的名称，如果未指定，则使用属性的名称
* db_index：若值为 True, 则在表中会为此字段创建索引
* default：默认值
* primary_key：若为 True, 则该字段会成为模型的主键字段
* unique：如果为 True, 这个字段在表中必须有唯一值

### 模型之间的关系
* 关系的类型包括：
  * ForeignKey：一对多，将字段定义在多的端中
  * ManyToManyField：多对多，将字段定义在两端中
  * OneToOneField：一对一，将字段定义在任意一端中
* 可以维护递归的关联关系，使用'self'指定，详见“自关联”
* 用一访问多：对象.模型类小写_set
  ```html
   bookinfo.heroinfo_set
  ```

* 用一访问一：对象.模型类小写
  ```html
   heroinfo.bookinfo
  ```

* 访问id：对象.属性_id
  ```html
   heroinfo.book_id
  ```
### 元选项
* 在模型类中定义再定义一个类Meta，用于设置元信息 
* 元信息能定义的内容：
  1. db_table：定义迁移后的数据表名称，推荐使用小写字母，数据表的默认名称为：“项目名_模型名”的格式
     ```html
      class BookInfo(models.Model):
         btitle=models.CharField(max_length=20),
         bpub_date=models.DateTimeField(db_column='pub_date'),
         bread=models.IntegerField(default=0),
         bcommet=models.IntegerField(null=False),
         isDelete=models.BooleanField(default=False)
            class Meta:
                db_table='bookinfo'
     ``` 
  2. ordering：对象的默认排序字段，获取对象的列表时使用，接收属性构成的列表
     * 排序会增加数据库的开销
     * 字符串前加-表示倒序，不加-表示正序'-id'
     ```html
      class BookInfo(models.Model):
         class Meta():
             ordering = ['id']  # id正序排序
     ```   
### 管理器
* objects，是管理器Manager类型的实例对象，用于与数据库进行交互
* 管理器是Django的模型进行数据库的查询操作的接口
* Django应用的每个模型都拥有**至少一个管理器**
  * 我们常在view中去使用
    ```html
     bookList=BookInfo.objects.all()
    ```  
  * 当定义模型类时没有指定管理器，则Django会为模型类提供一个名为objects的管理器

* 也能自定义管理器
  ```html
   class BookInfo(models.Model):
      books = models.Manager() #自定义了一个叫books的对象
  ```  
  * 当为模型类指定管理器后，django不再为模型类生成名为objects的默认管理器
  * 自定义管理器类**用途**主要用于两种情况：
    1. 修改管理器返回的原始查询集：重写get_queryset()方法
       ```html
         class BookInfoManager(models.Manager): # 重新写一个类
          def get_queryset(self):
               return super(BookInfoManager, self).get_queryset().filter(isDelete=False) # filter是指获取满足条件的数据
         class BookInfo(models.Model):
          books = models.Manager() # 这是默认的
          books2 = BookInfoManager() # 这是新增过滤条件的管理器对象
       ```
       ```html
        BookInfo.books.all() # 所有数据
        BookInfo.books2.all() # 会调用自定义管理器里面过滤后的数据
       ```
    2. 向管理器类中添加额外的方法：见下面“创建对象”中的方式二

### 创建对象
* _init_方法已经在基类models.Model中使用，在自定义模型中无法使用再以这样方式来创建
* 方法一：定义一个类方法【不能定义普通方法的原因是因为此时没有实例对象】
  ```html
    class BookInfo(models.Model):
    btitle=models.CharField(max_length=20,default='')
    bpub_date=models.DateTimeField(db_column='pub_date',default='')
    bread=models.IntegerField(default=0)
    bcomment=models.IntegerField(default=0)
    isDelete=models.BooleanField(default=False)
    class Meta:
        db_table='bookinfo'
        ordering = ['bcomment']
    # 创建对象不能使用__init__方法，因为继承的models.Model里面已经有了
    @classmethod
    def create(cls,btitle,bpub_date,bread=0):
        b=BookInfo()
        b.btitle=btitle
        b.bpub_date=bpub_date
        b.bread=bread
        b.bcomment=0
        b.isDelete=False
        return b
  ```
  * 验证
  ```html
   # 引入模型类
   from booktest.models import BookInfo
   # 引入时间包
   from datetime import *
   # 调用
   book=BookInfo.create("hello",datetime(1980,10,11),0);
   # 保存，调用save()方法才与数据库交互，将对象保存到数据库中
   book.save()
  ```
* 方法二：自定义的管理器中增加【推荐的方法】
  ```html
   class BookInfoManager(models.Manager): 
     def create(self,btitle,bpub_date,bread=0):
        b=BookInfo()
        b.btitle=btitle
        b.bpub_date=bpub_date
        b.bread=bread
        b.bcomment=0
        b.isDelete=False
        return b
   class BookInfo(models.Model):  
      book2= BookInfoManager() 
  ```
  * 调用  
  ```html
   # 引入模型类
   from booktest.models import BookInfo
   # 引入时间包
   from datetime import *
   # 调用管理器中定义的方法
   b=BookInfo.book2.create("world",datetime(1987,10,11),0)  
   b.save()
  ```