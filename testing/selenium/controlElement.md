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
* get_attribute(name) 获取属性值
  ```
    driver.find_element_by_id("su").get_attribute('type')
    # su是百度的搜索按钮，返回值：‘submit’
  ```
* click() 点击
* clear() 清除文本信息
* send_keys() 输入内容，也可以给上传按钮的input添加路径
* submit() 用于提交表单或者搜索框输入内容后的回车操作

### 验证点
* 自动化需要验证点，通常除了前面element.text以外还有两个：
  ```
   driver.title  //获取当前页面的head中的title内容
   driver.current_url // 获取当前页面的url地址
  ```
