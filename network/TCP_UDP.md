# TCP、UDP
### TCP协议
1. 概念
   * 该协议在传输层
   * TCP（Transmission Control Protocol 传输控制协议）是一种面向连接的、可靠的、基于字节流的传输层通信协议
2. 特点
   * 面向连接的
   * 可靠的
     * TCP 实现可靠的传输协议，是靠 seq 确认完成的
     * 建立连接：三次握手【三次是保证双方互相明确对方能收能发的最低值】
       1. 建立连接时，客户端发送syn包(syn=j)到服务器，并进入SYN_SEND状态，等待服务器确认；
          ```
           [SYN]Seq=0
          ```
       2. 服务器收到syn包，必须确认客户的SYN（ack=j+1），同时自己也发送一个SYN包（syn=k），即SYN+ACK包，此时服务器 进入SYN_RECV状态；
          ```
           [SYN,ACK]Seq=0 Ack=1
          ```
       3. 客户端收到服务器的SYN＋ACK包，向服务器发送确认包ACK(ack=k+1)，此包发送完毕，客户端和服务器进入 ESTABLISHED状态，完成三次握手。
          ```
           [ACK]Seq=1 Ack=1
          ```
     * 断开连接：四次挥手【四次的原因是当Server端收到FIN报文时，很可能并不会立即关闭SOCKET，所以只能先回复一个ACK报文】
       * 由于TCP连接是全双工的【可以同时（瞬时）进行信号的双向传输，例如打电话；半双工：对讲机】，因此每个方向都必须单独进行关闭。这原则是当一方完成它的数据发送任务后就能发送一个FIN来终止这个方向的连接。收到一个 FIN只意味着这一方向上没有数据流动，一个TCP连接在收到一个FIN后仍能发送数据。首先进行关闭的一方将执行主动关闭，而另一方执行被动关闭。
       1. TCP客户端发送一个FIN，用来关闭客户到服务器的数据传送。
          ```
           [FIN,ACK] Seq=36 Ack=1
          ```
       2. 服务器收到这个FIN，它发回一个ACK，确认序号为收到的序号加1。
          ```
           [ACK] Seq=1,Ack=37
          ```
       3. 服务器关闭客户端的连接，发送一个FIN给客户端。
          ```
           [FIN,ACK]Seq=1 Ack=37
          ```
       4. 客户端发回ACK报文确认，并将确认序号设置为收到序号加1。
          ```
           [ACK]Seq=37 Ack=2
          ```
   * 基于字节流的

### UDP协议
1. 概念
   * 与TCP一样，该协议在传输层
   * UDP（User Datagram protocol 用户数据包协议）非面向连接的协议
2. 特点
   * 无连接
   * 不可靠【适用于不要求数据全部都收到场景，例如视频直播】
3. python代码
   1. 服务端
      ```
        import socket
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.bind(("localhost", 9999))
        data, addr = s.recvfrom(1024)
        print(addr) # ('127.0.0.1', 58675)
        print(data.decode(), addr) # 你好 ('127.0.0.1', 58675)
        s.sendto(data,addr)
      ```
   2. 客户端
      ```
        import socket

        c = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        c.connect(("localhost", 9999))
        c.send("你好".encode())
        print(c.recv(1024).decode()) # 你好
        print("结束")
        c.close()

      ```

   * 先开服务器端，当客户端运行后，两边都结束
   * 注意，每次运行，服务器端接收到的客户端的地址中端口是变化的
