# webdriver工作原理
### 设计模式
* webdriver是按照Server-Client设计模式设计的
  * 浏览器作为server端
    * 等待Client发送请求并作出相应以及返回response包含执行状态、返回值等信息
  * 测试代码作为client端
    * 发送动作给服务器端
### 工作流程
  * selenium client(Java等语言编写的自动化测试脚本)初始化一个service服务，通过Webdriver启动浏览器驱动程序
  * 通过RemoteWebDriver向浏览器驱动程序发送HTTP请求，浏览器驱动程序解析请求，打开浏览器，并获得sessionid，如果再次对浏览器操作需携带此id
  * 打开浏览器，绑定特定的端口，把启动后的浏览器作为webdriver的remote server
  * 打开浏览器后，所有的selenium的操作(访问地址，查找元素等)均通过RemoteConnection链接到remote server，然后使用execute方法调用_request方法通过urlib3向remote server发送请求
  * 浏览器通过请求的内容执行对应动作
  * 浏览器再把执行的动作结果通过浏览器驱动程序返回给测试脚本

### 开启debug模式--加入日志
  * 这个是python提供的logging模块，有一个basicConfig()方法用于基本信息的定义
    ```
     import logging
     logging.basicConfig(level=logging.DEBUG)
     driver=webdriver.Chrome() #这里调用的chrome浏览器，相关驱动放在了python安装目录下即可C:\Python27
     driver.get("http://www.baidu.com")
     driver.find_element_by_id("kw").send_keys("hello")
     driver.find_element_by_id("su").click()
     driver.quit()
    ```
     * 此时就能够捕捉到log信息，但是这个只有单向的，只是客户端向服务端发送的POST请求，而无法获取服务器返回的信息
