# 安装第三方库
### 方式
1. 方法一:使用cmd安装
   1. 在python安装目录下进入script文件夹
   2. 在此路径下进入cmd
   3. 使用命令安装
      ```
       pip install pymysql
      ```
2. 方式二:在pycharm里面直接安装
   1. File-settings-Project-Project interpreter
   2. 点击加号，搜索需要安装的模块名，即可安装
      1. 【如果上面网络受限无法连接到可安装包列表，需要添加镜像源】
      2.  在上面第一步基础上选择Manage Repositories，里面添加镜像源【任选其1即可】
          ```
           http://pypi.douban.com/simple/
           http://mirrors.aliyun.com/pypi/simple/
           https://pypi.mirrors.ustc.edu.cn/simple/
          ```
      3. 重启一下pycharm，差不多就能刷出安装列表了。


### 安装路径
包安装在Python35\Lib\site-packages\下