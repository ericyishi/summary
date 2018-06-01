# 移动端测试环境
### ADT Bundle
* Eclipse ADT Bundle包含了Eclipse、ADT插件和SDK Tools，是已经集成好的IDE，只需安装好Jdk即可开始开发，推荐初学者下载ADT Bundle，不用再折腾开发环境。
* 下载后直接解压即可
* 使用前需要对java和sdk设置环境变量
  *  cmd输入命令：adb ，有内容即安装成功
1. SDK需要随时保持更新，所以还需要设置镜像代理
   * 打开目录下的SDK Manager.exe文件，弹出界面
   * 使用tools--options选项，设置镜像
     ```
      腾讯镜像地址：android-mirror.bugly.qq.com
      端口：8080
      或者使用：东软镜像地址：mirrors.neusoft.edu.cn
      端口:80
     ```
2. 开启虚拟模拟器【部分SDK下才有】
   * 在extras下面IntelX86建议开启，性能能有提升。
   * 如果开启后，还需要在sdk/extras/intel下面，双击intelhaxm-android.exe文件进行安装
