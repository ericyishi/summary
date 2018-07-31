# 下拉列表元素的选择
### 导包
```
 from selenium.webdriver.support.ui import Select
```
### 使用
```
 #获取到select元素对象
 element=Select(self.driver.find_element_by_xpath("//select"))
```
* 获取默认元素的文本
  ```
   element.first_selected_option.text
  ```
  * **也可以使用**：element.all_selected_options[0].text
    * all_selected_options获取的是所有被选中项的对象组成的列表对象，因为单选下拉列表只有一个，所以可以使用all_selected_options[0]来表示。
    ```
	 self.assertEqual(element.all_selected_options[0].text,u"选项3")
	```
* 获取所有选择项的页面元素对象,返回是列表，下标从0开始
  ```
   all_options=element.options
  ```
### 选择option元素的几种方式
1. 通过序号
```
 # 选择第二个option元素[下标从0开始]
 if all_options][1].is_enabled() and not all_options[1].is_selected():
    element.select_by_index(1)
```
2. 根据显示的文本来选择
```
 element.select_by_visibile_text("选项三")
```
3. 根据value属性值value='option3'获取
```
  element.select_by_value("option3")
```
### 应用：断言单选项列表的选项值与预期一致
```
 # encoding=utf-8
import os
import unittest

from selenium import webdriver
from selenium.webdriver.support.select import Select


class MyTest(unittest.TestCase):
    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)
    def test_checkSelectText(self):
        nowpath=os.path.abspath(".")
        print(nowpath)

        url=u'..\html\selectOption.html'
        htmlpath=os.path.join(nowpath,url)
        print(htmlpath)
        self.driver.get("file:///"+htmlpath)
        select_ele=Select(self.driver.find_element_by_tag_name("select"))
        actualOption=select_ele.options
        expect_optionList=[u"苹果",u"橙子",u"香蕉"]
        actual_optionList=map(lambda option:option.text,actualOption) 
		# map()是 Python 内置的高阶函数，它接收一个函数 f 和一个 list，并通过把函数 f 依次作用在 list 的每个元素上，得到一个新的 list 并返回。
        print(actual_optionList) # [u'\u82f9\u679c', u'\u6a59\u5b50', u'\u9999\u8549']
        self.assertEqual(expect_optionList,actual_optionList) #断言的时候包括顺序
if __name__ == "__main__":
    unittest.main()
```  

### 多选下拉列表
```
 <select multiple=true>
```
1. 选中多个
```
 select_ele=Select(self.driver.find_element_by_tag_name("select"))
 select_ele.select_by_index(1)
 select_ele.select_by_visible_text("香蕉")
 select_ele.select_by_value("orange")
 # 这样就选择了三个选项
```
2. 取消选择
* 在前面三种选择的方式，将select换成deselect
```
  select_ele.deselect_by_index(1)
```	
3. 取消所有
```
 select_ele.deselect_all()
```
