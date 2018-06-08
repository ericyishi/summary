# Robotium Recorder插件
### 安装
1. 打开Eclipse，单击"Help">"Install New Software ..."菜单项
2. 在"Work with"后的文本框中输入：http://recorder.robotium.com/updates
3. 在下方出现"Robotium"信息内容，选中"Robotium"，然后取消"Contact all update sites during install to find required software"选项，一路单击"Next"按钮

### 使用
1. 重新启动Eclipse以后，就可以开始使用Robotium Recorder了。单击"File">"Other..."菜单
2. 按着提示选择apk的路径或者被测项目
3. 此时会在apk所在路径下生成一个“文件名.debug.apk”
4. 点击new robotium test按钮，在弹出的模拟器，就可以开始录制脚本了
5. 录制好后，关闭模拟器，“stop Recording”，save as
6. 右键run as--“Android Junit Test”就可以回放了

* 注意：这种方式不能保证100%正确，所以不能完全依赖。只能减轻工作量。