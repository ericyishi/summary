# ����ʧ�ܽ�ͼ

* �����ļ�·��
```

 def currentDate():
	today= time.strftime("%Y-%m-%d)
	return today
	
 def currentTime():
    now=timeStr.strftime('%H-%M-%S')
    return now

# �����ļ�·��	
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

* ��ͼ�Ĵ���
```
 def takeScreenshot(driver,savePath,picName):
   # ��Ҫת����ΪwindowsĬ������Ϊgbk���������utf-8
   picpath=os.path.join(savePath,str(picName).decode("utf-8").encode("gbk")+".png")
   try:
    driver.get_screenshot_as_file(filepath)
   except Exception,e:
    print(traceback.print_exec()) 	
```

* ��������Ĺؼ�����
```
 ...
 except AssertionError,e:
   # �����쳣����ִ�н�ͼ����
   takeScreenshot(driver,picDir,e)
```