# 元素是否存在
### 定义方法
```
 def isElementExists(self,by,value):
   # 先导入异常包
   from selenium.common.exceptions import NoSuchElementException
   try:
     ele=self.driver.find_element(by=by,balue=value)
   except NoSuchElementException as e:
     print e
     return False
   else:
     return True
```
### 调用
```
 def test(self):
   url="http://www.baidu.com"
   self.driver.get(url)
   res=self.isElementExists("id","query")
   if res in True:
      print(u"所查找元素在页面上")
   else:
      print(u"未找到元素")
```