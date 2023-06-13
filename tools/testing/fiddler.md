# Fiddler
### 用途
* 程序将会把自己作为一个代理，所以的http请求在达到目标服务器之前都会经过fiddler，同样的，所有的http响应都会在返回客户端之前流经fiddler。
### 抓取https网页
* 设置步骤
  1. 下载证书生成器，并安装 https://telerik-fiddler.s3.amazonaws.com/fiddler/addons/fiddlercertmaker.exe
  2. 设置信任证书
      * 打开fiddler，点击Tools下的Options，然后点HTTPS选项卡，
      * 勾选Decrypt HTTPS traffic后，
      * 再点击Actions，信任证书（trust root certificate) 。
  3. 导出证书
      * 点击Tools>Options> HTTPS页面上
      * Actions，选第二个(Export root certificate to desktop)，
      * 操作导出证书文件至桌面，会在桌面上生成一个文件FiddlerRoot.cer。
  4. 导入证书到Chrome浏览器
      * 进入chrome浏览器，菜单栏，点设置，或直接地址栏输入：chrome://settings/
      * 点击左侧【隐私设置和安全性】，在右侧找到【管理证书】，并点击进入。
      * 将生成的cer文件导入进来
  5. 重启Chrome和Fiddler，此时还无法生效
  6. 重置证书
      * 再次运行fiddler，依次点击Tools下的Options，
      * 然后点HTTPS选项卡，再点击actions下的Reset All Certificates，
      * 重置证书。
  7. 重启浏览器和fiddler，发现已经可以打开https页面了(浏览器需开启代理，代理端口即为fiddler上配置的)。
### 增加请求方式列
* 设置步骤
  1. 在显示列右键，选择“cumstomize columns”
  2. 弹出框里面的，collection列选择“Miscellaneous”，field选择“requestMethod”，点击保存
  3. 此时显示列，就多了一行。RequestMethod列了。

### 注意事项
* 模拟post请求的时候，请求头要带上
  ```
   Content-Type: application/x-www-form-urlencoded
  ```
   * 使用了数据编码为名称/值对。这是标准的编码格式
   * ajax的POST请求的时候也需要带上。
* fiddler 抓取不到chrome浏览器的请求，可能是安装了代理，关闭代理设置即可：chrome://extensions/   
   
### 移动端
* 移动端抓包需要配置fiddler允许远程连接
  1. 点击Tools->Options->Connections，勾选allow remote computers to connect，默认监听端口为8888（Fiddler listens on 【8888】port就是端口号），若端口被占用可以设置成其他的。配置好后一定要重新启动fiddler。
  2. 手机上的操作：确保手机和电脑连接同一个网络，打开手机浏览器，输入http://ip:端口号，点击前往
  3. 前往之后会跳转到证书下载页，点击FiddlerRootcertificate下载证书
  4. 更改手机WiFi的代理。手机系统设置-无线网-点击高级，代理选择手动，主机名就是fiddler的电脑ip地址，端口号，就是fiddler的端口号，与浏览器中ip：端口号保持一致，点击确定即可。
  5. OK，开始操作手机吧，电脑fiddler中会显示一些http信息，成功
