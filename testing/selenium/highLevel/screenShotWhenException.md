# 断言失败截图

* 创建文件路径
```

 def currentDate():
	today= time.strftime("%Y-%m-%d)
	return today
	
 def currentTime():
    now=timeStr.strftime('%H-%M-%S')
    return now

# 创建文件路径	
 def createDir():
   currentPath=os.path.dirname(os.path.abspath(__file__))
   today=currentDate()
   dateDir=os.path.join(currentPath,today)
   if not os.path.exists(dateDir):
     os.mkdir(dateDir)
     now=currentTime()
	 timeDir=os.path.join(dateDir,now)
   if not os.path.exists(timeDir):
     os.mkdir(timeDir)
   return timeDir	 
   
```

* 截图的代码
```
 def takeScreenshot(driver,savePath,picName):
   # 需要转码因为windows默认中文为gbk，而传入的utf-8
   picpath=os.path.join(savePath,str(picName).decode("utf-8").encode("gbk")+".png")
   try:
    driver.get_screenshot_as_file(filepath)
   except Exception,e:
    print(traceback.print_exec()) 	
```

* 测试主体的关键代码
```
 ...
 except AssertionError,e:
   # 断言异常里面执行截图操作
   takeScreenshot(driver,picDir,e)
```