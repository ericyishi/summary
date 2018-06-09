# uiAutomator
### 概述
* 是Android自带的，V4.1后才有，所以平台版本大于16的才有
* 可以跨应用，几乎所有的人工操作都可以模拟
* 权限较低，无法像instrumentation一样获取应用的较高权限。很多Android API不能使用。
### 创建项目
1. 创建Java项目，File-New-JavaProject（注意不是像robotium选Android Test Project）
2. 输入Project Name，选择JRE自己的版本，project layout选第二个“create separate...”
3. 添加依赖包。在配置中“Libraries”，选择Add External JARS：android.jar,uiautomator.jar【*\sdk-windows\platforms\对应的android版本下】
4. 添加JUnit库。Libraries-AddLibrary-Junit-Junit4-Finish，添加AddLibrary，选择JUnit之后再选择JUnit4，点击Finish；
5. 新建测试类。继承父类UiAutomatorTestCase
6. 编写代码。
   ```
    public class TestUi extends UiAutomatorTestCase{
      public void testHome(){
        UiDevice.getInstance().pressHome()
      }
    }
   ```
### 运行【在dos环境运行的方式】
1. 查看平台id
   ```
    android list target
   ```
2. 生成编译文件
   ```
    android create uitest-project –n <name> -t<android-Sdk-id> -p <path>
    android create uitest-project –n FirstUi -t 1 -p D:\code\TestUi
   ```
   * –n <name>,将来生成jar包的名字
   * -p <path>，是我们工程的路径地址
   * -t<android-Sdk-id> ，即为上一步找到平台id
   * 命令运行之后，在工程的根目录下生成build.xml文件
3. 编译。进入编译文件所在的目录，然后运行ant build【ant 需要安装，并配置环境变量】
   * 编译成功，生成一个jar包
4. 将jar包push到设备（模拟器）
   ```
    adb push <jar文件所在路径> data/local/tmp
    adb push bin\FirstUi.jar /data/local/tmp
    //注意上面斜杠的方向
   ```
5. 运行
   ```
    adb shell uiautomator runtest <jar文件名>-c <包名.类名#方法名>
    adb shell uiautomator runtest FirstUi.jar -c com.imooc.UiTest.TestUi#testHome
   ```