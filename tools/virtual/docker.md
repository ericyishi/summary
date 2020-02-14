# Docker虚拟容器技术
### 概念

### 安装
1. 安装一些必要系统工具
```
 yum install -y yum-utils device-mapper-persistend-data lvm2
```


2. 添加软件源信息
```
 yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

```
* 安装后会看到“repo saved to /etc/yum.repos.d/docker-ce.repo”/etc/yum.repos.d/docker-ce.repo为吧澳邨的位置

3. 更新yum缓存
```
 yum makecache fast
```

4. 安装docker-ce
```
 yum -y install docker-ce
```

5. 启动docker服务
```
 systemctl start docker
```

6. 查看docker信息
```
 docker info
```
* 如果能正常打印Docker相关信息则安装成功

### 常用命令
1. 查询镜像
* docker search 镜像名
```
 docker search centos
```
  
2.删除本地镜像【只能删除没有被容器占用的容器】
* docker rmi 镜像名
```
 docker rmi centos
```
  
3. 从远端仓库下载到本地
* docker pull 镜像名

4. 查看本地镜像列表
* docker images

5. 运行镜像
* docker run 镜像名
* 下面方式直接交互式方式进入容器【docker run -i -t 镜像名 /bin/bash】
```
 docker run centos /bin/echo "hello"
 run代表使用centos镜像运行一个容器，并在容器中执行命令/bin/echo "hello"
```
* 退出交互式命令行，输入：exit

6. 查看容器相关信息
* 查看启动的容器： docker ps
* 查看所有容器（含没有启动的）
  * docker ps -a

8. 停止正在运行的容器
* docker stop #hash

9. 容器的删除【只能删除已经停止运行的容器】
* docker rm #hash
* docker rm name

10. 查看容器运行的日志
* docker logs #hash

