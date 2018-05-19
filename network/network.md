# 计算机网络
### 七层协议与TCP/IP模型的对比
  <table>
   <thead>
    <tr>
      <th>OSI七层网络模型</th>
      <th>TCP/IP四层概念模型</th>
      <th>对应网络协议</th>
    </tr>
   </thead>
   <tbody>
   <tr>
       <td>应用层</td>
       <td rowspan="3">应用层</td>
       <td>HTTP、TFTP, FTP, NFS, WAIS、SMTP</td>
   </tr>
   <tr>
       <td>表示层</td>
       <td>Telnet, Rlogin, SNMP, Gopher</td>
   </tr>
   <tr>
       <td>会话层</td>
       <td>SMTP, DNS</td>
   </tr>
   <tr>
       <td>传输层</td>
       <td>传输层</td>
       <td>TCP, UDP</td>
   </tr>
   <tr>
       <td>网络层</td>
       <td>网络层</td>
       <td>IP, ICMP, ARP, RARP, AKP, UUCP</td>
   </tr>
    <tr>
       <td>数据链路层</td>
       <td rowspan="2">数据链路层</td>
       <td>FDDI, Ethernet, Arpanet, PDN, SLIP, PPP</td>
   </tr>
   <tr>
       <td>物理层</td>
       <td>IEEE 802.1A, IEEE 802.2到IEEE 802.11</td>
   </tr>
   </tbody>
  </table>

* [OSI参考模型协议](sevenOSI.md)
   * 传输层
       * [常用端口](port.md)

### 常用协议
* [TCP_UDP](TCP_UDP.md)
* [IP](IP.md)