# 虚拟环境

### 为何要用虚拟环境
* 在开发Python应用程序的时候，系统安装的Python3只有一个版本：3.4。所有第三方的包都会被pip安装到Python3的site-packages目录下。
* 如果我们要同时开发多个应用程序，如果应用A需要jinja 2.7，而应用B需要jinja 2.6怎么办？或者A项目用python2.7，B项目用python3.6怎么办？
* 这种情况下，每个应用可能需要各自拥有一套“独立”的Python运行环境。virtualenv就是用来为一个应用创建一套“隔离”的Python运行环境。

### 虚拟环境好处
   1. 使不同应用开发环境独立
   2. 环境升级不影响其他应用，也不会影响全局的python环境
   3. 它可以防止系统中出现包管理混乱和版本的冲突

### 虚拟环境工具virtualenv
   1. 安装
      ```
       //cmd下输入:
       pip3 install virtualenv
      ```
      * 如果慢，使用镜像源【豆瓣镜像源】
          ```
           pip3 install -i https://pypi.douban.com/simple/ 安装的包名
          ```
   3. 新建虚拟环境
      * 在当前路径下新建【先找到要安装的项目路径，再按cmd进入命令行】
        ```
         //virtualenv 虚拟环境名字【这种方式创建的环境，是当前系统使用python版本创建的】
         virtualenv venv3

        ```
        * 安装完成后，我们发现项目中多了一个venv3的文件夹
        * 包含了Python可执行文件，以及 pip 库的一份拷贝，这样就能安装其他包了。
      * 如果我们要对该项目使用2.7的版本
        * 指定这个环境要用到python版本【**注意：** 这里指定版本，是本地已经装好了的。只是切换，并非真的安装】
        ```
         virtualenv -p C:\Python27\python.exe 环境名
         virtualenv -p C:\Python27\python.exe venv2

        ```
   4. 进入新建的虚拟环境目录
      ```
       cd venv2
      ```
   5. 进入Scripts文件夹
      ```
       cd Scripts
      ```
   6. 激活这个虚拟环境
      ```
       activate.bat
      ```
      * 在命令行前面看到多了内容:(venv2) 此时已经进入了venv2这个虚拟环境
   7. 验证【注意需要退出cmd，重新进入】
      ```
       python --version
       //此时结果是Python 2.7.14
      ```
   8. 退出虚拟环境
      ```
       deativate.bat
      ```

 * 总结：这种方式，就是要记住安装的虚拟环境的路径，用起来比较麻烦，不方便管理


### 使用virtualenvwrapper(虚拟环境管理工具，用于管理virtualenv)
* 安装步骤
   1. 安装
      * 注意windows下有“-win”别掉了
      ```

        pip3 install -i https://pypi.douban.com/simple/  virtualenvwrapper-win

      ```
   2. 验证
      ```
       输入：
       workon
      ```
       * 如果出现相应的命令则安装成功

   3. 修改默认虚拟环境的安装路劲
       * 如果此时安装，默认路径在：C:\Users\Administrator\envs下。
       * 如果要修改，通过环境变量WORKON_HOME来改变：
         1. 新建环境变量,变量名为"WORKON_HOME"
         2. 输入的值就是你的想要指定的路径
   4. 创建虚拟环境(新创建虚拟环境都是WORKON_HOME的路径下面)
      ```
       mkvirtualenv 虚拟环境名
       mkvirtualenv yisvenv_v2
      ```
       * 创建成功后会在当前路径下自动就进入了环境中，而且所有的环境路径都安装在刚才配置路径的文件夹中
       * 指定python2.7版本安装虚拟环境
         ```
          mkvirtualenv -p C:\Python27\python.exe yisvenv_v2
         ```
   5. 退出虚拟环境
      ```
       deactivate
      ```
   6. 进入/切换虚拟环境
      ```
       workon 虚拟环境名
      ```
      * 进入环境就可以正常操作了
        ```
         pip list
         pip freeze
         # 查看安装的包
         pip install django==1.8.2
        ```
* 其他常用命令
   * 列出所有虚拟环境
      ```
       lsvirtualenv
      ```
   * 删除虚拟环境
      ```
       rmvirtualenv venv
      ```

### 在pycharm使用指定的虚拟环境
```
file--setting--Project Interpreter--add--based Interpreter在里面指定需要的虚拟环境的python路径即可
指定后，这个虚拟环境下的安装的包都能看到
```
