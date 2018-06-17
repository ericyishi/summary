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
  * 也可以使用：element.all_selected_options[0].text
  
* 获取所有选择项的页面元素对象,返回是列表，下标从0开始
  ```
   element.options
  ```
### 选择option元素的几种方式
1. 通过序号
```
 # 选择第二个option元素
 element.select_by_index(1)
```
2. 通过显示的文本来选择
```
 element.select_by_visibile_text("选项三")
```
3. 通过value属性获取
```
  element.select_by_value("option3")
```
  
