# ִ��js����ҳ�������ֵ
* ���Խ����ɼ�Ԫ�ر�Ϊ�ɼ��������޸�Ԫ�ر�Ϊ���޸�
### һ������
* ����ı�Դ�룬�൱�����ڿ���̨����ִ����һ��js����
```
 # encoding=utf-8
import time
import traceback
import unittest

from selenium import webdriver
from selenium.common.exceptions import WebDriverException
from selenium.webdriver.common.by import By

# ��������
def addAttribute(driver,elementObj,attributeName,value):
    driver.execute_script("arguments[0].%s=arguments[1]"%attributeName,elementObj,value)
# �޸�����ֵ
def setAttribute(driver,elementObj,attributeName,value):
    driver.execute_script("arguments[0].setAttribute(arguments[1],arguments[2])",elementObj,attributeName,value)
# ��ȡ����ֵ
def getAttribute(elementObj,attributeName):
    return elementObj.get_attribute(attributeName)
# ɾ������ֵ
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
			# ��idΪkw��input������һ������yourname=rick
            addAttribute(self.driver, searchBox, "yourname", "rick")
            time.sleep(2)
            print(getAttribute(searchBox, "yourname"))
            print(self.driver.page_source)
            self.assertTrue(u"rick" in self.driver.page_source)
        except WebDriverException,e:
            print(u"û���ҵ�Ԫ��",traceback.print_exc())
        except AssertionError,e:
            print(traceback.print_exc())
        except Exception,e:
            print(traceback.print_exc())



if __name__=="__main__":
   unittest.main()
```