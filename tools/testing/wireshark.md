# wireshark
### 概念
* 用来获取网络数据封包，包括http,TCP,UDP，等网络协议包
* wireshark使用pcap network library来进行封包捕捉。Lipcap（Linux）或者Winpcap（Windows）。windows平台下，在安装wireshark的时候你就会发现会提示你安装winpcap，当然，如果你已经安装过了就没有这个提示了。
* winPcap(Windows Packet Capture)是Windows平台下的链路层网络访问工具，其目的在于为Windows应用程序提供访问网络底层的能力。
  * winPcap功能:
    * 获得网卡设备列表及其高级信息
    * 打开一个网卡适配器并将其设置成混杂模式
    * 捕获数据包
    * 设置过滤器
    * 将数据包存储为文件并处理离线文件
    * 发送数据包
    * 收集网络通信流量的统计信息
* 是对**网卡**进行监听，而fiddler只是相当于代理，对http或https协议进行监听。
### 过滤命令
1. 协议过滤
   * 例如输入TCP,只显示TCP
2. IP过滤
   * 源地址过滤 ip.src==192.168.10.116
   * 目标地址过滤 ip.dst==192.168.10.108
3. 端口过滤
   * tcp.port==80 端口为80的tcp协议
   * tcp.srcport==80 只显示TCP协议的源端口为80的
4. HTTP模式过滤
   * http.request.method=="GET",只显示HTTP的GET请求
5. 逻辑运算符【AND/OR/||/&&】
   * tcp.port == 80 || udp.port == 80