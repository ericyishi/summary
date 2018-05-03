# 多窗口切换
* 使用driver.switch_to().window(handle)来切换窗口
```
 from selenium import webdriver

nowhandle = driver.current_window_handle # 获取当前窗口
allhandles = driver.window_handles # 获取所有窗口,对于是新窗口或者新标签页都起作用
for handle in allhandles: # 循环判断窗口是否为当前窗口
  if handle != nowhandle: # 不是当前窗口即进行切换 , 并后续操作
  driver.switch_to().window(handle)
  driver.find_element_by_id('test_id1').click()
  driver.close()
  driver.switch_to.window(nowhandle) # 切换回原来的窗口 , 继续进行其它操作
```
* 核心就是获取当前页以及所有页面并遍历
  ```
   driver.current_window_handle # 得到当前页
   driver.window_handles # 获取所有页面
  ```