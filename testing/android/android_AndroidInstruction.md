# Android命令
### 概述
* Android命令可以用于查看当前android开发环境中的相关系统信息以及操作

### 常用命令
* android -h 查看帮助
```
 android -h create project
 # 查看创建项目的参数
```
* android sdk 打开SDK Manager.exe
* android avd 打开AVD Manager.exe
  ```
   存放在AndroidADT\sdk路径下
  ```
* android list avd 可以将所有avd信息列出
* android create avd 创建模拟器
  ```
   android create avd -n avdtest -t 2 -c 100M
  ```
* emulator @+模拟器名字 运行模拟器 
  ```
   emulator @aaa //运行模拟器aaa
  ```
* android delete avd -n avdtest 删除指定的模拟器
* android create test-project 创建项目
