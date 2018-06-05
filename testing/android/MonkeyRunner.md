# MonkeyRunner
### 一、概述
* MonkeyRunner是Android SDK中自带的一个和黑测试工具
* 与monkey没有什么关系。monkeyrunner则是在PC端通过API发送特定的命令和事件来控制设备
* monkey是直接运行在adb中在设备上

### 二、作用
* 对多个设备控制，功能测试，回归测试，截频。可以扩展api

### 三、模块
1. MonkeyRunner
   * 提供连接真机和模拟器方法waitForConnection(float timeout,string deviceid)，还有显示提示显示信息常用弹框
2. MonkeyDevice
   * 负责与设备的交互
   * 提供了安装和卸载程序包、开启Activity、发送按键和点击事件、运行测试包等方法
3. MonkeyImage
   * 主要是对图像处理的相关模块，对截频的图像进行操作
### 四、运行
* 方式1：直接在cmd中输入:monkeyrunner
* 方式2：在SDK中\tools文件夹下运行monkeyrunner.bat

### 五、使用
* 方式1：可以直接在进入monkeyrunner环境中运行
  ```
   # 需要先导入包
   from com.android.monkeyrunner import MonkeyRunner,MonkeyDevice,MonkeyImage
  ```
* 方式2：monkeyrunner test.py
  ```
    # test.py
    #-*-UTF-8-*-  
    from com.android.monkeyrunner import MonkeyRunner as mr  
    from com.android.monkeyrunner import MonkeyDevice as md  
    from com.android.monkeyrunner import MonkeyImage as mi  
    #连接设备  
    device=mr.waitForConnection(2,'192.168.56.101:5555')  
    device.installPackage('D:\\baiduliulanqi_186.apk')  
    #启动APP  
    device.startActivity('cmp=com.baidu.browser.apps/com.baidu.browser.framework.BdBrowserActivity')  
    mr.sleep(3)  
    #点击搜索框  
    device.touch(100,100,'DOWN_AND_UP')  
    mr.sleep(1)  
    #输入查询词  
    device.type('test')  
    mr.sleep(1)  
    #点击回车键  
    device.press('KEYCODE_ENTER','DOWN_AND_UP')  
    mr.sleep(2)  
    #截图  
    result=device.takeSnapshot()  
    #保存到文件  
    result.writeToFile('./test.png','png')  
    #清除搜索框  
    device.touch(100,100,'DOWN_AND_UP')  
    mr.sleep(1)  
    device.press('KEYCODE_DEL','DOWN_AND_UP')  
    mr.sleep(2)  
  ```

### 六、MonkeyRunner模块
1. waitForConnection()连接真机和模拟器方法
```
MonkeyRunner.waitForConnection()
# 等待连接设备，与模拟器链接，返回monkeydevice对象，代表链接的设备。有返回值说明连接成功。
```
2. alert对话框
```
 MonkeyRunner.alert('this is content','title','buttonContent')
 # 弹出一个警告框
```
3. choice对话框
```
 MonkeyRunner.choice('decription',['option1','potion2'],'title')
 # 下拉选择框。点击确定按钮返回的是选择项的index下标
```
4. input输入对话框
```
 MonkeyRunner.input('decription','init value','title','confirm','cancel')
 # 最后两个参数好像随意
 # 点击确定后返回的输入的值
```
5. sleep()休眠无响应.单位为秒
```
  MonkeyRunner.sleep(4)
```

### 七、MonkeyDevice模块
```
 # 下面所有方法是基于建立连接后的
 from com.android.monkeyrunner import MonkeyRunner as mr,MonkeyDevice as md
 device=mr.waitForConnection()
```
1. 拖拉控件drag(tuple start,tuple end,float duration,integer steps)  //duration手势持续时间
2. 按键press(string keycode,dictionary type) //keycode:KEYCODE_HOME
```
# 按下数字7
device.press("KEYCODE_7",md.DOWN_ANFD_UP)
```
3. 安装应用 installPackage(pc端存放apk路径)
* 安装一个apk，安装路径是绝对路径
```
 device.installPackage("C:\Users\Administrator\Happy.app")
```
4. 启动应用starActivity(package+'/'+activity)//一个参数
```
 # 启动应用计算器
 package="com.android.calculator2"
 activity="com.android.calculator2.Calculator"
 runComponent=package+'/'+activity
 device.startActivity(component=runComponent)
```
5. 点击touch(integer x,integer y, integer type) //type:DOWN,UP,DOWN_AND_UP...
6. 输入type(string message)
```
# 按下+号
device.type("+")
```
7. 截屏 takeSnapshot()
8. 查询包名
```
 device.shell("pm list package|grep note")
 # 查找为note的包名
```
9. 卸载removePackage("包名")
10. 获取属性
```
 device.getProperty("display.width")
 # 获取屏幕的宽度
```

### 八、MonkeyImage模块
* 下面所有方法是基于截频以后的操作
```
 from com.android.monkeyrunner import MonkeyRunner as mr,MonkeyDevice as md
 device=mr.waitForConnection()
 image=device.takeSnapshot()
```
1. ConvertoBytes将图像转换成字节码
2. getSubImage 获得局部图像
```
 subimge=image.getSubImage(286,596,190,190)
 # 获取图像的x,y,width,height
 subimage.writeToFile('6.png,'png')
 # 并保存图片
```
3. sameAs 2个MonkeyImage图片进行比较
```
subimge=image.getSubImage(286,596,190,190)
subimge.writeToFile('a.png','png')
subimge2=image.getSubImage(100,321,190,190)
subimge2.writeToFile('b.png','png')
subimge.sameAs(subimge2,0.9) #false
# 比较相似度90%，返回false，不相似
```
4. writeToFile将图片写到文件当中生成图片文件
5. getRawPixel(x,y)获取像素点αrgb

### 九、录制和回放
* SDK中没有，需要从monkeyRunner源码中拷取，放在sdk的tool文件夹下。
* 录制对应monkey_recorder.py，回放对应monkey_playback.py
#### 1. 录制
* 启动录制界面，会弹出一个MonkeyRecord窗口界面会弹出一个MonkeyRecord窗口界面，会把模拟器的动作同步到recorder里面
```
 py monkey_recorder.py 或者使用：monkeyrunner  monkey_record.py
```
1. 可以自动显示手机当前的界面
2. 自动刷新手机的最新状态
3. 点击手机界面即可对手机进行操作，同时会反应到真机，而且会在右侧插入操作脚本
4. 界面上的菜单按钮：
   * wait： 用来插入下一次操作的时间间隔，点击后即可设置时间，单位是秒
   * Press a Button：用来确定需要点击的按钮，包括menu、home、search，以及对按钮的press、down、up属性
   * Type Something：用来输入内容到输入框
   * Fling：用来进行拖动操作，可以向上、下、左、右，以及操作的范围
   *  Export Actions：用来导出脚本，不需要后缀名，也可以添加后缀名.mr
   * Refresh Display：用来刷新手机界面，估计只有在断开手机后，重新连接时才会用到
#### 2. 回放
```
 monkeyrunner monkey_playback.py C:\users\Administrator\test.mr
```
* 回放程序需要绝对路径！
* 需要在每个操作之间加上时延，否则回放是有问题
  ```
   WAIT|{'seconds':2.0,}
   # 暂停2秒钟
  ```