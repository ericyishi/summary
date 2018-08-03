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
2. os.system("command")会执行括号中的命令
   * 如果命令成功执行，这条语句返回0【注意：0代表成功】，否则返回1
   * 参数-f是强制，-im是进程名
   ```
    if not(os.system("taskkill -f -im calc.exe")):
	# 结束进程calc
	   print("已结束计算器的进程")  
	
   ```
   
#### 路径相关命令
1. os.getcwd() 获取当前工作的绝对路径
   * 还可以使用os.path.abspath('.')获取当前的绝对路径
2. os.listdir(‘字符串目录’) 列出字符串目录下的所有文件以及文件夹【返回的是列表类型返回的是列表类型】
```
 os.listdir('.') //列出当前目录下所有文件或文件夹
 os.listdir('config') //列出当前路径下config文件夹下所有文件
```
3. os.mkdir('目录')   创建目录
4. os.remove('1.txt') 删除文件，文件**不存在时会报错**   
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

### 应用1
```
 # 删除30天以前的文件
 #-*- coding:utf-8 -*-
import os
import time
import datetime

class clean:
    def __init__(self, file_url):
        self.file_url = file_url
    def delfile(self):
        f =  list(os.listdir(self.file_url)) # 列出当前路径下文件夹下所有文件
        print("%s\n  开始清理过期文件...." % self.file_url)
        for i in range(len(f)):
            filedate = os.path.getmtime(self.file_url + f[i]) #获取修改文件时间
            time1 = datetime.datetime.fromtimestamp(filedate).strftime('%Y-%m-%d')# 转换格式
            date1 = time.time()
            num1 =(date1 - filedate)/60/60/24  #转化成日
            if num1 >= 30:
                try:
                    os.remove(self.file_url + f[i])
                    print(u"已删除文件：%s ： %s" %  (time1, f[i]))            
                except Exception as e:                                             
                        print(e)                                          
        else:
            print("......")

file1 = clean('E:\\web\\WS3.0\\Upload\\android\\video\\')
file1.delfile()
print(u'过期文件已清理完毕：%s\n' % file1.file_url)
 
file2 = clean('E:\\web\\WS3.0\\Upload\\android\\wechat\\')
file2.delfile()
print(u'过期文件已清理完毕：%s\n' % file2.file_url)

file3 = clean('E:\\web\\WS3.0\\Upload\\eDog\\complain\\')
file3.delfile()
print(u'过期文件已清理完毕：%s\n' % file3.file_url)

file4 = clean('E:\\web\\WS3.0\\Upload\\eDog\\shark\\')
file4.delfile()
print(u'文件夹已清理完毕：%s\n' % file4.file_url)

file5 = clean('E:\\web\\WS3.0\\Upload\\Ticket\\')
file5.delfile()
print(u'文件夹已清理完毕：%s\n' % file5.file_url)
```
