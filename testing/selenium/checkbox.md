# ��ѡ��
```
 <input type="checkbox">
```
### ���ò���
1. ѡ�и�ѡ��
```
 footballItem=self.driver.find_element_by_xpath("//input[@value='football']")
 footballItem.click()
 self.assertTrue(footballItem.is_selected())
```
2. ȡ��ѡ��
```
 if footballItem.is_selected():
    footballItem.click()
	self.assertFalse(footballItem.is_selected())
```
3. ȫѡ
```
 hobbyList=self.driver.find_elements_by_xpath("//input[@name='hobby']")
 for hb in hobbyList:
   if not hb.is_selected(): # ���״̬û��ѡ�У���ѡ
      hb.click()
```