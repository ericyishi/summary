# monkey server
### 概述
* 是官方文档里没有提及的知识
* 可以在设备启动一个服务端，让客户端远程连接服务端进行操作
### monkey server启动与连接 
* 启动Monkey Server
  ```
   # cmd中输入：
   adb shell monkey --port 1080 &
  ```
* 客户端连接Monkey Server
  ```
    # 再开一个cmd中输入：
   adb forward tcp:1080 tcp:1080 # 端口映射
   telnet 127.0.0.1 1080  # 连接服务器
  ```
  * 注意：win7的telnet功能默认是关闭，手动打开就可以正常使用
  * 如何进入Telnet什么都无法输入，使用ctrl+]即可
### 主要命令
* touch [down|up|move][x][y]
* press [keycode]
* sleep
* getvar
* type  