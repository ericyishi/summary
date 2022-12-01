# logging日志模块
* 也是python内置的模块
* 使用
  ```
   import logging
  ```
### 生成一个实例logger
```
import logging
logger = logging.getLogger('test')
logger.setLevel(logging.INFO)  # 输出所有大于INFO级别的log
```  
### 结构
* logger是一个树结构，默认有个根root
* root 的默认级别是 WARNING  
### level
* 控制输出哪个级别的日志
* 如果你创建了logger，而没有为其设置level，那它默认是**NOTSET**，程序会往上层找显示设置level的级别，直到root，而root级别是WARNING，所以可能会导致没有输出日志。
  * logger的level【是logging下的属性，由高到低排列】
    1. CRITICAL/ FATAL
    2. ERROR
    3. WARNING
    4. INFO
    5. DEBUG
    6. NOTSET【默认】
* 设置方法
  ```
   logger.setLevel(logging.INFO) # 输出所有大于等于INFO级别的log
  ```
  
### 日志记录格式化字符串
* asctime：	%(asctime)s	易读的时间格式： 默认情况下是'2003-07-08 16：49：45,896'的形式（逗号之后的数字是毫秒部分的时间）
* filename：	%(filename)s	路径名的文件名部分。
* funcName：	%(funcName)s	日志调用所在的函数名
* levelname：	%(levelname)s	消息的级别名称('DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL').
* levelno：	%(levelno)s	对应数字格式的日志级别 (DEBUG, INFO, WARNING, ERROR,CRITICAL).
* lineno：	%(lineno)d	发出日志记录调用的源码行号 (如果可用)。
* module：	%(module)s	所在的模块名(如test6.py模块则记录test6)
* message：	%(message)s	记录的信息
* name：	%(name)s	调用的logger记录器的名称
* process：	%(process)d	进程ID
* processName：	%(processName)s	进程名
* thread：	%(thread)d	线程ID
* threadName：	%(threadName)s	线程名  

* logging.getLogger([name=None])
* 指定name，返回一个名称为name的Logger实例。如果再次使用相同的名字，是实例化一个对象。未指定name，返回Logger实例，名称是root，即根Logger。
### 使用basicConfig方法配置logging记录格式
* 常用属性
  * filename	指定使用指定的文件名而不是StreamHandler创建FileHandler。
  * filemode	指定打开文件的模式，如果指定了filename（如果文件模式未指定，则默认为'a'）。
  * format	为处理程序使用指定的格式字符串。
  * datefmt	使用指定的日期/时间格式。
  * level	将根记录器级别设置为指定的级别。
  * handlers	如果指定，这应该是一个已经创建的处理程序的迭代器添加到根记录器。任何尚未设置格式化程序的处理程序都将被分配在此函数中创建的默认格式化程序。
```
 文件路径不指定，默认为当前模块路径。
    import threading
    import logging
    DATEFMT ="[%Y-%m-%d %H:%M:%S]"
    FORMAT = "%(asctime)s %(thread)d %(message)s"
    logging.basicConfig(level=logging.INFO,format=FORMAT,datefmt=DATEFMT,filename='class_test.log')
     
    def add(x,y):
        logging.warning("{} {}".format(threading.enumerate(),x+y))
     
    t = threading.Timer(1,add,args=(4,5))
    t.start()
     
    输出结果会追加写入当前模块路径的class_test.log文件
```
* 与unittest的结合例子
```html
    #encoding=utf-8

import unittest
import logging

LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
DATE_FORMAT = "%m/%d/%Y %H:%M:%S %p"

logging.basicConfig(filename='my.log',exc_info=True, stack_info=True, level=logging.DEBUG, format=LOG_FORMAT, datefmt=DATE_FORMAT)
logging.debug("This is a debug log.")
logging.info("This is a info log.")
logging.warning("This is a warning log.")
logging.error("This is a error log.")
logging.critical("This is a critical log.")




class Test(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        logging.info("setupclass method only called once.\n")

    @classmethod
    def tearDownClass(cls):
        logging.info("teardownclass method only called once too.\n")

    def setUp(self):
        logging.info("setup\n")  # 如果没有可以不写或者pass代替

    def tearDown(self):
        logging.info("teardown\n")

    def testSubtract(self):  # test method names begin with 'test'
        result = 6 - 5  # 实际结果
        hope = 1  # 期望结果
        try:
            self.assertEqual(result, hope)
        except Exception as msg:
            logging.error('错误信息%s' % msg)

    def testDivide(self):
        result = 7 / 2  # 实际结果
        hope = 3.5  # 期望结果
        try:
            self.assertEqual(result, hope)
        except Exception as msg:
            logging.error('错误信息%s' % msg)



if __name__ == '__main__':
    unittest.main()

```
### handler
* 控制输出到哪里，是控制台还是日志文件
* 一共有三个子类：StreamHandler（控制台输出日志）、FileHandler（日志输出到文件）、TimedRotatingFileHandler（日志分割）
* 不可以重复实例相同类型的handler，否则会遇到了重复记录日志的问题
* handler也是有级别的
  * 想要在console里输出warning以上的日志，在log文件里输出debug以上的日志，该怎么办呢
    ```
      import logging
      logger = logging.getLogger('test')
      logger.setLevel(logging.INFO)  # 输出所有大于INFO级别的log
      fmt = logging.Formatter('%(name)s - %(levelname)s - %(asctime)s - %(message)s')
      # 添加StreamHandler，并设置级别为WARNING
      stream_hdl = logging.StreamHandler()
      stream_hdl.setLevel(logging.WARNING)
      stream_hdl.setFormatter(fmt)
      logger.addHandler(stream_hdl)
      # 添加FileHandler，并设置级别为DEBUG
      file_hdl = logging.FileHandler('test.log')
      file_hdl.setLevel(logging.DEBUG)
      file_hdl.setFormatter(fmt)
      logger.addHandler(file_hdl)
      
      logger.info('I am <info> message.')
      logger.debug('I am <debug> message.')  # 不输出
    ```