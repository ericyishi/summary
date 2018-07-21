# 编码
### 中文编码
1.编码发展
  * GB2312--》GBK1.0--》GB18030
  * PC端必须支持国标GB18030,对嵌入式产品暂不做要求，所以手机、MP3一般只支持GB2312【解释了为啥在mp3会出现乱码】
  * 向下兼容的
  * GBK现在更普遍，有的中文Windows的缺省内码还是GBK
### 编码统一
* 为了解决各国之间不统一，ISO提出Unicode
* ASCII占1个字节-8位，Unicode占2个字节16位
* 再次升级，可变长字符集**utf-8**，存中文3个字节（unicode只要两个），存英文使用ASCII格式，使用1个字节
* utf-8是Unicode的一个子集
### 编码错误
* 开发python程序中，会涉及三个方面的编码
  1. python程序文件的编码
     ```
      #coding=utf-8
	  或者
	  # -*- coding:utf-8 -*-
     ```
     * 程序开头第一行加上
     * 注意：#coding=utf-8 的 = 号两边不要空格。
     * Python2中默认的编码格式是 ASCII 格式
     * Python3.X 源码文件默认使用utf-8编码，所以可以正常解析中文，无需指定 UTF-8 编码。
  2. IDE需要设置 py 文件存储的格式为 UTF-8
     * Pycharm 设置步骤：
       1. 进入 file > Settings，在输入框搜索 encoding。
       2. 找到 Editor > File encodings，将 IDE Encoding 和 Project Encoding 设置为utf-8。
  3. python程序读取外部文件、网页的编码
     * 通过decode()、encode()方法来编码转换
       * encode()作用是将Unicode编码转化成其他编码
       * decode()作用是将其他编码字符串转化成unicode