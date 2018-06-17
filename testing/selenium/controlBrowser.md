# 控制浏览器
1. 访问网页
   ```
    driver.get(visitURL)
   ```
2. 控制窗口大小
   * 有时希望以指定尺寸运行，例如移动端（480*800）
     ```
      driver.set_window_size(480,800)
      # 获取窗口尺寸,返回的是字典类型
      size=driver.get_window_size()
      size['width']
      size['height']
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
   ```
   * 一般用于断言是否已经成功打开某个页面
6. 获取当前页面url
   ```
    driver.current_url
   ```