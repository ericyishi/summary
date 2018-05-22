# sqlit3和mysql
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
  1. 打开settings文件
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
     * 打开__init__.py文件
       ```
        import pymysql
        pymysql.install_as_MySQLdb()
       ```
  4. 在mysql RDBMS创建数据库guest
     ```
      create database guest
     ```
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
