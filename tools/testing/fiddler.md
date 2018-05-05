# Fiddler
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
  7. 重启浏览器和fiddler，发现已经可以打开https页面了。



