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

