# http协议
* HTTP是应用层协议，其底层协议实现是TCP/IP协议
* HTTP是无状态协议，所以需要使用session/cookie来维持其状态
* HTTP是单向通信，客户端有一个请求，服务端必有一个响应
* 响应码来看是否成功。1xx、2xx、3xx正常响应；4xx客户端错误；5xx服务端错误

### https协议
* 因为http是明文传输，所以安全性差
* https=http+SSL/TLS。HTTP负责正常的请求和响应。SSL/TLS负责加密和传输