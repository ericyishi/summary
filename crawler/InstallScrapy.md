# Scrapy框架的安装
* 目标：安装scrapy框架并安装一个spider并调通
### 安装步骤
1. 创建虚拟环境
   ```
    mkvirtualenv article_spider
   ```
   * 查看虚拟环境安装：[点我](../testing/python/tools/py_virtualenv.md)
2. 在虚拟环境中安装，安装框架scrapy【依赖了很多包，下载需要一些时间】
   ```
    pip install -i https://pypi.douban.com/simple/  scrapy
   ```
   * 如果这一步安装失败，提示：“Microsoft Visual C++ 14.0 is required...”
      * 解决方案:
        1. http://www.lfd.uci.edu/~gohlke/pythonlibs/#twisted 下载twisted对应版本的whl文件（如我的Twisted‑17.5.0‑cp36‑cp36m‑win_amd64.whl），cp后面是python版本，amd64代表64位，运行命令【也是在虚拟环境下运行】：
           ```
            pip install C:\Users\CR\Downloads\Twisted-17.5.0-cp36-cp36m-win_amd64.whl
           ```
            * 其中install后面为下载的whl文件的完整路径名
        2. 安装完成后，再次运行【在虚拟环境中】，基本就能成功了：
           ```
            pip install -i https://pypi.douban.com/simple/  scrapy
           ```
3. 进入要存放工程的路径下，进入虚拟环境下
   ```
    workon article_spider
   ```
4. 新建scrapy项目
   ```
    scrapy startproject 项目名
    scrapy startproject ArticleSpider
   ```
   * 运行后，此时路径下已经有了一个工程框架文件叫ArticleSpider，但里面还没有spider
5. 进入刚新建的项目目录，创建爬虫
   ```
    cd ArticleSpider

    scrapy genspider 爬虫名 爬取的网站
    scrapy genspider jobbole blog.jobbole.com
   ```
   * 此时scrapy工程里面的spiders文件夹中就多了一个jobbole.py文件
6. 使用pycharm打开相关项目文件
7. 要把这个项目解释器的环境换成我们刚才新建的虚拟环境
   ```
    File--Settings--Project--Project Interpreter
    选择“齿轮”图标--add local--找到虚拟环境的路径即可：D:\envs\artical_spider
   ```
8. 调试spider。需要自己新建一个py文件。例如main.py【路径是在最外面的工程文件下创建，与scrapy.cfg同名】
9. main.py中编写调试内容
   ```
    from scrapy.cmdline import execute
    import sys
    import os

    sys.path.append(os.path.dirname(os.path.abspath(__file__)))
    execute(["scrapy", "crawl", "jobbole"])
   ```
   * 将文件放入path路径下才能调试
   * 启动爬虫，格式：scrapy crawl spider名字

10. 修改配置文件settings.py。将ROBOTSTXT_OBEY 设为false
     ```
      ROBOTSTXT_OBEY = False
     ```
      * 修改后使爬虫每次爬取网页时候不遵循ROBOTS协议
11. debug模式运行main.py文件前可以在jobbole.py那边打一个断点。
    ```
     # 打在parse这个方法里面
     def parse(self, response):
    ```
12. debug模式运行main.py文件
     * 如果运行的时候，报错，那么还需要安装pypiwin32模块
       ```
        pip install -i https://pypi.douban.com/simple/  pypiwin32
       ```
     * 如果能进入断点，并能看到相关response信息，大功告成！





