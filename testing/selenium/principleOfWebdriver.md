# webdriver工作原理
### 设计模式
* webdriver是按照Server-Client设计模式设计的
  * 浏览器作为server端
    * 等待Client发送请求并作出相应以及返回response包含执行状态、返回值等信息
  * 测试代码作为client端
    * 发送动作给服务器端
### 工作流程
  1. webdriver启动目标浏览器，并绑定到指定端口，启动的浏览器作为webdriver的服务器端Remote Server
  2. Client端通过CommandExcuter发送HTTPRequest给Remote Server的监听端口
  3. 服务端需要依赖原生的浏览器组件（即驱动程序如chromedriver等）来转化浏览器的native操作

### 开启debug模式
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
     * 此时就能够捕捉到log信息，但是这个只有单向的，客户端向服务端发送的POST请求，而无法获取服务器返回的信息
