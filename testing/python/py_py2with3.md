# python2 与python3共存
### 方式一：配置环境变量（将C:\Python36\Scripts\;C:\Python36\;C:\Python27\;C:\Python27\Scripts;配置到环境变量中）
1. 在环境变量的先后顺序决定了启动的python2还是python3

### 方式二：修改可执行文件
1. 两个python.exe改名，一个改成python2.exe，一个改成python3.exe。

### 方式三：使用py参数
1. 进入对应的交互环境
```
 py -2 # 进入python2的运行环境，也可以直接输入python2
 py -3 # 进入python3的运行环境，也可以直接输入python3
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
 py -2 -m pip install -i https://pypi.douban.com/simple xxx
```
```
 # 当需要python3的pip时，只需
 py -3 -m pip install xxx
```

### 方式四：修改文件名【推荐】
1. 两个版本都装，并加入环境变量中
2. 3版本修改：把python.exe，pythonw.exe改为python3.exe，pythonw3.exe
3. 2版本修改：把python.exe，pythonw.exe改为python2.exe，pythonw2.exe
4. 解决pip,两个版本重装pip：
   ```html
     python3 -m pip install --upgrade pip --force-reinstall，显示重新安装成功

     python2 -m pip install --upgrade pip --force-reinstall，显示重新安装成功

    ```
5. 运行
   ```html
     PYTHON3:
       python3
       pip3
     PYTHON2:
       python2
       pip2      
   ```    