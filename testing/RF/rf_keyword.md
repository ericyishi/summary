# 关键字
### evaluate
* evaluate能让你直接运行python脚本。这样可以在Library没有给你提供你想要的方法时，直接用python脚本来实现你想要的方法。
  ```html
   # 格式：
     变量 evaluate python代码 引入库名
     ${nowTime}    evaluate     time.strftime("%Y/%m%d %H:%M:%S",time.localtime(time.time()))    time
  ```
  * 这样就可以利用python获取想要的时间格式
  
### log
* 打印
* log：适用于scalar变量，或者输出dict这类需要把符号变成$
* log many：**用于输出List、dict变量**  