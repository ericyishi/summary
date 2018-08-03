# ����λ������������
* ʵ����locator�ķֲ㣬����ά��
### �ļ��ṹ
```
 --
  |--test
  |  |--test_baidu.py
  |
  |--tools
  |  |--OperateIni.py
  |
  |--Locator.ini	 
```

1. �����ļ���locator.ini
```
 [baidu]
 searchBox=id>kw
 searchButton=id>su
```
2. ��ȡini�ļ��Ĺ����ࣺOperateIni.py
```
import ConfigParser
import os

from selenium.webdriver.support.wait import WebDriverWait


class OperateIni(object):
    def __init__(self):
        self.LocatorIniPath=os.path.dirname(os.path.abspath(__file__))+"\\..\\Locator.ini"
        print(self.LocatorIniPath)


    def getElementObject(self,driver,webSiteName,elementName):
        try:
            cf=ConfigParser.ConfigParser()
            cf.read(self.LocatorIniPath)
            locators=cf.get(webSiteName,elementName).split(">")
            locatorMethod=locators[0]
            locatorExpression=locators[1]
            print(locatorMethod,locatorExpression)
            element=WebDriverWait(driver,10).until(lambda x:x.find_element(locatorMethod,locatorExpression))
        except Exception as e:
            raise e
        else:
            return element

if __name__=="__main__":
    OperateIni() 
```
* x.find_element(locator,argument)
  * �����locatorҲ��8��������д�����в�ͬ��
    1. id
	2. xpath
	3. class name
	4. tag name
	5. name
	6. link text
	7. partial link text
	8. css selector
  

3. ������test_baidu.py
```
# encoding=utf-8
import time
import unittest

from selenium import webdriver
from selenium.webdriver.common.by import By

from tools.OperateIni import OperateIni


class MyTest(unittest.TestCase):
    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)
        self.obj=OperateIni()

    def test_openBaidu(self):
        self.driver.get('http://www.baidu.com')
        time.sleep(2)
        searchBox=self.obj.getElementObject(self.driver,"baidu","searchBox")
        searchBox.send_keys(u"����������")
        searchBtn=self.obj.getElementObject(self.driver,"baidu","searchButton")
        searchBtn.click()

if __name__=="__main__":
   unittest.main() 
```