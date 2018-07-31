# 控制浏览器
1. 访问网页
   ```
    driver.get(visitURL)
   ```
2. 控制窗口大小
   * 有时希望以指定尺寸运行，例如移动端（480*800）
     ```
	  # 设置窗口尺寸
      driver.set_window_size(480,800)
      # 获取窗口尺寸,返回的是字典类型
      size=driver.get_window_size() #{'width': 480, 'height': 800}
      print(size['width'])
      print(size['height'])
	 
     ```
	 ```
	   def test_windowSize(self):
        winsize=self.driver.get_window_size()
        self.driver.set_window_size(width=800,height=400) # 也可以直接赋值
        winsize2=self.driver.get_window_size(windowHandle='current') #默认的句柄就是当前窗口，也可以不写
        print(winsize) # {'width': 1382, 'height': 744}
        print(winsize2) # {'width': 800, 'height': 400}
	 ```
   * 窗口最大化
     ```
      driver.maximize_window()
     ```
3. 浏览器的后退与前进
   * driver.back()
   * driver.forward()

4. 手动刷新
   * driver.refresh()
   
5. 获取浏览器的title
   ```
    driver.title
	assert self.driver.title.find(u"百度一下")>0,"assert error" # 断言是否打开百度网页，通过网页head标签里的title确定
	# 注意找不到返回的是-1
   ```
   * 一般用于断言是否已经成功打开某个页面
6. 获取当前页面url
   ```
    driver.current_url
   ```
7. 获取和设置浏览器的位置
   ```
    position=driver.get_window_position() # 获取
	driver.set_window_position(x=300,y=0) # 设置
   ``` 
   ```
     def test_getPostion(self):
       postion=self.driver.get_window_position()
       print(postion) # {'y': -8, 'x': -8}
       print(postion['x']) # -8
       self.driver.set_window_position(x=300,y=0)
       print(self.driver.get_window_position()) # {'y': 0, 'x': 300}
   ```   
   * 获取坐标返回的是字典
   * 部分浏览器获取设置坐标方法会失效