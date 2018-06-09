# OS模块
### 概述
* Python os模块包含普遍的操作系统功能。如果你希望你的程序能够与平台无关的话，这个模块是尤为重要的。
### 使用
```
import os
```
### 常用方法
#### 系统相关命令
1. os.name 获取系统类型
   * windows系统为：nt
   * windows系统为：posix

#### 路径相关命令
1. os.getcwd() 获取当前工作的绝对路径
2. os.listdir(‘字符串目录’) 列出字符串目录下的所有文件以及文件夹【返回的是列表类型返回的是列表类型】
```
 os.listdir('.') //列出当前目录下所有文件或文件夹
 os.listdir('config') //列出当前路径下config文件夹下所有文件
```
3. os.mkdir('目录')   创建目录
4. os.remove('1.txt') 删除文件，文件不存在时会报错   
5. os.path.join(os.getcwd(),'aaa', 'bbb', 'ccc')   拼接出来多级目录：E:\test\aaa\bbb\ccc
6. os.path.exists('目录')  判断目录是否存在【返回True 或 False】
7. os.path.split(‘文件或者目录’)  把最后的一个目录或者文件和前面的目录分开，返回一个tuple
8. os.path.splitext(‘文件’)    把文件的后缀名和前面分开，返回一个tuple
9. os.path.basename(path)  返回path中的文件名
10.  os.path.dirname(path) 返回path中的文件夹部分，结果不包含'\'。必须是实际存在的.py文件。否则会报错
   ```
     os.path.dirname('D:\\pythontest\\ostest\\hello.py')
     'D:\\pythontest\\ostest'
   ```
   * os.path.dirname(os.path.abspath(__file__)) //获取当前文件的绝对路径
#### 时间相关命令
1. os.path.getmtime(path) 文件或文件夹的最后**修改**时间，从新纪元到访问时的秒数。
2. os.path.getatime(path) 文件或文件夹的最后**访问**时间，从新纪元到访问时的秒数。
3. os.path.getctime(path) 文件或文件夹的**创建**时间，从新纪元到访问时的秒数。