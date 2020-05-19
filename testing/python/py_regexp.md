# 正则表达式
* 在线匹配测试：https://tool.oschina.net/regex/
* 在 Python 中，我们可以使用内置的 re 模块来使用正则表达式

### 使用步骤
1. 使用 compile() 函数将正则表达式的字符串形式编译为一个 Pattern 对象
2. 通过 Pattern 对象提供的一系列方法对目标文本进行匹配查找，获得匹配结果，一个 Match 对象。
3. 最后使用 Match 对象提供的属性和方法获得信息，根据需要进行其他的操作

### compile方法
* compile 函数用于编译正则表达式，生成一个 Pattern 对象
  ```
   import re

   # 将正则表达式编译成 Pattern 对象
   pattern = re.compile(r'\d+')
  ```
#### 常用方法
* Pattern 对象的一些常用方法主要有：
  * match 方法：从起始位置开始查找，一次匹配
  * search 方法：从任何位置开始查找，一次匹配
  * findall 方法：全部匹配，返回列表
  * finditer 方法：全部匹配，返回迭代器
  * split 方法：分割字符串，返回列表
  * sub 方法：替换
##### match
* match() 从第一个字符开始找, 如果第一个字符就不匹配就返回None, 不继续匹配
* 用于判断字符串开头或整个字符串是否匹配,速度快
  ```
   >>> import re
   >>> pattern = re.compile(r'\d+')  # 用于匹配至少一个数字

   >>> m = pattern.match('one12twothree34four')  # 查找头部，没有匹配
   >>> print m  #None
  ```
##### search
* search() 会整个字符串查找,直到找到一个匹配
  ```
   >>> import re
   >>> pattern = re.compile('\d+')
   >>> m = pattern.search('one12twothree34four')  # 这里如果使用 match 方法则不匹配
   >>> m
   <_sre.SRE_Match object at 0x10cc03ac0>
   >>> m.group()
   '12'
  ```
##### findall
* 搜索整个字符串，获得所有匹配的结果
  ```
   >>> import re
   >>> pattern = re.compile('\d+')
   >>> m = pattern.search('one12twothree34four')  # 这里如果使用 match 方法则不匹配
   >>> m # ['12', '34']
  ```

### 贪婪模式与非贪婪模式