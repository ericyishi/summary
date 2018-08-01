# 使用JS中止加载
* 希望等待到了最大时间，或者自设定一个加载时间，不是中止，而是继续执行代码
```
 self.driver.execute_script('window.stop()')
```
### 应用：超过加载时间，停止加载，继续执行后面操作
```
 def test_PageLoad(self):
   # 设置页面加载限定时间为8秒
   self.driver.set_page_load_timeout(8)
   try:
     startTime=time.time()
	 self.driver.get("www.bilibili.com")
   except TimeoutException:
     # 使用js停止加载
     self.driver.execute_script('window.stop()')  
   end=time.time()-startTime
   print(end)
   # 后面继续写正常逻辑   
```