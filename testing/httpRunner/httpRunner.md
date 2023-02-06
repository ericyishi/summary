# httpRunner
### 介绍
* httprunner 是一款面向 http(s) 协议的通用测试框架，只需编写维护一份 yaml/json 脚本，即可实现自动化测试、性能测试、线上监控、持续集成等多种测试需求。
### 安装配置
* 安装
    ```html
      pip install httpRunner -i https://pypi.douban.com/simple/
    ```
* 检查是否安装成功
    ```html
      httpRunner -V
    ```
* 新建项目
    ```html
      hrun --startproject 项目名
      hrun --startproject BaseAccApiTest
    ```    