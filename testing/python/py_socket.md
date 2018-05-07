# socket通信
### 概念
* 网络上的两个程序通过一个双向的通信连接实现数据的交换，连接的一端称为一个socket
* 打开一个Socket需要知道目标计算机的IP地址和端口号，再指定协议类型即可。

### 服务器端
```
import socket

server = socket.socket()
server.bind(("localhost", 10000))  # 注意服务器是绑定.bind()方法，要传入的是一个元组，包括IP地址或域名，以及端口号
server.listen(5)  # 这里代表等待连接的最大数量
while 1:
    con, addr = server.accept()  # accept是一个阻塞事件，等待连接，同时有两个返回值。
    con.send("连上了".encode())  # 发送接收都需要编码解码，默认是utf8
    clinetMsg = con.recv(1024).decode()
    print(clinetMsg)
    con.close()

```

### 客户端
```
import socket
client = socket.socket()
client.connect(('localhost', 10000))
serverMsg = client.recv(1024).decode()
print(serverMsg)
content = input("请输入内容")
client.send(content.encode())
client.close()
```

### 聊天室的demo
* 运用了多线程来开启服务
#### 服务器端
```
import socket
from threading import Thread

import time


class server:
    def __init__(self):
        server = socket.socket()
        server.bind(('127.0.0.1', 9999))
        server.listen(5)
        self.server = server
        self.li = []  # # 是客户端对象的列表
        self.di = {}  # 添加用户名和ip地址
        self.get_con()

    def get_con(self):  # 循环的等待客户端的连接，成功返回连接成功
        while 1:
            con, addr = self.server.accept()
            data = '连接成功!,请输入昵称'
            con.send(data.encode())  # 通知已经链接进来的的客户端
            Thread(target=self.get_msg, args=(con, self.li, self.di, addr)).start()  # 启动子线程
            self.li.append(con)  # 添加已经连接的客户端对象到列表，方便群发消息

    def get_msg(self, con, li, di, addr):
        name = con.recv(1024).decode()  # 接收客户端发来的昵称
        di[addr] = name  # 向字典里添加当前的昵称并和addr对应
        while 1:  # 循环监听客户端的消息
            try:
                redata = con.recv(1024).decode()
            except Exception as e:
                # print("提示::", e)
                self.close_client(con,addr)
                break;
            if(redata.upper()=="QUIT"):
                self.close_client(con,addr)
                break;
            # 只有接收到recv后才会执行下面的操作
            print(di[addr] + '于' + time.strftime('%x') + ':\n' + redata)
            for i in li:  # 广播在客户列表里的成员，每一个人都要发送一遍
                # 通过字典查询，得到当前发送消息的客户端名称，并和消息连接
                i.send((di[addr] + '于' + time.strftime('%x') + ':\n' + redata).encode())

    def close_client(self, con,addr):
        self.li.remove(con)
        # print("client:", self.li)
        con.close()
        print(self.di[addr] + "已经离开了")
        for k in self.li:
            k.send((self.di[addr] + "已经离开了").encode())


if __name__ == "__main__":
   server()
```

#### 客户端
```
import socket
from threading import Thread


class client:
    def __init__(self):
        client = socket.socket()
        client.connect(('127.0.0.1', 9999))
        self.client = client
        self.begin_thread()

    def begin_thread(self):
        Thread(target=self.send_msg).start()
        Thread(target=self.recv_msg).start()

    def send_msg(self):
        while 1:
            i = input('输入：')
            self.client.send(i.encode())
            if (i.upper() == "QUIT"):
                self.client.close()
                break

    def recv_msg(self):
        while 1:
            try:
                print(self.client.recv(1024).decode())
            except:
                exit()


if __name__ == "__main__":
    client()

```

###
repr() //将其他类型转成字符串
eval() //将字符串转为原来的类型

json.dumps() //在前端使用
json.loads()