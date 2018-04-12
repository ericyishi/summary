# 常用命令
### 帮助类命令
* 查看帮助【man】
  ```
   man 需要查看的命令
  ```
  * 需要安装yum install man
  * 退出：q

### 文件和目录
* 切换命令【cd】
  ```
   cd 跳转的路径
  ```
  * cd 目录
  * cd 目录/目录
  * cd / 返回系统根目录
  * cd ..  返回上一级
  * cd ~  返回当前用户的主目录【使用pwd显示的是/root目录】
  * cd -  返回前一次跳转的目录
* 显示当前路径【pwd】


* 查看【ls】
  ```
   ls
  ```
  * ls展示的能看到的文件和目录文件
  * ls -a 能够查看所有的目录和文件 文件前面有一个.代表是隐藏文件
  * ls -l 可以查看文件详细信息【☆简写为ll】
  * ls -lh可以让文件大小带上单位【简写为 ll -h】

* 文件夹操作
  1. 创建文件夹【mkdir】
     ```
      mkdir 文件夹名
     ```
     * mkdir -p a/b/c 直接创建多级目录

  2. 删除文件夹【rmdir】
     ```
      rmdir 文件夹名
     ```
    * 不带参数的只能删除空目录！
    * rmdir -p a/b/c (加参数-p 递归删除子文件夹以及内容)


* 文件操作
  1. 创建文件【touch】
      ```
       touch 文件名
      ```
      ```
       touch 1.txt
      ```
  2. 删除文件【rm】
      ```
       rm 文件名
      ```
      * 删除前有提示
      * rm -f 文件名。强制删除，不带询问。
      * rm -rf 文件夹【这种方式可以删除文件夹，而且是不带询问的递归删除】【**谨慎使用**】
      ```
        错误操作：
        rm -rf /*【删除了系统下的所有文件！！！！】
        (本来是希望删除当前文件下所有文件 rm -rf ./*)
        以及 rm * .txt [*和.txt之间空格分开了。相当于就是rm *，会把当前所有以及子目录都删掉]
      ```
      * 为了避免上面操作发生，实际工作中有几种情况能避免（不同公司不一样）
        * 1. 加上参数 -i,表示删除前要询问
        * 2. 禁止使用rm命令，将要删除的内容移动到/temp文件下，但这种方式需要重启系统后才会清除
        * 3. 移动到一个指定的目录下，这个目录的内容会定期清除。
  3. 复制文件【cp】
      ```
         cp 文件 路径
      ```
     * **注意**这个命令是不支持文件夹的复制的
     * 除了复制功能外，还能够实现复制+重命名功能
      ```
        cp t1.txt t2.txt
        //将t1.txt 文件复制一份，并命名为t2.txt
      ```
   4. 移动文件（重命名文件）【mv】
      ```
       //移动:
         mv 文件名 目录
       //重命名：
         mv 文件名 目录/文件名
      ```
      * mv bb.txt b/bb.txt //将bb.txt 移动到b文件夹下
      * mv bb.txt b/cc.txt //将bb.txt 移动到b文件夹下并重命名cc.txt
      * mv  cc.txt dd.txt //直接将cc.txt重命名为dd.txt
   5. 查看文件内容
       1. cat、more、less
          ```
           cat|more|less 文件名
          ```
          * cat
            * 显示文件的所有内容【但对于内容很多的文件，是无法翻页的】
          * more
            * 分页显示【但不能回头看，到底了直接退出】
            * 按回车显示下一行
            * 看空格显示下一页
            * 能够以%形式显示当前内容的进度
          * less
            * 分页显示【灵活好用，常用】
            * 可以“上下键”来上下看，按q退出
            * 按“空格”下翻页
            * 按“b”上翻页
        2. tail（☆ ☆ ）
           ```
            tail 文件名
           ```
          * 用于查看正在改变内容的日志文件
          * 查看一个文件的尾部内容
          * 动态查看文件内容
            ```
             tail -f catalina.2016-06-04.log
            ```
          * 参数-n 用于指定显示内容的行数，默认是10行
            ```
             tail -n 20 1.txt
             //查看1.txt末尾20行内容
            ```
          * ctrl+C 退出
        3. head
          * 跟tail命令类似，但只是查看文件开头的内容，默认10行。
            ```
             head -n 5 1.txt
             //显示1.txt文件的前5行数据
            ```
   6. 编辑文件【vi|vim】
      * vim是vi的升级版本【需要单独下载】
      * 都是用于编辑普通文本
      * 三种模式：指令模式(Command Mode）、文本输入模式（Input Mode）、末行模式（Last line Mode）
        * 三种方式的切换：
          1. 指令模式(Command Mode） 下输入  a、i、o进入文本输入模式(Input Mode)
             * i当前位置前插入
             * o在所在行下一行插入
             * a下一个字符插入
          2. 文本输入模式(Input Mode) 下**按ESC**进入指令模式（Command Mode）
          3. 指令模式(Command Mode）下**输入冒号:后**进入末行模式（Last line Mode）
             * q 不保存退出
             * q! 强制退出
             * wq 保存退出
          4. 末行模式（Last line Mode）下指令错误则返回指令模式(Command Mode）
   7. 在内容中查找信息【grep】（☆）
         ```
          grep 查找关键字 文件名

          //关键字是区分大小写的
          //没有查到是不会返回结果的，直接是返回命令行；如果有多个都一起返回来
          //高亮找到的关键字使用参数--color，是两个“-”
         ```
         * grep lang yum.conf //在yum.conf中查找“lang ”返回，结果所在行的所有内容
         * grep lang yum.conf --color //在yum.conf中查找“lang ”并且高亮出来
         * grep lang yum.conf --color -A5 //在yum.conf中查找“lang ”所在行并且返回其后五行
         * grep lang yum.conf --color -B5 //在yum.conf中查找“lang ”并且返回其前五行
         * grep lang yum.conf --color -B5 -A5 //在yum.conf中查找“lang ”并且返回前后五行
    8. 查找文件【find】
        ```
	     find 文件名
	    ```
         * 默认情况下只能在当前路径下查找某文件
	     * 如果要指定路径，需要跟上参数-name
	        ```
	          find 路径 -name 文件名
	        ```
            ```
	         find / -name redis.conf
	         //从根目录下开始查找
	        ```
	     * 模糊查询，必须需要使用英文引号包裹起来！
	        ```
	          find / -name "*.txt"
	        ```
	     *  查找/root 目录下的所有子目录，目录需要跟参数-type d
	        ```
	         find /root -type -d
	        ```
	     * 以某字符结尾
	        ```
	         find / -name "*_dev.txt"
	        ```
	     * 包含某字符
	        ```
	         find / -name "*al*.txt"
	        ```
    9. 创建快捷方式【ln】
       ```
         ln 文件名 快捷方式名
       ```
       ```
         ln 1.txt shortcut
         // 给1.txt创建一个快捷方式
       ```
         * 上面不带参数的，默认下，创建一个备份文件，即使源文件不在，该备份文件里面也是有数据，能够输出的。
         * 带参数-s 类似window快捷方式，如果源文件不在，那么快捷方式无效。
    10. 计算字数【wc】
        ```
         wc 文件名
        ```
        ```
         wc 1.txt
         // 显示行数 单词数(按空格分隔算) 字符数【linux下，一个中文占三个字符，一行后的换行符占1个】
        ```
       * 除了上面的用法，还能够统计文件数
         ```
           find /root -name "*.*"  | wc -l
           //输出root下所有文件数目
         ```
### 打包和压缩文件
* 打包或解压【tar】（☆ ☆）
  * 打包或解压一个文件或目录
  * 常用参数：
     * -c创建一个新的tar文件
     * -v显示运行工程的信息
     * -f指定文件名
     * -z调用gzip压缩命令进行压缩
     * -t查看压缩文件的内容
     * -x解开tar文件
   * 参数常用组合：
     * -cvf：打包一个文件或目录
     * -czvf：打包并压缩一个文件或目录【压缩格式是gzip】
     * -xvf：解压或打开一个tar文件
     * -xzvf: 解压gzip文件
   * 打包格式:
     ```
      tar 打包后的文件名 打包文件1 打包文件2 ...
     ```
     ```
      tar -zcvf test2.tar.gz ./*
      //将当前目录下的所有文件打包并压缩成test2.tar.gz
     ```
   * 解压格式:
     ```
      tar 解压的文件名
     ```
     ```
      tar -xvf test1.tar
      //将test1.tar解压到当前目录
     ```
     * tar -xvf test1.tar -C b //将test1.tar解压到b目录**注意要有大写的-C参数才能解压到指定的目录去**

### 系统设置

* 清空命令行【clear】
  ```
   ctrl+L 或者 clear
  ```

* 取别名【alias】
  ```
    alias md=mkdir
      //给命令mkdir取一个新别名md为了方便使用
  ```
   * 这种配置只是临时有效，关闭当前的SSH链接后，再次SSH登录到控制台终端的时候，这些别名设置就失效了。永久有效需要单独设置

### 系统管理类
1. 显示系统时间【date】
   ```
     date -s "2017-11-28"
   ```
2. 显示文件系统的磁盘使用情况统计【df】
   ```
    df -h
   ```
    * 带参数-h 是指以可读的格式（带单位）友好的方式显示数据
3. 显示内存状态【free】
   ```
    free -h
   ```
4. 显示管理中执行的程序【top】
5. 正在运行的某个进程的状态 【ps】
   ```
    ps -ef 查看所有的进程
   ```
   * ps -aux 也可以查看所有的进程，只是显示的列不同。
   * ps -ef|grep ssh 在进程中查找ssh （☆）
6. 杀掉一个进程【kill】
   ```
    kill 进程号
   ```
   * kill 2868 //杀掉2868编号的进程
   * kill -9 2868 //强制杀掉2868编号的进程
7. 显示指定的目录或文件所占用的磁盘空间【du】
   ```
    du -h
   ```
8. 显示目前登录系统的用户信息【who】
   ```
    who
   ```
   * 返回的值在虚拟机中打开的终端的设备代号为tty1，利用secureCRT或者xshell连接的设备代号为pts/0，在虚拟机中利用命令kill -INT pid可以杀死secureCRT连接的进程。
9. 查看当前的主机名【hostname】
   ```
    hostname
   ```
   * 修改主机名的文件： /etc/sysconfig/network
10. 显示本机详细信息【uname】
   ```
    uname -a
   ```

### 网络通讯命令
1. 查看所有的网络设置【ifconfig】
   ```
    ifconfig
   ```
   * ifconfig 网卡名 ip地址 //修改ip
   * ifconfig 网卡名称 down：禁用网卡
   * ifconfig网卡名称 up：启用网卡
2. 查看网络是否通【ping】
   ```
     ping ip地址
    或
     ping 域名
   ```
   * Ctrl+C来退出
3. 监控TCP/IP网络，它可以显示路由表、实际的网络连接以及每一个网络接口设备的状态信息【netstat】
   ```
    netstat
   ```
   * netstat -an查看所有的端口号占用情况
   * [更多用法，查看网络](https://linux.cn/article-2434-1.html)

### 用户管理类
1. 查看当前有的用户
   ```
    cat /etc/passwd
   ```
2. 添加用户【useradd】
   ```
    useradd 用户名
   ```
   * 默认会在home目录下给一个用户创建一个目录
   * 要修改默认路径，加上参数-d
     ```
      useradd -d 路径  用户名
      useradd -d /usr/lee  lee
      // 在/usr路径下创建lee用户

     ```
3. 修改密码【passwd】
   ```
    passwd 一个已存在的用户名 回车输入密码
   ```
   * 必须要在root账号下修改
   * useradd与passwd 配套使用，因为添加了用户，该用户没有密码也是无法登陆的，所以需要系统管理员root就要设置密码
4. 删除用户【userdel】
   ```
    userdel 用户名
   ```
   * 默认只是删除用户，但不删除家目录
   * userdel -r 用户名【删除用户连带家目录一起删除】
   * 如果提示“ user 用户名 is currently logged in”,直接使用"userdel -rf 用户名" ,强制删除。
5. 切换用户【su】
   ```
    su - 用户名
   ```
   * 带不带参数-的区别:
     * su u1【切换到u1用户】
       ```
        切换后的结果：
        [u1@localhost root]$
       ```
     * su - u1【切换到u1用户，并且将环境也切换到u1用户的环境】（推荐写法）
       ```
        切换后的结果：
        [u1@localhost ~]$
       ```
     * su - root【切换为超级用户】

### 用户组
1. 查看系统中组信息
  ```
   less /etc/group
  ```
2. 查看用户所属组【id|groups】
  ```
   id 用户名
  或者
   groups 用户名
  ```
  * 一个用户肯定在一个用户组下，如果没有指定，那么就在它同名的用户组里。
3. 新增组【groupadd】
  ```
   groupadd 组名
  ```
  * useradd 用户名 -g 组名//将新增用户添加到用户组中
  * usermod -g 组名 用户名 //对于已存在的用户，添加到组中

4. 将用户移除用户组
  * 方式1【使用添加需要的组变向删除不要的组】：
     ```
      usermod -G 需要保留的组名1，需要保留的组名2 -g  需要保留的组名 用户名
      -G后面可以跟多个组，逗号隔开。
      -g后面只能用一个
     ```
  * 方式2
     ```
      gpasswd -d 用户名 组名
     ```
5. 删除组【groupdel】
   ```
    groupdel 组名
   ```
6. 修改组信息【groupmod】
   * 改组名
     ```
      groupmod -n 新组名 旧组名
     ```
7. 变更文件或目录所属用户和组【chown】
   * 需要超级管理员root身份来变更
    ```
     chown 用户名：所属组 文件名
    ```
    ```
     chown rick：rick aa.txt
     //变更aa.txt至Rick用户以及rick组下
    ```
     * 带上参数-R就可以将其子目录或文件一起变更所属用户和组了




### 权限管理
   1. 概念
    ![img](https://github.com/ericyishi/img-folder/blob/master/summary/backend/linux/permission.png)
    * rwx对应数字为421，0代表没有权限
    * 使用命令ll查看文件的权限
    * 第一位代表文件类型
      * 普通类型 -
      * 目录文件 d
    * 后面每三个为一组
      * 2-4位：当前用户
      * 5-7：所在组的权限
      * 8-10：其他用户的权限
    2. 变更文件或目录的权限【chmod】
      * 三种方式：
       * ①chmod 权限 文件名
           ```
             chmod 777 a.txt //所有用户都能读写执行a.txt文件
           ```
       * ②chmod u=rwx,g=rx o=rx a.txt  //给a.txt文件授权，当前用户可以读写执行，同组用户可以读、执行，其他用户可以读、执行。
       * ③除了上面的，方式，还可以使用“+”"-"符号加减权限。
           ```
	        chmod o-w a.txt //让其他用户不能写a.txt文件夹的权限
	       ```
	       ```
	         chmod g-rwx a.txt // 让所在组用户不能读写执行文件
	       ```
### 安装包管理
1. 显示所有安装的的包信息
   ```
    rpm -qa 
   ```
2. 查找指定的包
   ```
    rpm -qa|grep java
    //查看java的相关的包
   ```


### 其他
* 安装命令【yum】
  ```
   yum install 要安装的软件
  ```

* 下载资源【wget】
  ```
   wget 资源路径

   wget www.163.com //下载163.com网页
  ```
 * 重定向输出>和>>
   * \> 覆盖
      ```
        ifconfig >3.txt
        // 将ifconfig下的信息不在控制台打印出而在3.txt文件里输出
      ```
   * \>>  追加
      ```
       echo 哈哈哈 >> 1.txt
       //追加哈哈哈到1.txt中的最后
      ```
 * 命令执行控制&&
     * && 用于连续的命令操作
       ```
        mkdir -p aa/bb && cd aa/bb && touch 23.txt
       ```
 * 管道【|】
    * 将一个命令的输出作为另一个命令的输入
    * ifconfig | grep 192.168 //在ifconfig的结果中查找192.168字符串
    * ps -ef|grep ssh //在进程中查找ssh
      * 注意：ps -ef (查找所有进程，或者使用-aux,只是返回列的内容稍有不同)
    * ps -ef|grep 3306  //查找3306端口
    * grep 1234 /root/411/3.txt  | wc -l //查找/root/411/3.txt 文件中出现含有1234的内容的行的次数

