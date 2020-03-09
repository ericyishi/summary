# ubuntu系统

### 常见问题
1. 没有设置root用户密码
   1. 输入命令 "sudo passwd root"，提示输入当前用户密码。
   2. 提示"输入新的UNIX密码"，此时输入要设置的root密码，提示"重新输入新的UNIX密码"此时再输入一次root密码
   3. 提示 "passwd：已成功更新密码"，运行命令 “su root”，提示“密码："此时输入刚刚设置的root密码回车，切换root用户成功。

2. 使用xshell无法登录
   * 默认没有装ssh
      ```html
        sudo apt-get install openssh-server
        ssh localhost（如果正常就表示安装成功）
      ```
3. filezilla、xshell root用户登录不上
   * 问题现象提示如下：
     ```html
      命令: Pass: **********
      错误: 认证失败。
      错误: 严重错误: 无法连接到服务器
     ```
   * 原因：Ubuntu拒绝root用户ssh远程登录
   * 解决方法：修改配置文件
     1. sudo vim /etc/ssh/sshd_config
     2. 找到并用#注释掉这行：PermitRootLogin prohibit-password
     3. 新建一行 添加：PermitRootLogin yes
     4. 重启服务：sudo service ssh restart

4. vi编辑模式不能正常使用键盘的问题
   * 问题现象：　使用vi打开文件后，输入命令i进入编辑模式，但使用方向键（上下左右）进行移动光标时不正常，会输入ＡＢ等的字母，删除键也不正常。
   * 原因：ubuntu默认安装的是vim-tiny版本
   * 解决方法：　安装vim-full版本
     1. 卸载vim-tiny，　命令：sudo apt-get remove vim-common
     2. 安装vim-full，命令：sudo apt-get install vim     
     
5. 切换国内的镜像源
   1. 复制镜像内容
      * [清华镜像]（https://mirrors.tuna.tsinghua.edu.cn/help/ubuntu/）查找对应的版本
      * 以下为16.04
      ```html
         # 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
         deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
         
         # 预发布软件源，不建议启用
         # deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
         # deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-proposed main restricted universe multiverse
      
      ```
   2. 配置文件
      ```html
        ubuntu:~$ cd /etc/apt
        ubuntu:/etc/apt$ sudo cp sources.list sources.list.bak
        ubuntu:/etc/apt$ vim sources.list  
      ```  
      * 底行模式输入: %d 为清空所有内容
   3. 更新源，使配置生效
      ```html
        ubuntu:~$ sudo apt-get update 
      ```   