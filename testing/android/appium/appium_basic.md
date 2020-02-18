# appium基础概念

### 概念
* appium 是一个自动化测试开源工具，支持 iOS 平台和 Android 平台上的原生应用，web应用和混合应用。
* 它使用WebDriver协议驱动iOS，Android和Windows应用程序。

### 结构
* appium选择了Client/Server的设计模式。只要client能够发送http请求给server，那么的话client用什么语言来实现都是可以的，这就是appium及Selenium(WebDriver)如何做到支持多语言的原因
1. 客户端
   * Appium Client即我们的电脑写的代码，通过操作发送请求服务器来获取数据。
   * appium提供了一套appium client，涵盖多种语言ruby/java/python等，对原生的webdriver进行了一些移动端的扩展，比如swipe
   * 如果是python，需要通过pip命令安装
     ```
      pip install Appium-Python-Client -i http://pypi.douban.com/simple/
     ```
     * 如果使用RF框架，还需要安装robotframework-appiumlibrary
       ```
        pip install robotframework-appiumlibrary -i http://pypi.douban.com/simple/
       ```
2. 服务端
   * Appium Server就是Appium的服务端——是一个暴露了一系列RESTful API的服务器，本身使用Node.js开发实现。默认开放端口为：4723
   * Session，在webdriver/appium，所有工作永远都是在session start后才可以进行的。
   * Appium Desktop为Appium Server的图形界面，同时还兼顾一些工具，可以使用Inspector查看应用程序的元素，获取有关它们的基本信息，并与它们进行基本的交互。
   * 安装服务端，可以通过node安装，但是通过Appium Desktop更为便捷有用。   