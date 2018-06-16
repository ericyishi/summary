# 加载驱动

### 注意事项
* Selenium3不再像selenium2默认支持firefox浏览器，所以同样需要加载驱动。

### 加载方式
```
 driver=webdriver.Firefox(executable_path='c:\\geckodriver')
```
* 需要下载，指定驱动路径即可
* 除了上面显示通过executable_path指明方式以外，还可以新建一个放驱动文件的文件夹(D:\\project\\driver),将其添加至环境变量中去

### 常见问题
1. 如果安装ff是自定义路径，可能找不到Firefox.exe文件来启动
* 解决办法：
  * 在加载驱动之前增加一句：
```
   firefoxBin = os.path.abspath(r"C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
   os.environ["webdriver.firefox.bin"] = firefoxBin
```
* 加入环境变量中

2. 如果报错“WebDriverException: Cannot find firefox binary in PATH.”
* 解决办法：
```
 # 脚本顶部导入FirefoxBinary模块
 from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
 
 # 修改启动浏览器的代码
 binary=FirefoxBinary(r"C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
 driver=webdriver.Firefox(firefox_binary=binary,executable_path='c:\\geckodriver\\geckodriver.exe')
```