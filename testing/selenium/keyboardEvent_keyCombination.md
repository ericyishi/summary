# 组合键
### 方式一：使用webDriver的ActionChains来模拟

#### 应用：全选，剪切，粘贴
* control键按下后别忘了释放
* 注意：按下ctrl(key_down())与按下a键（send_keys()）使用的不同的方法
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
        input.click() #切换焦点到输入框里
        input.send_keys("skr")
        time.sleep(2)
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('a').key_up(Keys.CONTROL).perform()
        #control键按下后别忘了释放
        time.sleep(2)
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('x').key_up(Keys.CONTROL).perform()
        self.driver.get(url)
        self.driver.find_element_by_id('kw').click()
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
        self.driver.find_element_by_id('su').click()
        time.sleep(3)
```

### 方式二：使用pywin32来模拟

#### 使用前提
* 需要下载pywin32包来模拟windows组合按键
```
 py -2 -m pip install -i https://pypi.douban.com/simple pywin43
```
* 确认安装成功
```
 import win32con
```

* 在python3下，没有安装pywin32包，也能够实现上面效果

#### 应用：全选，剪切，粘贴
* 注意ctrl要先按下，再最后释放
* keydown()以及keyup()方法需写在测试类外面，也可以单独封装一个模块导入
* 键盘对应的16进制的ASCII码可以参考：http://blog.51cto.com/conducer/2106000
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
        input.click()  # 切换焦点到输入框里
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

### 应用:两者的结合，剪贴板的应用
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
        input.click() #切换焦点到输入框里
        content2=u"德国旅游"
        # 将变量中的内容放入剪切板，但是实际只能放入一个值
        setText(content2)
        # 获取剪切板里的内容
        gContent=getText()
        # print gContent.decode("gbk").encode("utf-8") # 四个？？？？
        self.driver.find_element_by_id("kw").click()
        # 从剪切板中获取得到的内容粘贴到搜索框中
        ActionChains(self.driver).key_down(Keys.CONTROL).send_keys('v').key_up(Keys.CONTROL).perform()
        self.driver.find_element_by_id('su').click()
        time.sleep(3)
```