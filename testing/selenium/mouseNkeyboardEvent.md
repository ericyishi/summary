# 鼠标与键盘事件
### 鼠标事件
* 需要导入包
  ```
   from selenium.webdriver import ActionChains
   或者写成:
   from selenium.webdriver.common.action_chains import ActionChains

  ```
*  selenium.webdriver.ActionChains包是WebDriver针对python语言专门用于模拟鼠标操作事件的包，包括双击、悬浮、拖拽等
* 使用方式
  ```
   ActionChains(driver).操作方法(定位的元素).perform()
  ```
  * 最后一定要使用perform()才有效果
* ActionChains类提供的操作方法
  * context_click() 右击
  * double_click() 双击
    ```
     action_chains=ActionChains(self.driver)
     action_chains.double_click(inputBox).perform()
    ```
  * drag_and_drop(source,target) 拖动
    ```
    source_element = driver.find_element_by_id("el1")
    target_element = driver.find_element_by_id("el2")
    ActionChains(driver).drag_and_drop(source_element, target_element).perform()
    ```
  * move_to_element() 鼠标悬停
  * perform() 只有执行了前面的操作才有效

### 键盘事件
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
* 常用方法
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
