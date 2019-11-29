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
2. mysql max_allowed_packet 设置过小导致记录写入失败
  * 错误提示
  ```
    工作中经常需要导入或者导出较大的sql文件。导出时一般没问题，但在导入到其它Mysql库中，可能会出现
	“Packet for query is too large (1706 > 1024). 
	You can change this value on the server by setting the max_allowed_packet' variable. ”
	或者程序（如python里面executemany）在插入大量数据时出现"MySQL server has gone away"。
	这些错误都可能是Mysql的mysql max_allowed_packet默认值太小。
  ```  
  * 修改配置
	1. 查看当前值大小【默认为4M】
	```
	 show variables like '%max_allowed_packate%'
	```
	2. 修改大小
	```
	 set global max_allowed_packet = 100*1024*1024*10 #100M
	```