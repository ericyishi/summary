# gitbash安装与使用


#### 1.从Git官网下载windows版本的git：
<a href="http://git-scm.com/downloads" target="_blank">官网下载</a>
* 但是通常会很慢，可以使用淘宝镜像下载：https://npm.taobao.org/mirrors/git-for-windows/


#### 2.一般使用默认设置即可：一路next，git安装完毕！


#### 3.配置环境变量
  * 但是如果这时你打开windows的cmd，在里面打git命令会提示“不是内部或外部命令，也不是可运行的程序”，想要直接在windows的cmd里使用git命令要多加如下两步:
    1. 找到bin文件夹。
       * 如：D:\Program Files\Git\bin
    2. 找到git-core文件夹。
       * 如：D:\Program Files\Git\mingw32\libexec\git-core
       * 32位路径为：D:\Program Files\Git\mingw32\libexec
    3. 配置环境变量
       * 右键“计算机”->“属性”->“高级系统设置”->“环境变量”->在下方的“系统变量”中找到“path”->选中“path”并选择“编辑”->将上面找到的bin和git-core路径复制到其中->保存并退出
                 注：“path”中，每个路径之间要以英文输入状态下的分号——“;”作为间隔
    4. 在就可以在cmd里尽情的使用git了~

#### 4.与github关联
   * 上传至github，为了方便不每次都输入用户名和密码，所以需要配置一下
     1. 打开Git Bash查看电脑上是否已经存在SSH密钥：
        ```
            输入 cd ~/.ssh
        ```
     2. 若显示无法找到该文件则要创建新的ssh key;
        ```
            输入 ssh-keygen -t rsa -C "your_email@youremail.com"
        ```
        * 然后提示输入 passphrase（密码），输入两次（**可以不输直接两次Enter**），然后会在 .ssh 目录生产两个文件：id_rsa和id_rsa.pub
     3.  登录github。打开setting->SSH keys，点击右上角 New SSH key，把生成好的公钥id_rsa.pub放进 key输入框中，再为当前的key起一个title来区分每个key。
#### 5.git clone的速度慢解决办法
##### 原因  
   * git clone特别慢是因为github.global.ssl.fastly.net域名被限制了。
   * 只要找到这个域名对应的ip地址，然后在hosts文件中加上ip–>域名的映射，刷新DNS缓存便可。
##### 解决  
   * 在网站 https://www.ipaddress.com/ 分别搜索：
     ```buildoutcfg
      github.global.ssl.fastly.net
      github.com
     ```
   * 打开hosts文件
     * Windows上的hosts文件路径在C:\Windows\System32\drivers\etc\hosts
     * Linux的hosts文件路径在：sudo vim /etc/hosts 
     ```buildoutcfg
      151.101.185.194 github.global-ssl.fastly.net
      192.30.253.112 github.com
     ```
   * 保存更新DNS
     * Winodws系统的做法：打开CMD，输入ipconfig /flushdns
     * Linux的做法：在终端输入sudo /etc/init.d/networking restart
#### 6.配置user信息
   * 最小配置，为了方便区分上传者(配置user.name与user.email)
     ```
        // 配置user.name
       git config --global user.name 'your_name'
       //配置user.email
       git config --global user.email "your user email"

     ```
   * 如果是修改
     ```
       //修改user.name
       git config --global --replace-all user.name "your user name"

       //修改user.email
       git config --global --replace-all user.email"your user email"

     ```
      * 默认作用域是local、一般用global、还有system

   * 查询配置
     ```
      git config --global --list
     ```
