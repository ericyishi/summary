# 复选框
```
 <input type="checkbox">
```
### 常用操作
1. 选中复选框
```
 footballItem=self.driver.find_element_by_xpath("//input[@value='football']")
 footballItem.click()
 self.assertTrue(footballItem.is_selected())
```
2. 取消选中
```
 if footballItem.is_selected():
    footballItem.click()
	self.assertFalse(footballItem.is_selected())
```
3. 全选
```
 hobbyList=self.driver.find_elements_by_xpath("//input[@name='hobby']")
 for hb in hobbyList:
   if not hb.is_selected(): # 如果状态没有选中，则勾选
      hb.click()
```