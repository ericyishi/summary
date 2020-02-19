# 连接真机的注意事项
1. 获取手机信息
```
 # cmd中输入
 adb devices
```
* 会把对应的连接显示出来，但是我们发现真机前面不是IP地址而是一个序列号，这样我们是没有办法连接的。（应该是低版本才不行，后面版本实测可以连接）
* 要连接ip，必须和自己PC的网络在同一个局域网内，adb不能跨局域网连接设备
2. 解决办法
```
 adb tcpip 5555
 adb connect 手机的ip:5555
 # 可以在设备上查看ip地址
```
* 再次使用adb devices命令就能发现序列号变成了ip

3. adb devices unauthorized解决办法
* 进行Android项目调试时，连接设备后，进行adb install xxx.apk时，偶遇adb device unauthorized。
```
 解决办法：
 开发者模式--调试--撤销usb调试授权
 再次打开开发者模式，就能解决
```

