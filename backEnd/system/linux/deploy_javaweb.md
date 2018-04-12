# 部署Javaweb项目（使用tomcat）
### 1.先安装jdk，并配置环境变量
  1. 下载对应的jdk。
  2. 放入linux目录中（例如：/opt）
     * 可以使用xshell也可以使用FileZilla
  3. 配置环境变量
     1. 修改/root/.bash_profile
        ```
         vi /root/.bash_profile
        ```
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
      sh startup.sh// 就能启动了startup.sh
     ```
  4. 检验是否成功
     ```
      服务器IP地址:8080
     ```
     * 访问不了，可能是服务器防火墙没有关
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
  1. 下载mysql相关包
     ```
      yum install myql mysql-server
     ```
  2. 启动数据库服务
     ```
      service mysql start;
     ```
  3. 设置mysql超级管理员账号
     ```
      mysqladmin -u root password "1234"
     ```
  4. 将数据库内容放入linux目录下【比如/opt/miniStore.sql】

  5. 进入mysql
     ```
      mysql -u root -p  回车
      输入密码进入
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