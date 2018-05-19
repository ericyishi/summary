# webservice框架
### 分类
1. 基于SOAP
   * 我们常说webservice主要是指的基于SOAP的
   * 是一种可以接收从Internet或者Intranet上的其它系统中传递过来的请求，轻量级的独立的通讯技术。是通过SOAP在Web上提供的软件服务，使用WSDL文件进行说明，并通过UDDI进行注册。
2. REST风格
   * 现在更普遍
### 基于SOAP
#### 三个角色
1. Web Service 提供者
   * 可以发布 Web Service，并且对使用自身服务的请求进行响应，WebService 的拥有者，它会等待其他的服务或者是应用程序访问自己
2. Web Service 请求者
   * Web Service功能的使用者，它通过服务注册中心也就是 Web Service中介者查找到所需要的服务，再利用 SOAP 消息向 Web Service 提供者发送请求以获得服务。
3. Web Service 中介
   * 也称为服务代理，用来注册已经发布的 Web Service 提供者，并对其进行分类，同时提供搜索服务，简单来说的话，Web Service 中介者的作用就是把一个Web Service 请求者和合适的 Web Service 提供者联系在一起，充当一个管理者的角色，一般是通过 UDDI 来实现。
