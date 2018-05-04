# 截图与时间戳
* webdriver提供了截图的方法
  ```
   driver.get_screenshot_as_file(“保存图片地址以及文件名”)

  ```
  * 通常是在测试用例失败的时候截图，可以使用case名加时间戳的方式命名
    ```
     # 将当前时间转换成字符串的时间戳
      import time
      timeStamp=time.strftime("%Y%m%d%H%M%S",time.localtime())
      driver.get_screenshot_as_file(r"C:\Users\Administrator\Desktop\%s.jpg"%timeStamp)
    ```
    * 截取当前框口，并以时间戳来命名保存