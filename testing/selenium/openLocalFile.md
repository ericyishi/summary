# 本地文件的打开
* driver.get()不但接收url参数，同时也能接收本地路径
  * 当然可以使用绝对路径传入，但是这样移植性不强
* 但是需要用到python中的os模块
```
 import os
 from selenium import webdriver
 driver=webdriver.Chrome()
 filePath='file:///'+os.path.abspath(r"./html/test.html")
 driver.get(filePath)
```