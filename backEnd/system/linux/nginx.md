# nginx
### 概念
* 它可以做服务器，类似概念mysql服务器，tomcat服务器。
* 是一款轻量级的Web 服务器/反向代理服务器及电子邮件（IMAP/POP3）代理服务器软件
* 特点：占用内存少，并发能力强
* 用途：反向代理 负载均衡 动静分离

1. 正向代理
* 需要我们用户,手动的设置代理服务器的ip和端口号
* 科学上网就运用了正向代理技术
* 正向代理，代理用户

2. 反向代理
* 用于代理服务器的,用户不需要设置如何访问反向代理服务器
* 用户访问的是反向代理服务器，而实际原始资源服务器用户是无法直接访问的，设置了防火墙，只允许反向代理服务器访问
* 由nginx决定将用户的请求转发给内部的哪台服务器来处理
* 反向代理，代理服务器

3. 负载均衡
* 原理就是数据流量分摊到多个服务器上执行，减轻每台服务器的压力，多台服务器共同完成工作任务，从而提高了数据的吞吐量。
* 这个分流的操作，就是nginx这类软件做的事

4. 集群
* 集群是一组相互独立的、通过高速网络互联的计算机,它们构成了一个组,并以单一系统的模式加以管理。
* 很多服务器放在一起由nginx统一管理

5. 动静分离
* 将静态的资源放到反向服务器,节省用户的访问时间

### 用nginx在window上搭建一个集群
* 步骤：
  1. 在F盘新建两个目录 tomcat1 tomcat2，里面分别放入两个tomcat，并把一个相同的war分别放入其中
  2. 修改tomcat2的中的tomcat的端口【/conf/server.xml】 例如：所有的端口在tomcat1的端口上+10，大概有5处需要改
  3. 此时按照以往做法，是需要访问这两个项目，是需要在地址栏分别输入url地址才能访问的
     ```
      localhost:8080/test
      localhost:8090/test
     ```
  4. 对外提供一个路径，就需要使用nginx了
  5. 解压windows版本的nginx，双击nginx.exe 即可运行
  6. 设置集群
      1. 打开/conf/ nginx.conf
      2. 在http{}添加下面内容
         ```
                upstream server_test{
		        server 127.0.0.1:8080 weight=2;
		        server 127.0.0.1:8090 weight=4;
	            }
         ```
         * server_test是随便取的名字，后面proxy_pass需一样即可
         * weight增加权重，来控制访问几率

      3. 在location / 下添加了反向代理
         ```
          location/{
           proxy_pass http://server_test
          }
         ```
         * 如果有域名，只需在server {}下的server_name修改为域名即可
  7. 关闭（最好在任务管理器上关闭），重启 nginx.exe
  8. 浏览器访问，输入：localhost/test，即可访问了

* 注意：session共享的问题
  * 请求负载过程中会话信息不能丢失，那么需要在多个tomcat中session需要共享
  * 解决方式1：
    * 只能在window下好用
    * 利用web容器本身的session共享策略来配置共享。
    * 这种方式tomcat下性能低，但是weblogic好用。tomcat这种方式存在很大的缺陷，主要因为是依靠广播方式来实现的session复制，会浪费很多带宽导致整个网络反映缓慢。
    * 操作：
      1. 修改tomcat的server.xml 支持共享
         * 将<Engine name="Catalina" defaultHost="localhost">标签下的下面内容的注释去掉
             ```
              <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster"/>
             ```
             * Cluster集群的意思
             * 使用这样方法配置的集群会将Session同步到所在网段上的所有配置了集群属性的实例上(此处讲所在网段可能不准确，是使用Membership 的address和port来区分的。tomcat集群的实例如果在Membership配置中有相同的address和port值的tomcat被分到同一个集群里边。他们的session是相互共享的，同一个session的集群被称为一个cluster。可以配置多个cluster，但是cluster和cluster之间的session是不共享的)。也就是说如果该广播地址下的所有Tomcat实例都会共享Session，那么假如有几个互不相关的集群，就可能造成Session复制浪费，所以为了避免浪费就需要对节点多做点设置了
               ```
                 <Cluster className="org.apache.catalina.ha.tcp.SimpleTcpCluster">
                        <Channel className="org.apache.catalina.tribes.group.GroupChannel">
                            <Membership className="org.apache.catalina.tribes.membership.McastService"
                                address="228.0.0.4"
                                port="45564"
                                frequency="500"
                                dropTime="3000"/>
                        </Channel>
                    </Cluster>
               ```
                * 加了一个Channel，里面包了个Membership，咱们要关注的就是membership的port属性和address属性，不同的集群设置不同的port值或address值，从目前的使用来看，基本上是隔离开了。
      2. 修改每个**项目**的配置文件 web.xml中添加一个节点
         * 只需要在<web-app节点下添加这个节点<distributable/>就可以了
          ```
           <distributable/>
          ```
          * 有了这二步就实现了Tomcat的集群和Session的共享了，启动这两个tomact
  * 解决方式2:
    * 可以将session的id放入redis中
  * 解决方式3：
    * 这种方式简单容易
    * 保证一个ip地址永远的访问一台web服务器,就不存在session共享问题了
      * 在nginx的配置文件nginx.conf中，upstream中添加 ip_hash;
        ```
        upstream server_test{
		        server 127.0.0.1:8080 weight=2;
		        server 127.0.0.1:8090 weight=4;
		        ip_hash;
	            }

        ```
        * 每个请求按访问ip的hash结果分配，这样每个访客固定访问一个后端服务器，可以解决session的问题。
### 用nginx在linux上搭建一个集群
* 步骤：
  1. 先将 nginx上传到linux上
  2. 解压nginx
  3. 需要先编译
     1. 先安装依赖包
        * GCC。安装nginx需要先将官网下载的源码进行编译，编译依赖gcc环境，如果没有gcc环境，需要安装
          ```
           yum install gcc-c++
          ```
        * PCRE。PCRE(Perl Compatible Regular Expressions)是一个Perl库，包括 perl 兼容的正则表达式库。nginx的http模块使用pcre来解析正则表达式，所以需要在linux上安装pcre库。
          ```
           yum install -y pcre pcre-devel
          ```
        * zlib。zlib库提供了很多种压缩和解压缩的方式，nginx使用zlib对http包的内容进行gzip，所以需要在linux上安装zlib库。
          ```
           yum install -y zlib zlib-devel
          ```
        * openssl。OpenSSL 是一个强大的安全套接字层密码库，囊括主要的密码算法、常用的密钥和证书封装管理功能及SSL协议，并提供丰富的应用程序供测试或其它目的使用。nginx不仅支持http协议，还支持https（即在ssl协议上传输http），所以需要在linux安装openssl库。
          ```
           yum install -y openssl openssl-devel
          ```
     2. 编译
        * 进入nginx-1.8.0文件夹
        * 执行./configure命令，就开始编译了
          ```
           ./configure
          ```
  4. 安装nginx
     1. 执行 make,安装
        ```
         make
        ```
     2. 执行make install
        ```
         make install
        ```
  5. 启动
     1. 返回nginx-1.8.0上一级
        ```
         cd ..
        ```
     2. 进入sbin文件夹,下有个nginx文件
        ```
         cd sbin
        ```
     3. 启动
        ```
         ./nginx
        ```
  6. 将端口号80 放行
     ```
          /sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
		   # 将该设置添加到防火墙的规则中
		  /etc/rc.d/init.d/iptables save
     ```
  7. 配置集群【修改conf文件 和window下一样】


* 关闭nginx
  * 关闭命令：相当于找到nginx进程kill
    ```
     ./nginx -s stop
    ```
  * 退出命令：
    ```
     ./nginx -s quit
    ```
    * 等程序执行完毕后关闭，建议使用此命令。
  * 动态加载配置文件
    ```
     ./nginx -s reload
    ```
    * 可以不关闭nginx的情况下更新配置文件。