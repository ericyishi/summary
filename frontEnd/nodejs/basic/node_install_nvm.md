# nodejs
### nodejs是什么
* node.js不是插件也不是框架
* 而是服务器端的JS运行时【server side javascript runtime】，类似于PHP的运行环境
* 可以在node中运行js代码，但是在node中只需要ES
* JS中包含了三块，ES(ECMAScript)、BOM（浏览器对象模型）、DOM（文档树对象模型）
* node采用的是chrome的V8引擎,【chrome浏览器端运行js的也是v8引擎】进入node的时候的命令行，就是我们F12时候的控制台。【但是，node在v8引擎外还包装很多API的东西：提供文件、网络之类的】

### node的用途
1. 开发web应用程序（php能干的事，node也能干）:做动态网站，开发提供数据的服务端API
2. 前端开发工具的基础


### 安装方式
1. 直接官网下载对应版本，并配置环境变量。【不推荐】
2. 使用nvm方式。【方便控制NODE版本】

### 使用NVM安装
* 好处：在于对于不同项目对node要求不一致，那么有了它就可以很方便的切换。
* 因为node版本比较多，开发人员可能依赖很多版本，所有有了nvm（node version manager）来安装管理node
* 安装步骤
  1. 下载nvm安装包https://github.com/coreybutler/nvm-windows/releases
  2. nvm.rar解压所在路径
     * nvm必须安装在【全英文的路径且不要有空格】，比如这切换npm分支是会报错的
     * nvm.exe用来管理，但是用命令行运行，不是双击！
  3. 双击install.cmd 【以管理员权限运行】
  4. 配置它弹出settings.txt配置文件。将nvm所在路径，粘贴到里面
     ```
       root: C:\dev\nvm
       path: C:\dev\nodejs
       arch: 64
       proxy: none
       node_mirror: http://npm.taobao.org/mirrors/node/
       npm_mirror: https://npm.taobao.org/mirrors/npm/

     ```

     * root ： nvm的存放地址
     * path ： 存放指向node版本的快捷方式，使用nvm的过程中会自动生成。一般写的时候与nvm同级。
     * arch ： 电脑系统是64位就写64,32位就写32
     * proxy ：代理
     * mirror: 配置镜像，使用淘宝源，让安装起相关插件更快
  5. 验证安装。
     * 在nvm所在文件夹下，在此处按住【shift】+鼠标右键选择“在此处打开命令窗口”，输入
       ```
        nvm
       ```
     * 如果显示相关nvm信息的界面，就安装成功。
  6. 环境变量配置。为了能任何地方都能够使用，还需配置环境变量
     ```
       新建一个NVM_HOME（固定名字）
       值为nvm所在文件夹的路径

       新建NVM_SYMLINK（固定名字）
       值为上面nodejs所在的路径

       Path=%NVM_HOME%;%NVM_SYMLINK%；

     ```
  7. 安装node
     ```
      nvm install 5.5.0
     ```
  8. 使用node的5.5.0版本
     ```
      nvm use 5.5.0
     ```
  9. 此时就可以正常使用npm命令来运行了

### NVM常用命令
  * 查看已安装的node版本
    ```
    nvm ls
    ```
  * 安装node命令
    ```
    nvm install 0.11.10 安装node版本号（0.11.10）
    注意安装32位使用：
    nvm install 0.11.10 32
    那么使用的时候也是要输入
    nvm use 0.11.10 32

    ```
