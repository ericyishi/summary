# selenium2与selenium3
### 安装
```
 pip install selenium==2.48.0
```
* 默认是安装最新包，如果不希望最新版，可以指定版本号
### 确认
1. 进入python环境
```
 import selenium #如果没有报错就说明是安装成功了
```

### 两者区别
* 2和3的最明显的区别就是：2在使用FF浏览器的时候不需要下载驱动，而3使用FF浏览器（比如48版本以上）的时候是必须下载驱动geckodriver.exe的
* 3只支持jdk8以上的版本
