# 操作滚动条
* 有些时候，我们要控制一些模块，但是webdriver并没有提供相应的操作，所以我们可以使用JS来控制，例如操作滚动条

### 常用方法
1. 操作滚动条的到指定的高度
 ```
  scrollTo(xpos,ypos)
 ```
 * xpos	必需。要在窗口文档显示区左上角显示的文档的 x 坐标。【针对水平滚动条】
 * ypos	必需。要在窗口文档显示区左上角显示的文档的 y 坐标。 【针对垂直滚动条】

 ```
  js="window.scrollTo(0,100)"
  # 将垂直滚动条调到100px的位置
  driver.execute_script(js)
 ```
  * 滑动到底:js="window.scrollTo(0,document.body.scrollHeight)"
    

2. 操作滚动条到指定的元素的高度
  ```
   element.scrollIntoView() 
  ```
   * 参数默认为true。
   * 参数为true时调用该函数，页面（或容器）发生滚动，使element的顶部与视图（容器）**顶部对齐**；
   * 参数为false时，使element的底部与视图（容器）**底部对齐**。
   * TIPS：页面（容器）可滚动时才有用，即有滚动条才行。
  ```
   js="document.getElementById('choice').scrollIntoView(true)"
   driver.execute_script(js)
  ```  
3. 移动指定的位移量
  ```
   js='window.scrollBy(0,400)' # 向下移动400px
  ```
 
 