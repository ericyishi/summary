# 安装
### 安装步骤
* 以ubuntu为例
1. 可以直接apt安装
   ```html
    sudo apt-get install mongodb
   ```
2. 安装好后确认
   ```html
    mongodb -version # 有版本输出即为安装成功：MongoDB shell version: 2.6.10
   ```
### mongod
* 服务端【端口27017】
```html
 #启动输入：mongod
```      
* 这种方式启动会占用一个服务窗口,也可以用下面方式【我没有成功】
  ```html
   sudo service mongod start
  ```
* 查看是否启动： pgrep mongod -l #打印出id进程就起好了
* 配置文件在： /etc/mongod.conf ，包括端口信息
### mongo
* 客户端
```html
#启动输入：mongo
```
* 默认进入test数据库
```html
root@ubuntu:~# mongo
MongoDB shell version: 2.6.10
connecting to: test
>

```
* 查看当前数据库名,输入:db
```html
> db
test

```
* 查看数据库信息:db.stats()
```html
> db.stats()
{
        "db" : "test",
        "collections" : 0,
        "objects" : 0,
        "avgObjSize" : 0,
        "dataSize" : 0,
        "storageSize" : 0,
        "numExtents" : 0,
        "indexes" : 0,
        "indexSize" : 0,
        "fileSize" : 0,
        "dataFileVersion" : {

        },
        "ok" : 1
}

```  
* 退出
```html
 ctrl+c或者exit
```  

### GUI工具
* robomongo
  * 解压后在bin目录下有个robomongo文件，即可运行
* windows下面也有个Robo 3T 的工具可以使用

