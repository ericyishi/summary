# gitbash安装与使用


#### 1.从Git官网下载windows版本的git：
<a href="http://git-scm.com/downloads" target="_blank">官网下载</a>



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