# ADB常用指令
### ADB概念
* ADB-Android Debug Bridge，电脑和安卓设备之间的连接，调试通道。
* 存放于sdk的 xx\SDK安装路径\sdk\platform-tools 目录下

### 常用命令
* adb connect 127.0.0.1:62001 连接模拟器【62001是夜神模拟器的端口号，夜神模拟器需要单独安装】
* adb devices 查看连接的设备
* adb push/pull 在电脑和设备之间传数据
* adb forward 从电脑转发至手机端
  ```
   adb forward tcp:1080 tcp:1080 //将电脑端的端口1080转发至移动端1080端口
  ```
* adb start-server/kill-server adb服务开始与关闭
* adb install/uninstall 安装卸载app
  1. 安装
     ```
      adb install qq.apk
     ```
  2. 卸载
     ```
      adb uninstall 包名
     ```
     * **注意**卸载是需要获取包名的
* 查看包名的几种方式
  1. adb shell pm list packages 打印出设备安装的所有包信息 
  2. ①进入adb shell ②cd /data/data ③ls 
  3. ①\\\sdk\build-tools\android-4.4.2路径下运行cmd②输入：aapt dump badging 路径（将对应的app拖进来，即可得到对应的路径）
* adb shell 进入（android）的终端shell
* exit 退出adb shell

