# 主从配置
* 一个master可以拥有多个slave，一个slave又可以拥有多个slave，如此下去，形成了强大的多级服务器集群架构
* 从库默认是不允许写入数据的

### 配置
* 比如，将ip为192.168.1.10的机器作为主服务器，将ip为192.168.1.11的机器作为从服务器
##### 配置主机
* 在redis.conf文件里，设置主服务器的配置
```html
 bind 192.168.1.10
```
##### 配置从机
* 也是在其redis.conf文件里
* 注意：在slaveof后面写主机ip，再写端口，而且端口必须写
```html
 bind 192.168.1.11
 slaveof 192.168.1.10 6379  # 这句建立了绑定关系
```
##### 启动
* 主机
```html
 redis-cli -h 192.168.1.10
```
* 从机
```html
 redis-cli -h 192.168.1.11
```
##### 验证
* 在master上写数据
```html
 set myname world
```

* 在slave上读数据
```html
 get myname
```
