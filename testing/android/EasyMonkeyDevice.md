# EasyMonkeyDevice
### 一、概述
* EasyMonkeyDevice比起MonkeyDevice兼容性更好，因为MonkeyDevice只能通过x,y坐标的方式，而EasyMonkeyDevice是通过控件id去获取的，即便在不同尺寸的设备上，也能准确选中元素。

### 二、如何获取组件的id
* 运行tools/hierarchyviewer.bat
* 运行后，就能抓取设备上启动的应用，选中生成控件树，就能获取到各个控件的id了。
* 上面还能看到组件的属性
  * 使用MonkeyDevice【注意：不是EasyMonkeyDevice】下面的getHierarchyViewer()方法的获取组件的属性
    ```
     # 获取数字0里面文本值属性
     hv=device.getHierarchyViewer()
     view=hv.findViewById('id/digit0')
     view.namedProperties.get('text:mText')
    ```
### 三、启用EasyMonkeyDevice
```
 # 先正常开启一个计算器的应用
 from com.android.monkeyrunner import MonkeyRunner,MonkeyDevice,MonkeyImage
 from com.android.monkeyrunner.easy import EasyMonkeyDevice,By
 device=MonkeyRunner.waitForConnection()
 device.startActivity('com.android.calculator2/.Calculator')
 # 启动EasyMonkeyDevice
 easy=EasyMonkeyDevice(device)
 # 可能会报错，因为view server没有开启。开启后就可以正常使用了
```
* view server【一般只有模拟器或者开发版本才有】
  * 启动命令： adb shell service call window 1 i32 4939
  * 查询当前view server设备的当前状态： adb shell service call window 3
  
###  四、常用操作
1. 点击按钮8
```
 easy.touch(By.id('id/digit8'),MonkeyDevice.DOWN_AND_UP)
```
* 'id/digit8'是hierarchyviewer获取到的
2. 获取应用的id
```
 easy.getFocusedWindowId()
```
3. 控件数字"7"是否可见
```
 easy.visible(By.id('id/digit7'))
```
4. 控件数字"1"是否存在
```
 easy.exists(By.id('id/digit1'))
```
5. 获取控件数字"2"的值
```
 easy.getText(By.id('id/digit2'))
```
6. 可以返回控件在应用中的具体位置
```
 easy.locate(By.id('id/digit7'))
```
* 返回(x,y,width,height)
