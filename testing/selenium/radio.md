# ��ѡ��
* ����Ǳ�Ԫ��
```
 <input type="radio">
```

### ���ò���
1. ѡ��ѡ��
   1. �ҵ�Ԫ��
   2. ���
```
 footballItem=self.driver.find_element_by_xpath("//input[@value='football']")
 footballItem.click()
```
2. ��һ�鵥ѡ��Ľ���ѡ��
   1. ��ȡ��ѡ�������ѡ��
   2. ͨ��ѭ��ѡ����Ҫ��value����
```
 hobbyList=self.driver.find_elements_by_xpath("//input[@name='hobby']") #ʹ��elements
 for myhobby in hobbyList��
   if(myhobby.get_attrbute("value")=="football"):
     if not radio.is_selected(): # ����û�б�ѡ��
	    radio.click()
        self.assertEqual(radio.get_attribute("value"),"orange")   
```   