# Django
### 安装
```
 pip install django
```
* 可以指定版本django==1.8.2，不指定下载最新的

### 1.快速创建一个项目
* 网页展示hello world
1. 查看django提供的命令
   ```
    django-admin
   ```
   ```
     check
     compilemessages
     createcachetable
     dbshell
     diffsettings
     dumpdata
     flush
     inspectdb
     loaddata
     makemessages
     makemigrations
     migrate
     runserver
     sendtestemail
     shell
     showmigrations
     sqlflush
     sqlmigrate
     sqlsequencereset
     squashmigrations
     startapp
     startproject
     test
     testserver
   ```
2. 创建项目
   * 进入需要创建项目的目录【需要在有权限的目录下才会成功】
   ```
    django-admin startproject 项目名
   ```
   ```
    django-admin startproject guest
   ```
   * 项目结构：
      * 项目下有一个manage.py文件，是一个命令行工具
      * 项目下还有项目名叫guest目录，进入
        * \_\_init\_\_.py: 一个空文件，用来标志一个目录为python文件
        * setting.py: Django项目配置文件，包括django的模块应用配置，数据库配置，模板配置等。
          ```
            Databases字段下可以配置要使用的数据库。默认使用的sqllite数据库
          ```
        * urls.py Django项目url声明
        * wsgi.py 与WSGI兼容的web服务器为你的项目提供服务入口点

3. 在项目基础上创建应用（一个项目可以创建多个应用）
   * 创建应用（需要到manage.py文件下运行）
   * 如果使用了虚拟环境，需要先workon进入到虚拟环境中，在切换到创建应用的路径下
   ```
    python manage.py startapp 应用名
   ```
   ```
    python manage.py startapp sign
   ```
   * 运行后，就会在当前路径下生成一个应用，名字就是上面取的
   * 进入sign文件夹应用结构【注意没有template模板模块，因为初始化的视图内容还没有确定，所以没有模板】：
     * migrations文件夹：用于记录models中数据的变更
     * admin.py 映射models中的数据到django自带的admin后台
     * apps.py 用于应用程序的配置
     * models.py 模型文件，创建应用程序数据表模型（对应数据库的相关操作）
       1. 定义模型类
          * 这里可以编写，需要的表结构
            ```html
             class BookInfo(models.Model):
                pass 
            ```
            * **注意：**这里必须要继承django的models.Model，因为要使用django的model，不这样写就是个普通类，没法与数据库建立映射关联。
       2. 注册应用。将应用名加入setting.py文件中的INSTALLED_APP字段中
       3. 迁移migrations,就会将步骤1中模型生成需要的字段（根据模型类生成sql语句）
          ```
           python manage.py makemigrations
          ```
       4. 执行迁移（执行sql语句生成数据表）
          ```
           python manage.py migrate
          ```
     * test.py django自带的测试用例
     * views.py django的视图文件，控制向前端页面显示内容
4. 运行项目，启动服务
   ```
    python manage.py runserver
   ```
   * 浏览器地址栏上输入：http://127.0.0.1:8000/访问，可以看到django启动的页面
   * 如果端口被占用，可以使用指定的IP和端口
     ```
      python manage.py runserver http://127.0.0.1:8001/
     ```
5. 注册sign应用
   * settings.py下将sign添加进INSTALLED_APPS列表中去
     ```
         INSTALLED_APPS = [
            'django.contrib.admin',
            'django.contrib.auth',
            'django.contrib.contenttypes',
            'django.contrib.sessions',
            'django.contrib.messages',
            'django.contrib.staticfiles',
            'sign'
         ]
     ```

6. 在sign应用的view视图文件创建index函数，用于返回一个内容hello world
   ```
    from django.http import HttpResponse
    def index(request):
    return HttpResponse("hello world!");
   ```
   * HttpResponse以字符串形式传递给客户端

7. 配置访问资源路径，希望通过/index访问到内容
   * urls.py中配置
     ```
      from sign import views # 导入sign应用views模块
      urlpatterns = [
          url(r'^admin/', admin.site.urls),
      	  url(r'^index/$', views.index), # 添加index/路径的配置，使用sign应用views模块index方法来做处理
      ]
     ```
8. 再次重启服务，访问，就能看到hello world
   ```
    http://127.0.0.1:8000/index/
   ```

* 工作流程
  1. 浏览器输入访问的资源路径
  2. 服务器解析资源路径，在urls.py文件中匹配，一旦匹配就停止；如果没有找到或者过程中抛出异常，django会调用一个适当的错误处理视图
  3. 如果找到就去对应应用找对应的方法，进行具体的处理
  4. 显示页面
* 附：
  * 重构：使用模板
  * 在sign文件夹下创建一个templates文件夹【固定的，不能改】
    * 在templates文件夹下创建一个snow.html文件
    * 修改view.py的内容
      ```
       def index(request):
        return render(request,"snow.html")
      ```
    * 重启服务，访问 http://127.0.0.1:8000/index/，就能看到snow.html里面的内容了
      * 但是仅能显示html与css，如果有其他文件夹下的资源（如：引用图片），这样是无法加载显示的


