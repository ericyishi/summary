# 模型
### SQLit3
* Django默认配置了SQLite3数据库
* 配置文件查看setting.py文件
  ```
   DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
   }
  ```
* 使用Navicat查看
  1. 点击“连接”图标--选择“SQLite”
  2. 弹出框选项卡选择“常规”，选择数据库文件，找到对应项目db.sqlite3文件
  3. 点击确定，就关联了。

### mysql
* 将Django的数据改为mysql
  1. 打开项目下的settings文件
  2. 修改DATABASES里面的内容
     ```
        DATABASES = {
            'default':{
                'ENGINE':'django.db.backends.mysql', #驱动
                'HOST':'127.0.0.1', #主机
                'PORT':'3306', # 端口
                'NAME':'guest', # 数据库
                'USER':'root', # 用户名
                'PASSWORD':'root', # 密码
                'OPTIONS':{
                    'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
                }

            }
        }
     ```
  3. 修改Django连接mysql的驱动为pymysql【需要单独安装】
     ```
       pip install mysql-python
     ```
     * 打开__init__.py文件
       ```
        import pymysql
        pymysql.install_as_MySQLdb()
       ```
  4. 在mysql RDBMS创建数据库guest
     ```
      create database guest charset=utf8
     ```
     * 创建数据库, 设置默认编码为utf-8以及默认的排序方式  create database pymysql_db default charset utf8 collate utf8_general_ci;
  5. 迁移数据库
     * 切换数据库后，之前的SQLite3数据库里的内容是无法复制到mysql中的，所以需要重新执行数据库同步，使数据模型model重新在mysql中生成表
     ```
      python manage.py migrate
     ```
     * 此时打开guest数据库，里面就能看到直接sqlit一致的数据表了。
  6. 超级管理员也需要重新创建
     ```
      python manage.py createsuperuser
     ```
     * 输入用户名
     * 密码
     * django no such table :auth_user遇到这个报错的时候，是说明我们在创建超级管理员之前并没有生成迁移表，所以Django找不发到table，因此只需要执行以下语句，生成迁移表就行：
       ```
        python manage.py migrate
       ```

### 管理界面
* 先启动服务，然后到管理页面即可 http://127.0.0.1:8000/admin
* 使用上面步骤6创建的用户即可登录


### 开发步骤
1. 在models.py中定义模型类，要求继承自models.Model
2. 把应用加入settings.py文件的installed_app项
3. 生成迁移文件
4. 执行迁移生成表
5. 使用模型类进行crud操作

### 定义模型
* 自定义管理页面
```
# 需要先新建admin.py文件
from django.contrib import admin
from models import BookInfo #这里BookInfo则是自定义的类，在这里注册
class 自定义类名(admin.ModelAdmin):
   #这里就可以各种样式

admin.site.register(BookInfo,自定义类名)

```
  * 在这个类里面可以定义一些展示效果（参考页面：https://www.cnblogs.com/wendoudou/p/3415552.html）

#### 字段类型
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