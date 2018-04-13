# 使用虚拟机时的网络配置
* 我们常常无法连接网络，或者无法以域名的形式只能IP方式访问网络。这时候就需要对网络进行配置。
### 步骤
 1. 确保虚拟机网卡为桥接模式;
    ![img](https://github.com/ericyishi/img-folder/blob/master/summary/backend/linux/linuxConfigureNetwork1.png)
 2. 确保虚拟机编辑器为桥接模式，并设置为自动;
    ![img](https://github.com/ericyishi/img-folder/blob/master/summary/backend/linux/linuxConfigureNetwork2.png)
    
 3. 在linux命令中配置
    1. 关闭防火墙
      ```
        service iptables stop
      ```

      

    2. 重启网络服务
      ```
       service network restart
      ```
      

    3. 设置linux的ip【注意这里的IP需要与真机同网段cmd下ipcoinfig查询！】
      ```
       ifconfig eth0 172.11.0.220
      ```
    4. 设置默认网关
      ```
       route add default gw 172.11.0.1
      ```
    5. 【可选步骤】这一步是ping ip地址可以，但ping 域名不行的配置
       1.  编写网关文件
       ```
         vi /etc/resolv.conf
       ```
       2.  在文件末尾加上，改成网关ip
       ```
          nameserver 172.11.0.1
       ```
