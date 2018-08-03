# 执行js控制页面的属性值
* 可以将不可见元素变为可见，不可修改元素变为可修改
### 一个例子
* 不会改变源码，相当于是在控制台里面执行了一段js代码
```
 # encoding=utf-8
import time
import traceback
import unittest

from selenium import webdriver
from selenium.common.exceptions import WebDriverException
from selenium.webdriver.common.by import By

# 增加属性
def addAttribute(driver,elementObj,attributeName,value):
    driver.execute_script("arguments[0].%s=arguments[1]"%attributeName,elementObj,value)
# 修改属性值
def setAttribute(driver,elementObj,attributeName,value):
    driver.execute_script("arguments[0].setAttribute(arguments[1],arguments[2])",elementObj,attributeName,value)
# 获取属性值
def getAttribute(elementObj,attributeName):
    return elementObj.get_attribute(attributeName)
# 删除属性值
def removeAttribute(driver,elementObj,attributeName):
    driver.execute_script("arguments[0].removeAttribute(arguments[1])",elementObj,attributeName)



class MyTest(unittest.TestCase):
    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)


    def test_attribute(self):
        self.driver.get('http://www.baidu.com')
        time.sleep(2)

        try:
            searchBox = self.driver.find_element_by_id('kw')
			# 在id为kw的input框增加一个属性yourname=rick
            addAttribute(self.driver, searchBox, "yourname", "rick")
            time.sleep(2)
            print(getAttribute(searchBox, "yourname"))
            print(self.driver.page_source)
            self.assertTrue(u"rick" in self.driver.page_source)
        except WebDriverException,e:
            print(u"没有找到元素",traceback.print_exc())
        except AssertionError,e:
            print(traceback.print_exc())
        except Exception,e:
            print(traceback.print_exc())



if __name__=="__main__":
   unittest.main()
```