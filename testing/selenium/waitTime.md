# 等待时间的三种方式
### 强制等待sleep
* 这种方式是使用python的time模块
  ```
   import time
   time.sleep(2) # 单位是秒
  ```
  * 这种方式不灵活，会强制暂停的。
  * 需要用的地方就要调用一次
### 显示等待
* 这种方式WebDriverWait是由webDriver提供的，这是全局方法，直接使用
* 推荐使用这种方式
* 使webDriver等待某个条件成立时继续执行，否则达到最大时长时候抛出异常（TimeoutException）
* 方法的参数说明
  ```
   WebDriverWait(driver,timeout,check_frequency=0.5,exception)
   # timeout:最长超长时间，默认以秒为单位
   # 检测时间间隔：默认0.5s
   # 超时后抛出异常，默认NoSuchElementException
  ```
* WebDriverWait()通常配合until()和until_not()一起使用
  * until(方法,方式) 直到返回True
  * until_not(方法,方式) 直到返回False
```
 element=WebDriverWait(driver,5,0.5).until(expected_conditions.presence_of_element_located(By.ID,"kw"))
 # 每隔0.5s检测一次以kw定位的id元素是否被加载进DOM中，最大时间是5s，超时就抛出异常
```
  * expected_conditions类提供了不少预期条件判断的方法
    * [提供方法参考外链](https://blog.csdn.net/yzl11/article/details/52901946?locationNum=2&fps=1)
### 隐式等待
* 由webDriver提供的，是driver下的方法
  ```
   driver.implicitly(10) # 隐式等待10s

  ```
* 单位是秒
* 这种方式等待时间不是一个固定时间，而是最大时长
* **这种方式也不针对页面上某一个元素**，当脚本执行到你某个定位元素时，如果元素可以定位，则继续执行，定位不到，就进入轮询方式判断是否存在，如果超过设置的最大时间，就抛出异常。