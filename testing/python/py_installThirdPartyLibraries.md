# 安装第三方库
### 方式
1. 方法一:使用cmd安装
   1. 在python安装目录下进入script文件夹
   2. 在此路径下进入cmd
   3. 使用命令安装
      ```
       pip install -i https://pypi.douban.com/simple/ 包名
      ```
2. 方式二:在pycharm里面直接安装
   1. File-settings-Project-Project interpreter
   2. 点击加号，搜索需要安装的模块名，即可安装
      1. 【如果上面网络受限无法连接到可安装包列表，需要添加镜像源】
      2.  在上面第一步基础上选择Manage Repositories，里面添加镜像源【任选其1即可】
          ```
           https://pypi.douban.com/simple/
           http://mirrors.aliyun.com/pypi/simple/
           https://pypi.mirrors.ustc.edu.cn/simple/
          ```
      3. 重启一下pycharm，差不多就能刷出安装列表了。


### 安装路径
* 包安装在Python35\Lib\site-packages\下
    * 对于有些不支持pip安装或者不能上网的场合，可以直接放在这个包下面或者手动安装
       ```
        python setup.py install
       ```
    * whl文件的安装
      ```
       pip install 文件名.whl
      ```
      * wheel本质是一个zip包格式，它使用.whl扩展名，用于python模块的安装。
      * 使用pip命令安装whl文件
	* 本地的txt文件
      ```
	   pip install -r requirement.txt
      ```
      * requirement.txt文件里面记录了当前程序运行所需要的所有安装包和其版本号，作用是方便程序在其他机器上重新构建项目安装所有依赖
      * requirement.txt文件生成
        ```
         pip freeze > requirement.txt
        ```	  
### pip常用命令
1. 查看已经安装的包
   ```
    pip list 或者 pip freeze
   ```
2. 查看某个已安装包的信息
   ```
    pip show pymysql
   ```
   ```
    Name: PyMySQL
    Version: 0.8.0
    Summary: Pure Python MySQL Driver
    Home-page: https://github.com/PyMySQL/PyMySQL/
    Author: INADA Naoki
    Author-email: songofacandy@gmail.com
    License: MIT
    Location: d:\program files\lib\site-packages
    Requires:
    Required-by:
   ```
3. 卸载某个包
   ```
    pip uninstall pymysql
   ```

4. 指定版本安装
   ```
    pip install django==1.10.3
   ```