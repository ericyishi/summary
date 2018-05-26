# web service框架
### SOA与webservice之间的关系
* SOA不是WebServices，WebServices是最适合实现SOA的技术

### webservice的定义
* webservice是一个平台独立、低耦合度、自包含的、基于可编程的web程序应用，可以使用开放的XML标准来描述、发布、发现、协调和配置这些程序，用于开发分布式的、互操作的应用程序。

### 分类
1. 基于SOAP(Simple Object Access Protocol,简单对象访问协议)
   * SOAP是基于XML在分散或者分布式的环境中交换信息的简单协议
   * SOAP能够与不同的底层传输协议（HTTP\SMTP\MIME）进行绑定，但常用是与HTTP协议绑定进行传输
   * 我们常说webservice主要是指的基于SOAP的
   * 是一种可以接收从Internet或者Intranet上的其它系统中传递过来的请求，轻量级的独立的通讯技术。是通过SOAP在Web上提供的软件服务，使用WSDL文件进行说明，并通过UDDI进行注册。
   * 所有访问都通过SOAP访问，用于WSDL定义的接口封装，通过UDDI进行目录查找，可以动态改变一个服务提供方而无需影响客户端的配置，外界客户端根本不必关心访问服务器端的实现。
2. REST风格
   * 现在更普遍
### 基于SOAP
#### 三个角色
1. Web Service 提供者
   * 可以发布 Web Service，并且对使用自身服务的请求进行响应，WebService 的拥有者，它会等待其他的服务或者是应用程序访问自己
      * WSDL(Web Services Description Language，网络描述语言)，用于描述WebService以及如何对它们进行访问。
2. Web Service 请求者
   * Web Service功能的使用者，它通过服务注册中心也就是 Web Service中介者查找到所需要的服务，再利用 SOAP 消息向 Web Service 提供者发送请求以获得服务。
     * 通过SOAP访问
3. Web Service 中介
   * 也称为服务代理，用来注册已经发布的 Web Service 提供者，并对其进行分类，同时提供搜索服务，简单来说的话，Web Service 中介者的作用就是把一个Web Service 请求者和合适的 Web Service 提供者联系在一起，充当一个管理者的角色，一般是通过 UDDI 来实现。
      * UDDI(Universal Description Discovery and Integration,通用描述、发现与集成服务)，需要单独安装
        * UDDI是一个独立于平台的框架，通过使用Internet来描述服务，发现企业，对企业服务进行集成
        * UDDI是一种用于存储有关Web Services信息的目录
### 公共web服务接口
* http://www.webxml.com.cn/zh_cn/index.aspx
