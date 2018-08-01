# iframe/frame框的切换
* 对于页面里有iframe/frame框的webdriver是定位不到的，必须要切换。
### 切换
* 使用driver.switch_to.frame()
  * 使用索引
    ```
	 driver.switch_to.frame(0) # 索引从下标0开始，进入第一个frame
	```
  * 这种方式默认可以直接传入表单的id或者name
    ```
     # driver.switch_to.frame("frame1")  # 2.用id来定位
     # driver.switch_to.frame("myframe")  # 3.用name来定位
    ```
  * 如果上面默认方式定位不到，那么可以使用8大定位方式，定位到元素传入即可
    ```
     driver.switch_to.frame(driver.find_element_by_tag_name("iframe"))  # 4.用WebElement对象来定位
    ```

### 切回
* 完成了frame框中操作后，我们还需要切换主页面。
* 可以使用的方法
  1. switch_to.parent_content() # 跳出当前一级iframe，注意：有时操作完iframe它就关闭了页面，也使用切换才能操作原来页面。但是必须使用下面的方法进行跳回。
  2. switch_to.default_content() # 进入多级iframe，使用这个直接跳出最外层frameset。
  
### 建议
* 老版本会使用：switch_to_frame()与switch_to_default_content()【不推荐】
* **推荐**使用switch_to.frame()和switch_to.default_content() 

### 应用：获取所有的frame并操作其中指定的一个frame
```
 frameList=self.driver.find_elements_by_tag_name("frame")
 for frame in frameList:
   self.driver.switch_to.frame(frame)
   if u"中间" in self.driver.page_source:
     # 如果找到包含关键字，那么进行以下操作
     p=self.driver.find_element_by_xpath("//p")
     self.assertEqual(u"这是中间frame页面上的文字",p.text)	 
	 self.driver.switch_to.default_content()
	 break
   else:
     self.driver.switch_to.default_content()
      # 如果没有找到也需要退出，否则下次循环是要报错的	 
```
  