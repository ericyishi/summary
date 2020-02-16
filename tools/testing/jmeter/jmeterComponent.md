# jmeter常用组件
### 线程组（Thread Group）
* 线程组可以看成是一个虚拟用户组，而这个集合可以做相同的一件事。线程组中的每一个线程都可以是一个虚拟用户。
* 如果只是单纯的接口测试，可以设置线程数量为1
* 可以设置线程数、循环次数、ramp-up period 是指决定多长时间启动所有线程。
### 取样器（sampler）
* 我们知道性能测试手段主要是基于协议的，所以所有跟协议交互的参数都在此设置，例如HTTP请求等。websocket默认没有的。
   * 如果要把发送一个请求时候其他资源也带上，那么在Advanced面板下，勾选“从HTML文件获取所有的内含资源”即可
### 配置元件（config Element）
* 用于提供相对静态数据配置的支持。
  * 针对HTTP协议，通常我们需要为某个线程组创建“HTTPCookie管理器”，该元件可以维持会话的cookie和session
  * "HTTP请求默认值"，可以把像服务器ip，协议名这类共有信息填在这个元件里面统一管理，方便修改，而非单独对每个取样器进行设置
  * "DebugSampler",可以把变量值显示出来
  * "csv数据文件设置",可以从csv文件中提取不同的用户名、密码来模拟不同用户登录场景
### 定时器（Timer）
* 为请求之间设置等待时间。模拟真实使用场景
  * 固定定时器
  * 高斯随机定时器
  * Synchronizing Timer ，集合点
    * Number of Simulated Users to Group by，用于设置多少用户到达后就开始触发，为0代表全部
    * Timeout in milliseconds，设置超时时间，以防止某些用户被阻塞，无法到达集合点而影响整体测试
    
### 前置处理器（Pre Process）
* 用于发出前的请求进行特殊处理

### 后置处理器（Post Process）
* 用于对发出请求后得到的服务器相应进行处理
* 例如我们提取响应中值或者验证码，就需要在对应的取样器下面添加一个“正则表达式提取器”
  * 需要注意因为jmeter是java编写的，所以符号注意大小写，单引号表示字符，而双引号代表字符串。而弱类型语言单双引号都是字符串。所以提取的内容本身带有引号还需要注意转义
  * 里面模板的含义参考网址：[Jmeter之正则表达式提取器应用](https://www.cnblogs.com/tudou-22/p/9566894.html)
  * 提取后值放入一个变量里面，引用的地方写成${变量名} ，更多参考[Jmeter添加变量的四种方法](https://blog.csdn.net/qq_38317509/article/details/82021814)
* JSON Extractor，json格式的提取器
  * 在JSON Path Expressions中写提取的结构，对于列表中的多个字典格式，以及单个字典格式写法不同：
    1. 单个字典格式：
       ```
         $.level1.level2
         直接以$开头，一层一层结构剥离就对了
       ```
    2. 列表中的多个字典
       ```
         $[下标].level1.level2
       ```
### 断言（Assertions）
* 用于检测得到的数据是否符合预期
  * 对于JSON格式的也有相关断言，JSON Assertion
     * 在Assert JSON path.exists中像json提取器那样写出对应的key值路径，勾选match as regular expressions再在ExpectedValue中写入正则表达式即可判断；如果是固定值则勾选Additionally assertvalue即可

### 监听器（Listener）
* 用于对测试结果数据进行处理和可视化展示的一系列元件。图形结果、查看结果树、聚合报告等都是
  * "用表格察看结果"：显示的是每一个请求信息
  * "聚合报告"： 每个请求的各种计算参数


### 插件
* 除了上面常用的组件，有时候还需额外的
  * JMeter Plugins安装，参考[jmeter3.3—插件管理器的安装](https://www.cnblogs.com/beginner-boy/p/7806344.html)