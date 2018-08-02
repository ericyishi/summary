# 操作dom元素
* 有时候使用webdriver操作元素无法生效时候，可以使用js操作dom元素

### 例子：使用js输入内容并点击页面元素
```
 # encoding=utf-8
import time
import traceback
import unittest

from selenium import webdriver
from selenium.common.exceptions import WebDriverException
from selenium.webdriver.common.by import By


class MyTest(unittest.TestCase):
    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)

    def test_openBaidu(self):
        self.driver.get('http://www.baidu.com')
        time.sleep(2)
        searchBox="document.getElementById('kw').value='心相印'"
        SearchBtn="document.getElementById('su').click();" 
		# click() 是input对象自己的方法，还有blur(),focus()
        try:
            self.driver.execute_script(searchBox)
            time.sleep(2)
            self.driver.execute_script(SearchBtn)
            time.sleep(2)
            self.assertTrue(u"好视力" in self.driver.page_source)
        except WebDriverException,e:
            print(u"没有找到元素",traceback.print_exc())
        except AssertionError,e:
            print(traceback.print_exc()) # traceback.print_exc()能打印出详细的行数
        except Exception,e:
            print(traceback.print_exc())



if __name__=="__main__":
   unittest.main()
```

# 调用JavaScript
* 有些时候，我们要控制一些模块，但是webdriver并没有提供相应的操作，所以我们可以使用JS来控制
* 例如操作滚动条

### 使用JS
1. 操作滚动条的高度
  ```
   js="window.scrollTo(0,100)"
   # 将垂直滚动条调到100px的位置
   driver.execute_script(js)
  ```
  * 通过js就很好的操纵了浏览器的滚动条

2. textarea文本框
  * 使用send_keys()同样不能写入内容
    ```
     text="要输入textarea的内容"
     js="var ele=document.getElementByID('mytextarea');ele.value=%s;"%text
     driver.execute_script(js)

    ```
    * 通过js的方式就可以向里面输入内容了