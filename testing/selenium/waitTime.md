# 等待时间的三种方式
### 强制等待sleep
* 这种方式是使用python的time模块
  ```
   import time
   time.sleep(2) # 单位是秒
  ```
  * 这种方式不灵活，会强制暂停的。
  * 需要用的地方就要调用一次

### 隐式等待
* 由webDriver提供的，是driver下的方法
  ```
   driver.implicitly_wait(10) # 隐式等待10s

  ```
* 单位是秒
* 只需要设置一次，在driver的整个生命周期里面都起作用。
* 这种方式等待时间不是一个固定时间，而是最大时长
* **这种方式也不针对页面上某一个元素**，当脚本执行到你某个定位元素时，如果元素可以定位，则继续执行，定位不到，就进入轮询方式判断是否存在，如果超过设置的最大时间，就抛出异常。
* 缺点：如果要测的元素早就加载完成，由于个别js等资源加载慢，导致整个页面还在加载状态中，也是不会执行的。
  
### 显示等待【推荐使用】
* 这种方式WebDriverWait是由webDriver提供的，这是全局方法，直接使用
* 推荐使用这种方式
* 使webDriver等待某个条件成立时继续执行，否则达到最大时长时候抛出异常（TimeoutException）
* 方法的参数说明
  ```
   WebDriverWait(driver,timeout,check_frequency=0.5,exception)
   # timeout:最长超长时间，默认以秒为单位
   # 轮询时间间隔：默认0.5s!
   # 超时后抛出异常，默认NoSuchElementException
  ```
* WebDriverWait()通常配合until()和until_not()一起使用
  * until(方法,方式) 直到返回True
  * until_not(方法,方式) 直到返回False
```
 try:
	element=WebDriverWait(driver,5,0.5).until(expected_conditions.presence_of_element_located(By.ID,"kw"))
    # 每隔0.5s检测一次以kw定位的id元素是否被加载进DOM中，最大时间是5s，超时就抛出异常
 except TimeoutException as e:
    print(traceback.print_exc()) #需要导入堆栈类import traceback
 except NoSuchElementException as e:
    print(traceback.print_exc())
 except Exception as e:
    print(traceback.print_exc()) 
```

### Expected Conditions类
* expected_conditions类提供了不少预期条件判断的方法
```
from selenium.webdriver.support import expected_conditions as EC
```
#### 应用场景
1. 直接在断言中使用
2. 与WebDriverWait配合使用，动态等待页面上元素出现或者消失
   ```
    element=WebDriverWait(self.driver,10).until(lambda x:x.find_element_by_css_selector("#client"))
   ```

#### 常用方法
* title_is: 判断当前页面的title是否精确等于预期
  ```
    self.driver.get('http://www.baidu.com')
    wait = WebDriverWait(self.driver, 10, 0.2)
    title_is_baidu=EC.title_is(u"百度一下，你就知道")
	wait.until(title_is_baidu)
	self.assertTrue(title_is_baidu)
  ```

* title_contains: 判断当前页面的title是否包含预期字符串

* presence_of_element_located: 判断某个元素是否被加到了dom树里，并不代表该元素一定可见

* visibility_of_element_located: 判断某个元素是否可见.可见代表元素非隐藏，并且元素的宽和高都不等于0

* visibility_of: 跟上面的方法做一样的事情，只是上面的方法要传入locator，这个方法直接传定位到的element就好了

* presence_of_all_elements_located: 判断是否至少有1个元素存在于dom树中。举个例子，如果页面上有n个元素的class都是'column-md-3'，那么只要有1个元素存在，这个方法就返回True

* text_to_be_present_in_element: 判断某个元素中的text是否包含了预期的字符串

* text_to_be_present_in_element_value: 判断某个元素中的value属性是否包含了预期的字符串

* frame_to_be_available_and_switch_to_it: 判断该frame是否可以switch进去，如果可以的话，返回True并且switch进去，否则返回False

* invisibility_of_element_located: 判断某个元素中是否不存在于dom树或不可见

* element_to_be_clickable: 判断某个元素中是否可见并且是enable的，这样的话才叫clickable

* staleness_of: 等某个元素从dom树中移除，注意，这个方法也是返回True或False

* element_to_be_selected(driverObj): 判断某个元素是否被选中了,一般用在下拉列表
  ```
   wait.util(EC.element_to_be_selected(driver.find_element_by_id("football")))
  ```

* element_selection_state_to_be(driverObj,state): 判断某个元素的选中状态是否符合预期
   * 选中返回true,反之亦然
  ```
    wait.util(EC.element_located_selection_state_to_be(driver.find_element_by_id("football"),True))
  ```
* element_located_selection_state_to_be(locator,state): 只是上面的方法传入定位到的element，而这个方法传入locator定位器的元祖（by,path）
   * 选中返回True,反之亦然
  ```
    wait.util(EC.element_located_selection_state_to_be((By.ID,"peach"),True))
  ```

* alert_is_present: 判断页面上是否存在alert，这是个老问题，很多同学会问到
  ```
   alert=wait.util(EC.alert_is_present())
   print(alert.text)
   alert.accept()
  ```

#### demo
```
#encoding:utf-8
# example of how to use https://github.com/SeleniumHQ/selenium/blob/master/py/selenium/webdriver/support/expected_conditions.py
 
from selenium import webdriver
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.common.by import By
 
import unittest
 
# dr = webdriver.PhantomJS('phantomjs')
dr = webdriver.Firefox()
# dr = webdriver.Chrome()
url = 'http://www.baidu.com'
search_text_field_id = 'kw'
dr.get(url)
 
class ECExample(unittest.TestCase):
 
  def test_title_is(self):
    ''' 判断title是否符合预期 '''
    title_is_baidu = EC.title_is(u'百度一下，你就知道')
    self.assertTrue(title_is_baidu(dr))
 
  def test_titile_contains(self):
    ''' 判断title是否包含预期字符 '''
    title_should_contains_baidu = EC.title_contains(u'百度')
    self.assertTrue(title_should_contains_baidu(dr))
 
  def test_presence_of_element_located(self):
    ''' 判断element是否出现在dom树 '''
    locator = (By.ID, search_text_field_id)
    search_text_field_should_present = EC.visibility_of_element_located(locator)
 
    ''' 动态等待10s，如果10s内element加载完成则继续执行下面的代码，否则抛出异常 '''
    WebDriverWait(dr, 10).until(EC.presence_of_element_located(locator))
    WebDriverWait(dr, 10).until(EC.visibility_of_element_located(locator))
 
    self.assertTrue(search_text_field_should_present(dr))
 
  def test_visibility_of(self):
    search_text_field = dr.find_element_by_id(search_text_field_id)
    search_text_field_should_visible = EC.visibility_of(search_text_field)
    self.assertTrue(search_text_field_should_visible('yes'))
 
  def test_text_to_be_present_in_element(self):
    text_should_present = EC.text_to_be_present_in_element((By.NAME, 'tj_trhao123'), 'hao123')
    self.assertTrue(text_should_present(dr))
 
 
  @classmethod
  def tearDownClass(kls):
    print 'after all test'
    dr.quit()
    print 'quit dr'
 
if __name__ == '__main__':
  unittest.main()
``` 
