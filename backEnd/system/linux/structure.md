# 文件结构
1. /
* 根目录

2. /bin

* 做为基础系统所需要的最基础的命令就是放在这里。比如 ls、cp、mkdir等命令；功能和/usr/bin类似，这个目录中的文件都是可执行的，普通用户都可以使用的命令。

3. /boot
* Linux的内核及引导系统程序所需要的文件，比如 vmlinuz initrd.img 文件都位于这个目录中。在一般情况下，GRUB或LILO系统引导管理器也位于这个目录；启动装载文件存放位置，如kernels,initrd,grub。一般是一个独立的分区。

4. /dev
* 一些必要的设备,声卡、磁盘等。还有如 /dev/null. /dev/console /dev/zero /dev/full 等。

5. /etc
* 系统的配置文件存放地. 一些服务器的配置文件也在这里；比如用户帐号及密码配置文件；
```
/etc/opt:/opt对应的配置文件

/etc/X11:Xwindows系统配置文件

/etc/xml:XML配置文件
```

6. /home

* 用户工作目录，和个人配置文件，如个人环境变量等，所有的账号分配一个工作目录。一般是一个独立的分区。

7. /lib

* 库文件存放地。bin和sbin需要的库文件。类似windows的DLL。

8. /media

* 可拆卸的媒介挂载点，如CD-ROMs、移动硬盘、U盘，系统默认会挂载到这里来。

9. /mnt

* 临时挂载文件系统。这个目录一般是用于存放挂载储存设备的挂载目录的，比如有cdrom 等目录。可以参看/etc/fstab的定义。

10. /opt

* 可选的应用程序包。

11. /proc

* 操作系统运行时，进程（正在运行中的程序）信息及内核信息（比如cpu、硬盘分区、内存信息等）存放在这里。/proc目录伪装的文件系统proc的挂载目录，proc并不是真正的文件系统，它的定义可以参见 /etc/fstab 。

12. /root

* Root用户的工作目录

13. /sbin

* 和bin类似，是一些可执行文件，不过不是所有用户都需要的，一般是系统管理所需要使用得到的。

14. /tmp

* 系统的临时文件，一般系统重启不会被保存。

15. /usr

* 包含了系统用户工具和程序。
```
/usr/bin：非必须的普通用户可执行命令

/usr/include：标准头文件

 /usr/lib:/usr/bin/ 和 /usr/sbin/的库文件

 /usr/sbin:非必须的可执行文件

/usr/src:内核源码

/usr/X11R6:X Window System, Version 11, Release 6.
```

16. /var
* 放置系统执行过程中经常变化的文件，如随时更改的日志文件/var/log