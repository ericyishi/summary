# 一些坑

### 配置
1. 问题1：appium运行脚本automationName=“uiautomator2”，提示Could not sign with default certificate.
   ```
    提示：Could not sign with default certificate. 如下：
    Original error: Could not sign with default certificate.
    Original error Command ''E:\Program Files (x86)\Java\jdk1.8.0_45\bin\java.exe' -jar '
    C:\Program Files (x86)\Appium\resources\app\node_modules\appium-adb\jars\sign.jar' '
    C:\Program Files (x86)\Appium\resources\app\node_modules\appium-uiautomator2-server\apks\appium-uiautomator2-server-debug-androidTest.apk

   ```
   * 排查：通过日志，查到apk的文件路径中存在该apk，通过升级appium_desktop （cmd命令：npm update -g appium ）,后重新运行，依旧会出现这个提示
   * 解决办法：**以管理员身份**运行该软件后解决该问题：右键appium图标，以管理员运行，然后就解决了

2. 问题2：Appium 使用 automationName 框架为 uiautomator2 识别元素失败。切换 automationName 框架为 Appium 识别元素成功
   * 解决办法：
     1. appium版本要高于1.63
     2. 启动的时候要声明automation版本。automationName="uiautomator2"
     3. 保障5037端口不被占用。netstat -ano | findstr 5037

3. 问题3：软件盘无法输入中文
   * 解决办法：
     ```
      # 初始化时配置这两个参数
      unicodeKeyboard=true #unicodeKeyboard是使用unicode编码方式发送字符串
      resetKeyboard=true #resetKeyboard是将键盘隐藏起来
     ```
     * 这样就可以使用driver的sendkeys方法
     * 如果还有乱码，可以在“#-*-coding:utf-8-*-” 前面再加一条“#-*-coding:gb18030-*-”
     *