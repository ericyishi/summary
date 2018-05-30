# HTTP、HTTPS
### HTTP
#### 1. 概念
* 该协议位于应用层
* HTTP 是基于 TCP/IP 协议的应用层协议
#### 2. 版本发展
  1. HTTP/0.9
     * 规定了客户端和服务器之间的通信格式
     * 规定端口80
     * 只有get请求
     * 服务器只能回应HTML格式的字符串
  2. HTTP/1.0
     * 任何格式的内容都可以发送
     * 增加POST和HEAD请求
     * HTTP请求和回应的格式改变。增加头信息（HTTP header）
     * 增加状态码、内容编码等
     * 缺点：每个TCP连接只能发送一个请求，再请求还需要重新建立连接
  3. HTTP/1.1【目前】
     * 允许复用TCP连接【长连接：Connection: Keep-alive】，但是同一个TCP连接里面，所有的数据通信是按次序进行的。服务器只有处理完一个回应，才会进行下一个回应。要是前面的回应特别慢，后面就会有许多请求排队等着。这称为"队头堵塞"（Head-of-line blocking）。
     * 为了避免这个问题，只有两种方法：一是减少请求数，二是同时多开持久连接。这导致了很多的网页优化技巧，比如合并脚本和样式表、将图片嵌入CSS代码、域名分片（domain sharding）等等。
#### 3. URL组成部分
```
 http://www.aspxfans.com:8080/news/index.asp?boardID=5&ID=24618&page=1#name
```
* 协议
```
 http://
```
* 主机名
```
www.aspxfans.com
```
* 端口
```
:8080
```
* 资源位置
```
/news/index.asp
```
* 参数部分【非必需】
```
?boardID=5&ID=24618&page=1
```
* 锚点【非必需】
  * 加上锚点可以指定到页面上的某个元素
```
#name
```

#### 4. HTTP请求响应模型
* HTTP由请求和响应构成，是一个标准的客户端服务器模型（B/S）
* HTTP协议永远都是客户端发起请求，服务器回送响应
* HTTP是一个无状态的协议
  * 意味着当一个客户端向服务器端发出请求，然后服务器返回响应(response)，连接就被关闭了，在服务器端不保留连接的有关信息.
  * 如果浏览器或者服务器在其头信息加入了这行代码Connection:keep-alive，TCP连接在发送后将仍然保持打开状态，于是，浏览器可以继续通过相同的连接发送请求。保持连接节省了为每个请求建立新连接所需的时间，还节约了网络带宽。
    * 通常一个页面，包含了多个HTTP请求，但是使用Connection:keep-alive，只使用一个TCP连接就够了。
    * HTTP1.1中，client和server都是默认对方支持长连接，不需要需要手动header中设置connection：none
* HTTP工作过程
  1. 浏览器: 输入URL
  2. DNS域名解析: 域名与IP映射
  3. 建立TCP连接: TCP三次握手
  4. 发送HTTP Request: 请求信息
  5. Web服务器接收请求
  6. 应用服务器处理业务逻辑
  7. 关闭TCP连接: 请求响应完成
  8. 浏览器: 渲染响应页面

#### 5. HTTP特点
* 简单快速
* 灵活
* 无连接
  * HTTP的无连接是指整个网站的浏览过程, 业务性架构无连接，但请求与响应是依赖于TCP有连接的
* 无状态
  1. 指协议对事务处理没有记忆能力，缺少状态意味着如果后续处理需要前面的信息，则它必须重传，这样导致每次连接传输量增大
     * 解决：cookie、session
       * 1，存放位置：session在服务器端，cookie 在客户端（浏览器）
       * 2，session 默认被存在在服务器的一个文件里（不是内存）
       * 3，session 的运行依赖 session id，而 session id 是存在 cookie 中的，也就是说，如果浏览器禁用了 cookie 【也可以由前端存放在localstorage中】
       * 5，用户验证这种场合一般会用 session



#### 6. HTTP请求方式
 1. GET
 2. POST
    * POST CONTENT-TYPE四种常见的提交数据方式
      1. application/x-www-form-urlencoded
         * 数据被编码为名称/值对。这是标准的编码格式。
      2. multipart/form-data
         * 数据被编码为一条消息，页上的每个控件对应消息中的一个部分。
         * 使用表单上传文件时，必须让 form 的 enctyped 等于这个值
      3. application/json
         * 用来告诉服务端消息主体是序列化后的 JSON 字符串，特别适合 RESTful 的接口
      4. text/xml
         * 使用广泛，不过还是使用json更简单
 3. PUT 修改内容
 4. DELETE
 5. OPTIONS 查询服务器的性能或者查询与资源相关的选项和需求
 6. HEAD 返回没有内容，只有报文头
 7. TRACE 请求服务器返回收到的信息，主要用于测试和诊断
 8. CONNECT

#### 7. HTTP 状态码
* 1XX: 服务器收到信息，客户应当继续发送请求的其余部分
* 2XX: 成功，操作被成功接收并处理
* 3XX: 重定向
* 4XX: 客户端错误
* 5XX: 服务器端错误
### HTTPS
* 安全的HTTP
* 通过 HTTPS发送的请求和响应在发送前都会被加密。这意味着如果一个恶意的黑客监听 HTTP 通信，他得到的信息都是加密的和无用的。
* HTTPS在HTTP下面提供了一个传输级的密码安全层—可以使用SSL，也可以使用其后继者——传输层安全(Transport Layer Security，TLS)。由于SSL和TLS非常类似，所以SSL来指代SSL和TLS
* https，客户端就会打开一条到服务器端口443(默认情况下)的连接

