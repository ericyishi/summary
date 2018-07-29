# python2 与python3共存
### 方式一：配置环境变量
1. 在环境变量的先后顺序决定了启动的python2还是python3

### 方式二：修改可执行文件
1. 两个python.exe改名，一个改成python2.exe，一个改成python3.exe。

### 方式三：使用py参数
1. 进入对应的环境
```
 py -2 # 进入python2的运行环境
 py -3 # 进入python3的运行环境
```
2. python脚本
```
 #! python2 #当python脚本需要python2运行时，只需在脚本前加上，然后运行py xxx.py即可
```
```
 #! python3
```
3. pip的解决
```
 # 当需要python2的pip时，只需
 py -2 -m pip install xxx
```
```
 # 当需要python3的pip时，只需
 py -3 -m pip install xxx
```