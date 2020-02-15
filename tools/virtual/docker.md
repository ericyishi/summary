# Docker虚拟容器技术
### 概念
* docker是一种linux容器技术。容器有效的将由单个操作系统挂管理的资源划分到孤立的组中，以便更好的在组之间平衡有冲突的资源使用需求。可简单理解为一种沙盒 。每个容器内运行一个应用，不同的容器之间相互隔离，容器之间也可以建立通信机制。容器的创建和停止都十分快速，资源需求远远低于虚拟机。
* Docker 是一个开源的应用容器引擎。Docker本身不是容器，只是用于创建容器的工具。


### 优势
1. 更高效利用系统资源。因为不需要硬件虚拟以及操作系统等开销，所以相对于传统虚拟机技术，一个配置主机，可以运行更多数量的应用
2. 提供一致环境。
3. 启动速度快
4. 方便部署和迁移。Build once，run everywhere

### 概念
* 镜像（image）
  * Docker的镜像概念类似于虚拟机里的镜像，是一个只读的模板，一个独立的文件系统，包括运行容器所需的数据，可以用来创建新的容器。
  * 注：镜像是只读的，可以理解为静态文件。
* 容器（container）
  * 由Docker镜像创建的运行实例。Docker容器类似虚拟机，可以支持的操作包括启动，停止，删除等。每个容器间是相互隔离的，容器中会运行特定的应用，包含特定应用的代码及所需的依赖文件。
  * 注：相对于镜像来说容器是动态的，容器在启动的时候创建一层可写层作为最上层。
* 仓库（repository）
  * Docker 仓库是用来包含镜像的位置，Docker提供一个注册服务器（Register）来保存多个仓库，每个仓库又可以包含多个具备不同tag的镜像。Docker运行中使用的默认仓库是 Docker Hub 公共仓库。
  
### 安装
0. 如果旧版本需要卸载
```
  yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
```
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

5. 启动docker服务【如果要是用docker确保服务已经启动】
```
 systemctl start docker
```

6. 查看docker信息
```
 docker info
```
* 如果能正常打印Docker相关信息则安装成功

### 常用命令
1. 查询镜像【默认就是从docker hub上】
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
* 下面方式直接交互式方式运行镜像然后进入容器【docker run -i -t 镜像名 /bin/bash】
```
 docker run centos /bin/echo "hello"
 run代表使用centos镜像运行一个容器，并在容器中执行命令/bin/echo "hello"
```
* 退出交互式命令行，输入：exit。但是这样退出容器也会关闭


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

11. 启动一个已经存在的容器
```
 docker start #hash
```
* 关闭容器docker stop #hash
* 重启容器docker restart #hash

12. 进入一个已经启动的容器
* docker attach [container_id]
* 可以再容器内运行的命令：docker exec -ti [container_id] /bin/bash
* 这样方式进入按ctrl+D退出不会关闭容器

13. 复制内容到容器中【需要先挂载】
* docker cp 宿主机的文件路径 容器#hash:存放在容器中路径位置
```
 docker cp  /opt/myfile/1.txt f9f5041f4e00:/usr/local/tomcat/webapps/mydocker/1.txt
```

### 常见软件部署步骤
#### 以tomcat为例
1. 远端仓库（docker hub）上查询tomcat镜像
```
 docker search tomcat
```
2. 下载tomcat镜像
```
 docker pull tomcat
```

3. 查看本地镜像
```
 docker images|grep tomcat
```

4. 运行容器
```
 docker run --name mytomcat -d -p 8083:8080 -v /opt/myfile:/usr/local/tomcat/webapps/mydocker tomcat
```
* \-\-name为自定义容器名字
* \-d 代表使用后台模式运行，运行后返回容器id
* \-p 宿主机端口:容器端口 将容器端口 映射到宿主机的端口上
* \-v 宿主机的文件夹绝对路径:容器的文件夹的绝对路径 文件挂载。宿主机的文件路径映射到容器中
* 注意：如果容器内部修改或删除文件，宿主机对应的文件也会相应改变，因为他们指向的是同一个文件。

5. 验证
* 例如在宿主机下面放一个1.txt文件
*通过浏览器访问：宿主机的ip:8083/mydocker/1.txt就能访问到内容
  * 注意：ip和端口是宿主机的，后面资源路径则是docker下tomcat的

### 私有仓库搭建
* 官方的Docker hub是一个用于管理公共镜像的好地方，我们可以在上面找到我们想要的镜像，也可以把我们自己的镜像推送上去。但是，有时候，我们的使用场景需要我们拥有一个私有的镜像仓库用于管理我们自己的镜像。这个可以通过开源软件Registry来达成目的。
* 安装**Docker Registry**，目前其核心的功能组件仍为**负责镜像仓库的管理**。
* 非常适合用来构建私有的镜像注册服务器。官方仓库中也提供了Registry的镜像，因此用户可以通过**容器运行**和源码安装两种方式来使用Registry。
1. 基于容器安装运行
* 基于容器的运行方式十分简单，只需要一条命令：
```
 $ docker run -d -p 5000:5000 --restart=always --name registry registry:2.1
```
 * 此时会到远端去下载，并运行该镜像。启动后比较关键的参数是**指定配置文件**和**仓库存储路径**。
   ```
    Registry默认的配置文件为/etc/docker/registry/config.yml，因此，通过如下命令，可以指定使用本地主机上的配置文件（如/home/user/registry-conf）。
	$ docker run -d -p 5000:5000 \
	--restart=always \
	--name registry \
	-v /home/user/registry-conf/config.yml:/etc/docker/registry/config.yml \
	registry:2
	此外，Registry默认的存储位置为/var/lib/registry，可以通过-v参数来映射本地的路径到容器内。
	例如下面的例子将镜像存储到本地/opt/data/registry目录。
	$ docker run -d -p 5000:5000 --restart=always --name registry \
	-v /opt/data/registry:/var/lib/registry \
	registry:2
   ```
2. 验证
```
 http://192.168.0.107:5000/v2/
``` 
* 如果页面上出现一个{}，则说明安装成功，因为此时没有任何镜像文件

3.查看自定义仓库的镜像和镜像的tag名
* 查看自定义仓库的镜像
	```
	  curl http://127.0.0.1:5000/v2/_catalog
	```
* 镜像的tag名
	```
	  curl http://127.0.0.1:5000/v2/镜像名/tags/list
	```
### 制作镜像dockerfile文件
* 在Docker中创建镜像最常用的方式，就是使用Dockerfile。Dockerfile是一个Docker镜像的描述文件，我们可以理解成火箭发射的A、B、C、D…的步骤。Dockerfile其内部包含了一条条的指令，每一条指令构建一层，因此每一条指令的内容，就是描述该层应当如何构建。
* 以下面例子为例：例如可以把java项目的war放在tomcat镜像里面去。新制作成一个镜像文件，基于tomcat镜像，把war包一同放进去
* 步骤：
	1. 编写dockfile文件，通过文件构建一个镜像
	   * vi dockerfile
	     ```
		   FROM 基于要打的镜像文件名
		   ADD 要添加的文件 镜像中要存放的路径
		 ```
		 ```
		   FROM tomcat
			ADD mytest.war /usr/local/tomcat/webapps
		 ```
		 * 基于本地的tomcat制作镜像文件，将当前目录下的mytest.war文件打入到docker中/usr/local/tomcat/webapps路径下
		 * **注意：**dockerfile中引用的文件只能存在与dockerfile所在目录的上下级，最好同目录
	2. 为构建的镜像
	   * docker build -t 新镜像名:版本号 .
	     ```
		   docker build -t tomcatwithmytest:v1 .
         ```
          * 注意最后有个点，代表使用当前路径的 Dockerfile 进行构建 
		  * 如果不写版本号（docker build -t tomcatwithmytest .）则默认为latest	
		  * 镜像名字只支持小写
		  * 构建好后，输入docker images就能看到刚才新建的镜像
	3. 为镜像打tag
	   * 要上传镜像到私有仓库，需要在镜像的 tag 上加入仓库地址：
	     ```
		  docker tag tomcatwithmytest 127.0.0.1:5000/tomcatwithmytest:v1
		 ```
	    
	4. 推送制作好的镜像到仓库
	    ```
		 docker push 127.0.0.1:5000/tomcatwithmytest:v1
		```
		 * 如果要从自定义仓库拉镜像，只需将push换成pull就好
### docker compose工具
		 
### 更多
* 参考：https://yeasy.gitbooks.io/docker_practice/