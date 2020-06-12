# SYS模块
### 概述
* sys模块负责程序与python解释器的交互，提供了一系列的函数和变量，用于操控python的运行时环境。
### 使用
```
import sys
```
### 常用方法
1. sys.path 对应调用python解释器的脚本所在的目录。 其实就是存放需要运行的代码的路径
   * 存放的是python的环境变量
   * 所有的模块都放在这些路径下的某一个
2. sys.version  python的版本信息
3. sys.argv  是获取运行python文件的时候命令行参数，且以list形式存储参数
   * sys.argv[0] 代表当前module的名字
   