# 工作常见问题
### 配置类
1. localhost可以访问数据库，但是ip却无法连接的问题
   * 原因：Mysql 默认是没有开启这个权限的(只允许使用 host:localhost,或者 host:127.0.0.1)，如果想用  host:192.168.1.* ,来访问mysql ,需要手动开启这个权限
   ```
    1.打开cmd窗口，进入MySql安装的bin目录

    2.执行命令登录数据库,之后会出现一行要你输入密码的

        mysql -u root -p



    3.执行以下命令分配新用户：

        grant all privileges on *.* to '用户名'@'IP地址' identified by '密码';


    4.执行完上述命令后用下面的命令刷新权限

       flush privileges;


    5.之后关闭mysql服务，然后启动mysql服务，大功告成

 
   ```