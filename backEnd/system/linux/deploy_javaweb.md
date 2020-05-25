# 部署Javaweb项目（使用tomcat）
### 1.先安装jdk，并配置环境变量
  1. 下载对应的jdk。
  2. 放入linux目录中（例如：/opt）
     * 可以使用xshell也可以使用FileZilla
     * lrzsz使用，使用后，直接往xshell里面拖（先用xshell定位到要移动到的目录文件下，然后直接拖）
       ```
        yum install lrzsz
       ```
  3. 配置环境变量
     1. 修改/root/.bash_profile
        ```
         vi /root/.bash_profile
        ```
		* 有的地方是配在/etc/profile（这里优先级最高，是全局的，用于整个系统的所有用户）
     2. 增加内容
        ```
         打开文件在PATH= $PATH:$HOME/bin  和 export PATH之间新增 3行如下命令：
         JAVA_HOME="/opt/jdk1.7.0_67"
         PATH=$PATH:$JAVA_HOME/bin
         CLASSPATH=$CLASSPATH:$JAVA_HOME/lib

         *注意/opt/jdk1.7.0_67是java的存放路径
        ```
     3. 保存退出。使文件内容生效
        ```
         source .bash_profile
        ```
     4. 检验是否生效。
       * 任何一个地方输入java，看是否有java的提示信息。
	   * 输入：echo $JAVA_HOME；返回jdk的安装路径
	   
### 2.安装tomcat
  1. 同样使用xshell，传入tomcat的安装文件
  2. 解压
     ```
      tar -xzvf apache-tomcat-7.0.70
     ```
  3. 启动tomcat
     ```
      cd apache-tomcat-7.0.70
      cd bin
      sh startup.sh// 就能启动了startup.sh或者使用命令./startup.sh
     ```
  4. 检验是否成功
     ```
      服务器IP地址:8080
     ```
     * 访问不了，可能是服务器防火墙没有关
       * 要么使用防火墙关闭命令
         ```
          service iptables stop # 关闭防火墙
          service network restart # 重启服务
         ```
       * 要么在防火墙中添加规则，放行8080端口
         ```
		       /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT  //8080端口放行
		       /etc/rc.d/init.d/iptables save    //将该设置添加到防火墙的规则中
         ```
     * 端口冲突
  5. 部署war包
     * 将打包好的war放置到webapps路径下（例如 123.war）。
     * 然后重启服务
     ```
      bin目录下
      sh shutdown.sh //关闭服务
      sh startup.sh //启动服务
     ```
  6. 访问
     ```
      服务器系统的ip地址:8080/123
     ```

### 3.安装数据库(mysql为例)
  1. 获取mysql YUM源
     * 进入mysql官网获取RPM包下载地址https://dev.mysql.com/downloads/repo/yum/
     * 选择对应版本下载
       ```
	     wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
       ```	  
     * 安装mysql源
       ```
         yum -y localinstall mysql57-community-release-el7-11.noarch.rpm
	   ```	 
     * 在线安装Mysql
       ```
	     yum -y install mysql-community-server
       ```	   

  2. 启动数据库服务
     ```
      systemctl start mysqld
     ```
	 * 设置开机启动
	 ```
	  systemctl enable mysqld
      systemctl daemon-reload
	 ```
  3. 修改root本地登录密码
     * mysql安装完成之后，在/var/log/mysqld.log文件中给root生成了一个临时的默认密码
	 * A temporary password is generated for root@localhost: LlpE1NruC2/o
       ```
	    # 查询方式：
        grep 'temporary password' /var/log/mysqld.log
	    # 方式2：进入编辑vim /var/log/mysqld.log,再底行模式：
	    :/temporary password 

       ```
	 * 倘若没有获取临时密码，则删除原来安装过的mysql残留的数据
	   ```
	    rm -rf /var/lib/mysql
	   ```
	   * 再次启动服务
	      ```
		   systemctl start mysqld
		  ```
  4. 将数据库内容放入linux目录下【比如/opt/miniStore.sql】

  5. 进入mysql
     ```
      mysql -u root -p  回车
      输入密码进入
     ```
	 * 注意-p后面如果直接输入密码，不要跟空格，否则会认为输入的是数据库名，会报错
	 ```
	  ERROR 1049 (42000): Unknown database 'XXX'
	 ```
	 * 修改密码【备注 mysql5.7默认密码策略要求密码必须是大小写字母数字特殊字母的组合，至少8位.下面演示重新设置这种策略】
	   * 修改策略（将策略要求置为LOW，长度要求置为1）
		   ```
			 set global validate_password_policy=0;
			 set global validate_password_length=1;
		   ```
	   * 修改密码
	      ```
		    ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';
		  ```
		  
  6. 创建数据库【库名与开发环境的保持一致】
     ```
      create database ministore;
     ```
  7. 使用数据库
     ```
      use ministore;
     ```
  8. 导入数据，提示成功
     ```
      source /opt/miniStore.sql
     ```
  9.  查看用户表，使用用户名、密码登录
  10. 设置允许远程登录
      * Mysql默认不允许远程登录，我们需要设置下，并且防火墙开放3306端口；
	    ```
		  GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
		```
  11. 退出Mysql,开放3306端口；
      ```
	   exit;
	  ```
      ```
	    firewall-cmd --zone=public --add-port=3306/tcp --permanent
        firewall-cmd --reload
      ```	  
