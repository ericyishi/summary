# Robot Framework
### 概念
* 是一个基于Python可扩展地关键字驱动的测试自动化框架
* 易于使用，采用表格式语法，统一测试用例格式；
* 扩展性很强。

### 支持的 Library
* 官网查看支持的库： http://robotframework.org/#libraries
* 内置库：
  1. 主要分标准库（Builtin），提供的关键字告诉你如何定义变量、数组和字典，打印信息，分支语句和循环等。 
  2. String :生成、修改和验证字符串的库
  3. Screenshot:提供关键字捕捉桌面截图
  4. XML：生成、修改和验证XML文件的库
  5. DateTime：日期和时间转换库
* 扩展库【第三方】：
  1. Web 自动化测试：SeleniumLibrary，Selenium2Library，Selenium2Library for Java、watir-robot 等。
  2. Windows GUI 测试：AutoItLibrary。
  3. 移动测试：Android library、iOS library、AppiumLibrary 等。
  4. 数据库测试：Database Library (Java)、Database Library (Python)、MongoDB library 等。
  5. 文件对比测试：Diff Library。
  6. HTTP 测试：HTTP library (livetest)、HTTP library (Requests)等。
### RF框架与unittest单元测试框架比较
* 相同点：
  1. setUp/tearDown
  2. 提供测试套件
  3. 测试运行
  4. 生成HTML测试结果
* 不同点：
  1. 语法：RF自建语法，unittest使用Python 语法
  2. 支持库：RF支持特定库，unittest支持python任意库  
### 安装
* 因为我们希望使用RIDE(robot IDE，编写 Robot Framework 的标准编辑器)，只支持python2的环境。
* 需要安装的文件：
  1. robot framework本身
     ```
      pip install robotframework==3.0.2
     ```
  2. wxPython
     * wxPython 是 Python 非常有名的一个 GUI 库，因为 RIDE 是基于这个库开发的，所以这个必须安装。必须是 **wxPython 2.8.12.1** 版本，RIDE 基于该版本开发。
     * 下载地址：https://sourceforge.net/projects/wxpython/files/wxPython/2.8.12.1/
  3. 安装 RIDE
     ```
      pip install robotframework-ride==1.5.2.1
     ```
  4. 使用web自动化扩展库Selenium2Library
     ```
      pip install robotframework-selenium2library==1.8.0 
     ```
  5. Selenium2Library必须基于Selenium2
     ```
      pip install selenium=2.53.6
     ```
### 运行RIDE
* 需切换至python2环境下才能正常启动，双击或者使用python ride.py
* 也可以使用批处理文件.bat文件，来运行ride.py
* 最简单办法，是配置环境变量时候，将python2写在前面。再将python3安装文件夹下的python.exe改名成python3.exe。这样默认python是2，要运行python3则写python3
* cmd下输入path可以查看环境变量的配置     
* pybot是执行RF脚本的命令     
