# 64位AutoItLibrary的安装
### 说明
* 时会遇到一些控件是非标准控件，selenium无法操作，需要用AutoItLibrary来模拟WINDOWS GUI的操作，如模拟键盘按键、鼠标移动等。
### 安装步骤
1. pywin32的安装
   * 找到对应python的版本（https://github.com/mhammond/pywin32/releases）与python位数一致
2. 下载AutoItLibrary-1.1_x64包
   * http://code.google.com/p/robotframework-autoitlibrary/   
   * 管理员身份进入cmd，然后输入命令python setup.py install进行安装。
3. AutoIt v3软件
   * https://code.google.com/archive/p/robotframework-autoitlibrary/downloads
   * 安装时候注意选择64位！【use native x64 tools by default】   
### 注意事项
* 使用全英文路径安装，启用管理员身份进行打开   
   