# npm
#### npm介绍
* npm其实是Node.js的包管理工具（node package manager）
* npm已经在Node.js安装的时候顺带装好了
```
为啥我们需要一个包管理工具呢？
因为我们在Node.js上开发时，会用到很多别人写的JavaScript代码。如果我们要使用别人写的某个包，每次都根据名称搜索一下官方网站，下载代码，解压，再使用，非常繁琐。于是一个集中管理的工具应运而生：大家都把自己开发的模块打包后放到npm官网上，如果要使用，直接通过npm安装就可以直接用，不用管代码存在哪，应该从哪下载。
更重要的是，如果我们要使用模块A，而模块A又依赖于模块B，模块B又依赖于模块X和模块Y，npm可以根据依赖关系，把所有依赖的包都下载下来并管理起来。否则，靠我们自己手动管理，肯定既麻烦又容易出错。
```

#### 常用命令
* 查看版本
    ```
    npm -v
    ```
* 查看用户手册
    ```
    npm -h
    ```
* 初始化包项目
    * 在项目中，我们怎么让一起开发的同事知道项目中用了哪些包，具体包的版本信息呢？这时package.json就上场了，可以把它想成是java语言中的pom.xml
    ```
    npm init
    ```
    * 可以使用npm init --yes命令直接使用默认的配置来创建package.json文件
* 安装包
    ```
    安装包命令
    npm install 包名字@版本号
    ```
    * --save【 dependencies】：
    * --save-dev【 devDependencies】
    * 生产模式用dependencies，开发环境用devDep
    * 什么也不跟就是本地安装
    * -g 全局安装
    ```
    npm install -g gulp
    ```
* 卸载包
    ```
    npm unistall 包名
    ```
* 查看全局安装过的包
    ```
    npm list -g --depth 0
    ```
* 查看全局安装的模块路径
    ```
    npm root -g
    ```
