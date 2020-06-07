# 常见问题
1. 如果安装ff是自定义路径，可能找不到Firefox.exe文件来启动
* 解决办法：
  * 在加载驱动之前增加2句，手动前加入环境变量中：
    ```
       firefoxBin = os.path.abspath(r"C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
       os.environ["webdriver.firefox.bin"] = firefoxBin
    ```
* 

2. 如果报错“WebDriverException: Cannot find firefox binary in PATH.”
* 解决办法：
   ```
    # 脚本顶部导入FirefoxBinary模块
    from selenium.webdriver.firefox.firefox_binary import FirefoxBinary
    
    # 修改启动浏览器的代码
    binary=FirefoxBinary(r"C:\Program Files (x86)\Mozilla Firefox\firefox.exe")
    driver=webdriver.Firefox(firefox_binary=binary,executable_path='c:\\geckodriver\\geckodriver.exe')
   ```

3. 加载带插件的浏览器（默认打开的是纯净版，不方便后期调试）
   1. 首先找到插件的路径
      1. 打开命令行 Windows+R
	  2. 输入 %APPDATA%\Mozilla\Firefox\Profiles\
	  3. 拷贝路径xxx.default文件夹路径
	     ```html
          C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default
         ```
	  4. 按下面代码方式添加，即可打开带插件的浏览器
          ```
          from selenium import webdriver
          
          pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
          profile = webdriver.FirefoxProfile(pro)
          driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver',firefox_profile=profile)
          driver.get('http://www.baidu.com')
          ```