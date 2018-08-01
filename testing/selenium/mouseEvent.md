
# 鼠标事件
* selenium.webdriver.ActionChains包是WebDriver针对python语言专门用于模拟鼠标操作事件的包，包括双击、悬浮、拖拽等

### 使用方法
* 需要导入包
  ```
   from selenium.webdriver import ActionChains
   或者写成:
   from selenium.webdriver.common.action_chains import ActionChains

  ```

* 使用方式
  ```
   ActionChains(driver).操作方法(定位的元素).perform()
  ```
  * **注意：**最后一定要使用perform()才有效果
### 常用方法
  * context_click() 右击
    * 点击以后配合其他命令一起使用
	   ```
	    # 鼠标右键选择粘贴的快捷键（p）
	    ActionChains(self.driver).context_click(searchBox).perform()
		ActionChains(self.driver).send_keys('p').perform()
		
	   ```
  * double_click() 双击
    ```
     action_chains=ActionChains(self.driver)
     action_chains.double_click(inputBox).perform()

    ```
  * click_and_hold()左键按下并保持
    ```
	 ActionChains(self.driver).click_and_hold(divBox).perform()
    ```	
	* 释放
	  ```
	    ActionChains(self.driver).release(divBox).perform()
	  ```
	  
  * drag_and_drop(source,target) 拖动
    ```
    source_element = driver.find_element_by_id("el1")
    target_element = driver.find_element_by_id("el2")
    ActionChains(driver).drag_and_drop(source_element, target_element).perform()
    ```
  * drag_and_drop_by_offset 拖拽位移
    ```
	 action_chains=ActionChains(self.driver)
	 for i in range(10):
       action_chains.drag_and_drop_by_offset(ele,10,10).perform()
	   # 执行10次，每次将元素向右和下移动10个像素
    ```	
  * move_to_element() 鼠标悬停
  * perform() 只有执行了前面的操作才有效

