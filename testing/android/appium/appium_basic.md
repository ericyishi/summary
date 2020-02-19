# appium基础概念

### 概念
* appium 是一个自动化测试开源工具，支持 iOS 平台和 Android 平台上的原生应用，web应用和混合应用。
* 它使用WebDriver协议驱动iOS，Android和Windows应用程序。

### 核心
* 使用C/S架构。运行时候Service端会监听Client端发送的命令，接着在移动设备上执行这些命令，然后将执行结果放在 HTTP 响应中返还给客户端。
* Session 建立连接。客户端初始化一个和服务端交互的session。客户端发送一个附有desired capabilities的JSON对象参数的POST请求，服务端就会开始一个自动话的session，然后返回一个session ID，客户端拿到这个ID后就用这个ID发送后续的命令。
* Desired Capabilities配置参数。告诉服务器我们需要控制的设备是什么的参数

### 结构
1. 客户端
   * Appium Client即我们的电脑写的代码，通过操作发送请求服务器来获取数据。
   * appium提供了一套appium client，涵盖多种语言ruby/java/python等，对原生的webdriver进行了一些移动端的扩展，比如swipe
   * Appium采用底层驱动商提供统一的WebDriver API : from Appium import webdriver 
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

### 运行原理
```
脚本 (Appium-Python-Client)----------------Python                 
      |                                      |
      V                                      V
Appium Server ----------------------------Appium（Nodejs）                          
      |                                      |
      V                                      V   
UiAutomator------------------------------AndroidSDK(JDK)                           
      |                                      |
      V                                      V        
   手机执行-------------------------------手机/模拟器                                
                  
``` 
### 高频名词
* UiAutomator
  * 是Android自动化测试框架
  * 是谷歌在Android4.1版本发布时推出的一款用Java编写的UI测试框架。
  * 其最大的特点就是可以跨进程操作，我们可以使用UiAutomator框架提供的一些方便的API来对安卓应用进行一系列的自动化测试操作，如点击、滑动、键盘输入、长按以及常用的断言方法等。可以替代以前繁琐的手工测试。  

* Bootstrap
  * 是Appium在初始化的时候推送到安卓手机上的一个UiAutomator测试脚本
  * 该脚本的唯一一个测试方法所做的事情是在手机端开启一个SocketServer（通信模块），用来监听Appium从PC端过来的命令发送给UiAutomator来执行处理。
  * 监听4724端口由appium发送过来的相关请求，并且将请求转换成UiAutomator可以识别的命令发给UiAutomator进行处理
  * Bootstrap是基于UiAutomator V1（即为UiAutomator）的，但是UiAutomator很多Api基本上官方不再维护了
  
* UiAutomator2  
  * 是UiAutomator的升级版本
  * 为了能够支持UiAutomator2，Appium引入了appium-uiautomator2-server。Appium使用UiAutomator2的目的是为了替换掉之前的UiAutomator+Bootstrap模式
  * UiAutomator V2修复了UiAutomator V1中遇到的大多数问题，最重要的是实现了与Android系统更新的分离
  * 在获取到toast信息的时候需要将automationName设置成UiAutomator2，就是因为在UiAutomator2上新增了AccessibilityService服务，可以实现Toast的获取。