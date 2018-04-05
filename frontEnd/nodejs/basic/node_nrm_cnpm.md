# nrm与cnpm
## nrm
#### nrm介绍
* nrm就是npm registry manager 也就是npm的镜像源管理工具
* 用于加速下载。有时候国外资源太慢，那么我们可以用这个来切换镜像源。
#### nrm安装
```
npm install -g nrm
```
#### 常用命令
* 用于展示所有可切换的镜像地址
  ```
  nrm ls
  ```
* 得到所有不同镜像的速度
  ```
  nrm test
  ```
* 切换镜像源
  ```
  nrm use taobao【切换至taobao镜像】
  ```
## cnpm
* 除了使用nrm改变镜像源以外，还可以是cnpm
### 安装方法
1. 输入以下命令
```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
2. 输入cnpm -v输入是否正常，这里肯定会出错。
```
cnpm -v
```
3. 添加系统变量path的内容
因为cnpm会被安装到xx\nodejs\node_global下，而系统变量path并未包含该路径。在系统变量path下添加该路径即可正常使用cnpm。
4. 以后使用npm的地方换成cnpm即可