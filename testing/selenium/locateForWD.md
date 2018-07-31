# webdriver8大定位方式
### 概述
* 在低版本的Selenium中通常使用find_element和find_elements方法，再配合By类来实现定位页面的元素
* 高版本中官方文档建议使用find_element_by_*和find_elements_by_*
* 对于同时定位多个页面的元素【需要使用find_elements_by_*】，以列表形式返回所有定位到的元素页面
* 对于find_element_by_*方式若匹配到多个元素，实际只返回第一个页面元素对象
### 使用独立方法的方式【推荐】
1. id
* id元素的获取
  * driver.find_element_by_id()
  * driver.find_elements_by_id() //返回的是一个列表，使用下标，就算只有一个元素也要用[0]
2. name
* 通常是用于标签上有name属性的获取，常见于input
  * driver.find_element_by_name()
  * driver.find_elements_by_name()
3. className
* 类名获取元素
  * driver.find_element_by_class_name()
  * driver.find_elements_by_class_name()
4. tagName
* 通过html中的标签名获取元素
  * driver.find_element_by_tag_name()
  * driver.find_elements_by_tag_name()
5. link
* 定位超文本链接
  * driver.find_element_by_link_text()
  * driver.find_elements_by_link_text()

6. partial_link
* partial_link_text是对上面link的一个补充，部分文字的提取
  * driver.find_element_by_partial_link_text()
  * driver.find_elements_by_partial_link_text()
7. xpath
* xml path的缩写
* 性能不算好，尽量少用
* 优势在于更加灵活，就算页面没有id、name等标签属性也能够定位
* **xpath中没有第0元素这样的表示方法，都是从1开始**
* driver.find_element_by_xpath()或driver.find_elements_by_xpath()
	1. 绝对路径定位
	  * 从根路径开始寻找
	  * 元素的xpath绝对路径可通过浏览器工具直接查询复制，一般不需要你手工去写
	  * 一般不推荐使用绝对路径的写法，因为一旦页面结构发生变化，该路径也随之失效，必须重新写。
	  * 绝对路径以单/号开头表示
		```
		 driver.driver.find_element_by_xpath("/html/body/div/div[1]/span")
		 # 注意在xpath中下标是从1开始的
		```
	2. 相对路径定位【推荐】
	  * 相对路径则以//表示
	  * 当xpath路径以//开头时，则表示让xpath引擎从文档的任意符合的元素节点开始进行解析。
	  ```
	   查找页面上所有的input元素：//input
	   查找页面上第一个form元素内的直接子input元素(即只包括form元素的下一级input元素，使用绝对路径表示，单/号)：//form[1]/input
	   查找页面上第一个form元素内的所有子input元素(只要在form元素内的input都算，不管还嵌套了多少个其他标签，使用相对路径表示，双//号)：//form[1]//input
	  ```
	3. xpath的函数
	   1. starts-with(str1,str2)
		  ```
		   //img[starts-with(@alt,'decription')]
		   # 这里的//不是注释，而是相对路径
		   # 查找属性alt的属性值以'decription'关键字开始的页面
		  ```
	   2. contains(str1,str2)
		  ```
		   //img[contains(@alt,'img')]
		   # 查找alt属性值包含‘img’关键字的页面元素
		  ```
	   3. text() 获取定位元素的文本值
		  ```
		   //a[text()='搜狗搜索']
		   //a[contains(text(),'百度')]
		  ```
    4. xpath的运算符
       1. |【获取多个节点集】
	     ```
		  //div|//a
		 ```
       2. +
	     ```
		  //div[1+1]
		 ```
       3. -
       4. *
       5. div 【**除**】
       6. =
	      ```
		   //div[a=10] # 查找子元素有a元素，且其文本内容为数字且为10的div元素
		   //div=10 #【逻辑判断】如果div是10，那么返回true，反之亦然
		  ```
       7. !=
       8. <
       9. <=
       10. >
       11. >=
       12. and【逻辑运算与】
       13. or
       14. mod 【取余】	   
8. css
* 性能优于xpath
  * driver.find_element_by_css_selector()
  * driver.find_elements_by_css_selector()


### 使用By定位元素【不推荐】
* 使用By方式首先要导入包
  ```
   from selenium.webdriver.common.by import By
  ```
* 统一使用find_element()或者find_elements()方法,然后参数传入By来声明定位的方式。
  ```
   driver.find_element(By.ID, "kw")
   driver.find_elements(By.ID,"kw")
  ```
  * 方法需要两个参数，一个是定位的类型，一个是具体的元素
* 前面直接driver调用方法的方式，更简洁易懂，但是本质上也是调用了by的方式
  ```
   def find_element_by_id(self,id_):
    return self.find_element(by=By.ID,value=id_)

  ```
* 除了上面这种显示写法外，也可以直接使用by='xxx'的方式，这样也不用导By包  
* By定位的8种方式【前者都是大写哦】
  1. By.ID(或者by="id")
  2. By.NAME(或者by="name")
  3. By.CLASS_NAME(或者by="class name")
  4. By.TAG_NAME(或者by="tag name")
  5. By.LINK_TEXT(或者by="link text")
  6. By.PARTIAL_LINK_TEXT(或者by="partial link text")
  7. By.XPATH(或者by="xpath")
  8. By.CSS_SELECTOR(或者by="css selector")

### 实例
```
  def testLocator(self):
        self.driver.get('http://www.baidu.com')
        time.sleep(2)
		# 方式1
        searchBtn = self.driver.find_element_by_partial_link_text("贴吧")
		# 方式2
        searchBtn=self.driver.find_element(by="partial link text",value="贴吧")
		# 方式3
        searchBtn=self.driver.find_element(By.PARTIAL_LINK_TEXT,value='贴吧')
        searchBtn.click()
```
