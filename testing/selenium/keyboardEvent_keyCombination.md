# ��ϼ�
### ��ʽһ��ʹ��webDriver��ActionChains��ģ��

#### Ӧ�ã�ȫѡ�����У�ճ��
* control�����º�������ͷ�
* ע�⣺����ctrl(key_down())�밴��a����send_keys()��ʹ�õĲ�ͬ�ķ���
```
 # encoding=utf-8
import time
import unittest

from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys


class MyTest(unittest.TestCase):
    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)
    def test_combinationKey(self):
        url="http://www.baidu.com"
        self.driver.get(url)
        input=self.driver.find_element_by_id("kw")
        input.click() #�л����㵽�������
        input.send_keys("skr")
        time.sleep(2)
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('a').key_up(Keys.CONTROL).perform()
        #control�����º�������ͷ�
        time.sleep(2)
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('x').key_up(Keys.CONTROL).perform()
        self.driver.get(url)
        self.driver.find_element_by_id('kw').click()
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
        self.driver.find_element_by_id('su').click()
        time.sleep(3)
```

### ��ʽ����ʹ��pywin32��ģ��

#### ʹ��ǰ��
* ��Ҫ����pywin32����ģ��windows��ϰ���
```
 py -2 -m pip install -i https://pypi.douban.com/simple pywin43
```
* ȷ�ϰ�װ�ɹ�
```
 import win32con
```

* ��python3�£�û�а�װpywin32����Ҳ�ܹ�ʵ������Ч��

#### Ӧ�ã�ȫѡ�����У�ճ��
* ע��ctrlҪ�Ȱ��£�������ͷ�
* keydown()�Լ�keyup()������д�ڲ��������棬Ҳ���Ե�����װһ��ģ�鵼��
* ���̶�Ӧ��16���Ƶ�ASCII����Բο���http://blog.51cto.com/conducer/2106000
```
 # encoding=utf-8
import time
import unittest
import win32api
import win32con

from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys

VK_CODE = {
    'enter': 0x0D,
    'ctrl': 0x11,
    'a': 0x41,
    'v': 0x56,
    'x': 0x58
}


def keyDown(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, 0, 0)


def keyUp(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, win32con.KEYEVENTF_KEYUP, 0)


class MyTest(unittest.TestCase):

    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)

    def test_combinationKeyWithPywin(self):
        url = "http://www.baidu.com"
        self.driver.get(url)
        input = self.driver.find_element_by_id("kw")
        input.click()  # �л����㵽�������
        input.send_keys("skr")
        time.sleep(2)
        keyDown('ctrl')
        keyDown('a')
        keyUp('a')
        keyUp('ctrl')
        keyDown('ctrl')
        keyDown('x')
        keyUp('x')
        keyUp('ctrl')
        self.driver.find_element_by_id("kw").click()
        keyDown('ctrl')
        keyDown('v')
        keyUp('v')
        keyUp('ctrl')
        keyDown('enter')
        keyUp('enter')
        time.sleep(5)
``` 

### Ӧ��:���ߵĽ�ϣ��������Ӧ��
```
 # encoding=utf-8
import time
import unittest
import win32api
import win32con
import win32clipboard as w

from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.common.keys import Keys

VK_CODE = {
    'enter': 0x0D,
    'ctrl': 0x11,
    'a': 0x41,
    'v': 0x56,
    'x': 0x58
}

def getText():
    w.OpenClipboard()
    d=w.GetClipboardData(win32con.CF_TEXT)
    w.CloseClipboard()
    return d

def setText(aString):
    w.OpenClipboard()
    w.EmptyClipboard()
    w.SetClipboardData(win32con.CF_UNICODETEXT,aString)
    w.CloseClipboard()

def keyDown(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, 0, 0)


def keyUp(keyName):
    win32api.keybd_event(VK_CODE[keyName], 0, win32con.KEYEVENTF_KEYUP, 0)


class MyTest(unittest.TestCase):

    def setUp(self):
        pro = r'C:\Users\Administrator\AppData\Roaming\Mozilla\Firefox\Profiles\qrlgt4z4.default'
        profile = webdriver.FirefoxProfile(pro)
        self.driver = webdriver.Firefox(executable_path=u'F:\seleniumTest\driver\geckodriver', firefox_profile=profile)

    def test_combinationKey(self):
        url="http://www.baidu.com"
        self.driver.get(url)
        input=self.driver.find_element_by_id("kw")
        input.click() #�л����㵽�������
        content2=u"�¹�����"
        # �������е����ݷ�����а壬����ʵ��ֻ�ܷ���һ��ֵ
        setText(content2)
        # ��ȡ���а��������
        gContent=getText()
        # print gContent.decode("gbk").encode("utf-8") # �ĸ���������
        self.driver.find_element_by_id("kw").click()
        # �Ӽ��а��л�ȡ�õ�������ճ������������
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
        self.driver.find_element_by_id('su').click()
        time.sleep(3)
```