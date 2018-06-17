# 操作元素
### 常用属性
* element.size 返回元素的尺寸（标准盒模型的width、height）
  ```
    driver.find_element_by_id("kw").size
    #  {'height': 22, 'width': 500}
  ```
* element.text 获取元素文本

### 常用方法
* is_displayed()是否元素可见
  ```
   driver.find_element_by_id("kw").is_displayed()
   # true
  ```
  * 返回值布尔类型
* is_enabled()判断元素是否可以操作
  * 当标签元素是disabled的时候，返回时true
  
* get_attribute(name) 获取属性值
  ```
    driver.find_element_by_id("su").get_attribute('type')
    # su是百度的搜索按钮，返回值：‘submit’
  ```
* 获取页面元素的css样式属性值
  ```
   searchBox=driver.find_element(By.ID,"kw")
   font=searchBox.value_of_css_property("font-family")
  ```
* click() 单击
* clear() 清除文本信息
* send_keys() 输入内容，也可以给上传按钮的input添加路径
  * 如果python2,输入中文时，需要将中文字符串前加一个u
  ```
   input.send_keys(u'学中文')
  ```
* submit() 用于提交表单或者搜索框输入内容后的回车操作

### 验证点
* 自动化需要验证点，通常除了前面element.text以外还有两个：
  ```
   driver.title  //获取当前页面的head中的title内容
   driver.current_url // 获取当前页面的url地址
  ```

