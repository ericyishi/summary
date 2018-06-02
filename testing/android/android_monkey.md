# monkey
### 概述
* monkey是Android系统中自带的一个黑盒测试工具，一般通过随机触发界面事件，来确定应用是否会发生异常
  * 是伪随机，每一次都有一个seed值，出现问题可以将刚才的操作复现一次
* 多用于android应用的**稳定性和压力测试**
* monkey 是一个运行在模拟器或者Android设备中可以产生类似用户点击、触摸、手势以及一些系统级的伪随机事件流的程序
* 由adb来控制
  ```
   adb shell monkey [options] <event-count>
  ```
  * <event-count> 这里是指让monkey向系统发送多少次伪随机事件
  * 具体做什么操作就是options选项中

  
### 常用命令
* monkey的命令：http://www.android-doc.com/tools/help/monkey.html  
* 对某个程序进行monkey测试
  ```
   adb shell monkey -p 包名 次数
   adb shell monkey -p com.android.calculator2 100 //向计算器发送100个事件
  ```
* 指定日志级别的输出
  ```
   adb shell monkey -p 包名 -v 次数
   adb shell monkey -p com.android.calculator2 -v -v 100
  ```
  * 一个“-v”代表一个level，级别从level0-level2，级别越高输出信息越详细【默认是level 0】
  * 测试的时候，如果出现了异常是会记录下来的 
### monkey脚本
* adb shell monkey -f <script> 1
* -f 参数官方文档没有写明
  ```
   -f:后接测试脚本名，表示要使用monkey运行指定的monkey脚本，
    如：$ adb shell monkey -f /mnt/sdcard/test01 3
    注：这里的3是指循环次数，不是事件数
    如果希望重复执行之前的随机操作，需要加-s命令，可指定随机数生成器seed值
  ```
* 脚本主要命令
  1. DispatchPointer 按击事件，相当于将手指按在某个点上
  2. DispatchPress \[keycode\] 发送一个按键的值
  3. LaunchActivity(包名,activity包名) 启动应用的命令
  4. UserWait 让脚本的执行等待
  5. RotateScreen 翻转屏幕
  6. Tap 单机事件
  
* demo
  1. 编写脚本，保存为script后缀名
      ```
        # monkey.script
        # 96+7等操作并反转屏幕
        type=raw events
        count=10
        speed=1.0
        start data >>
        # 启动计算器
        LauchActivity(com.android.calculator2,com.android.calculator2.Calculator) 
        # 点击按键9
        DispatchPointer(0,0,0,400,500,0,0,0,0,0,0,0)
        # 弹起操作
        DispatchPointer(0,0,1,400,500,0,0,0,0,0,0,0)
        # 等待1500毫秒
        UserWait(1500)
        # 按键6
        DispatchPress(KEYCODE_6)
        UserWait(1500)
        # 加号
        DispatchPress(KEYCODE_PLUS)
        # 数字7，使用Tap命令(x,y,duration)
        Tap(100,500,50)
        # 等于号
        DispatchPress(KEYCODE_EQUALS)
        UserWait(1500)
        # 翻转角度(角度【0：0度,1：90度,2：180度,3：270度】,是否保留)
        RotateScreen(2,1)
      ```
  2. 上传脚本至设备上面
     * 在存放脚本的文件夹运行cmd
     ```
      adb push monkey.script /data/temp/monkey.script
     ```
  3. 运行脚本
     ```
      adb shell monkey -f /data/temp/monkey.script 1
     ```
     * 脚本运行后，可能不是我们想要的，原因在与不同的模拟器，屏幕大小不一样，所以通过上面x,y坐标来定位可能得到不想要的值
  
  
  
   