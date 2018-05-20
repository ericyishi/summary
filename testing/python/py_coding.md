# 编码
### 编码错误
* 开发python程序中，会涉及三个方面的编码
  1. python程序文件的编码
     ```
      #coding=utf-8
     ```
     * 程序开头第一行加上
     * 注意：#coding=utf-8 的 = 号两边不要空格。
     * Python中默认的编码格式是 ASCII 格式
     * Python3.X 源码文件默认使用utf-8编码，所以可以正常解析中文，无需指定 UTF-8 编码。
  2. IDE需要设置 py 文件存储的格式为 UTF-8
     * Pycharm 设置步骤：
       1. 进入 file > Settings，在输入框搜索 encoding。
       2. 找到 Editor > File encodings，将 IDE Encoding 和 Project Encoding 设置为utf-8。
  3. python程序读取外部文件、网页的编码
     * 通过decode()、encode()方法来编码转换
       * encode()作用是将Unicode编码转化成其他编码
       * decode()作用是将其他编码字符串转化成unicode