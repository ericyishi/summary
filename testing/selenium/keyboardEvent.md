# 键盘事件
### 使用方式
* 需要导入包
  ```
   from selenium.webdriver.common.keys import Keys
   或者
   from selenium.webdriver import Keys
  ```
* 使用方式
  ```
   driver.find_element_by_id("kw").send_keys(Keys.BACK_SPACE)
   # 输入一个回车键
   driver.find_element_by_id("kw").send_keys(Keys.CONTROL,'a')
   # 全选输入框的内容
  ```
### 常用方法
  * send_keys(Keys.BACK_SPACE) 删除键
  * send_keys(Keys.SPACE) 空格键
  * send_keys(Keys.TAB) TAB键
  * send_keys(Keys.ESCAPE) ESC回退键
  * send_keys(Keys.ENTER) ENTER回车键
  * send_keys(Keys.CONTROL,'a') 全选
  * send_keys(Keys.CONTROL,'c') 复制
  * send_keys(Keys.CONTROL,'x') 剪切
  * send_keys(Keys.CONTROL,'v') 粘贴
  * send_keys(Keys.F1) 键盘F1
