# 重签名
### 重签名的原因
* 首先需要知道，每个app都是有签名的，自动化测试程序也是一个app，而且自动化测试程序app和被测试的目标app是处于同一个进程的，所以它们的签名需要保持一致。自动测试app是有默认签名的，一般保存在C:\Users\用户名\.android下的debug.keystore里面，所以当只有被测试app的apk的时候，需要先把被测试apk的签名改为和自动测试app的默认签名一致。
* 所以自动化测试APK都必须对app重签名
### 重签名的方式：
#### 方式一：使用Re-Sign.jar
* **注意：**这种方式必须基于JDK是1.6的，从1.7开始就要使用方式二
* 下载地址
  ```
   http://troido.de/downloads/category/1
  ```
* 使用步骤
  1. 双击 Re-Sign.jar，启动界面
  2. 此时可能会报错，zipalign.exe未找到。
     * 从*\sdk\build-tools\25.0.1 中拷贝zipalign.exe 到 *\sdk\tools 目录下
  3. 把你的apk拖进去；
  4. 选中一个保存位置，点击图中的“保存”按钮，完成之后。
     * 此时会弹出一个成功的对话框。包含PackageName 和Activity。可以记住 
#### 方式二：使用命令
* 这个方式更稳妥，常用
* 使用步骤
  1. 用压缩软件打开apk，将里面的META-INF文件夹删除（META-INF里面包含签名信息）
  2. 打开cmd，输入命令
     ```
	    jarsigner -keystore C:\Users\Administrator\.android\debug.keystore -storepass android -keypass android C:\Users\Administrator\Desktop\safe.apk androiddebugkey
	 ```
	 * C:\Users\Administrator\.android\debug.keystore路径是保存**自动测试app**默认签名的keystore文件的绝对路径
     * C:\Users\Administrator\Desktop\safe.apk为被测试apk的绝对路径
	 * -storepass android，storepass是打开keystore文件的密钥，android是默认的密码
	 * -keypass android，就是默认签名的密钥，android是默认的密码
     * androiddebugkey是签名的别名，这个是默认值
	 * **注意:**JDK1.7 以后要增加算法
       ```
	     jarsigner -keystore C:\Users\Administrator\.android\debug.keystore -storepass android -keypass android -sigalg MD5withRSA -digestalg SHA C:\Users\Administrator\Desktop\safe.apk androiddebugkey
	   ```
  3. 优化android性能（下面的命令不是必须执行的，但执行后能获取到更好的性能）
     *  zipalign 4 签名前被测apk的绝对路径  签名后被测apk的绝对路径  
	 ```
	   zipalign 4 C:\Users\Administrator\Desktop\safe.apk D:\code\safe.apk 
     ```	 

  