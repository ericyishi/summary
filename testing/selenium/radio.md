# 单选框
* 针对是表单元素
```
 <input type="radio">
```

### 常用操作
1. 选中选项
   1. 找到元素
   2. 点击
```
 footballItem=self.driver.find_element_by_xpath("//input[@value='football']")
 footballItem.click()
```
2. 对一组单选框的进行选择
   1. 获取单选框的所有选项
   2. 通过循环选中想要的value的项
```
 hobbyList=self.driver.find_elements_by_xpath("//input[@name='hobby']") #使用elements
 for myhobby in hobbyList：
   if(myhobby.get_attrbute("value")=="football"):
     if not radio.is_selected(): # 并且没有被选中
	    radio.click()
        self.assertEqual(radio.get_attribute("value"),"orange")   
```   