# 模块与包
### 模块【module】
#### 模块的定义
* Python中，一个.py文件就是一个模块
#### 模块的好处
* 提高代码的可维护性
* 代码的重用性
* 避免函数名变量名冲突
#### 模块的导入方式
* import module #这种形式只能导入包名（或者叫模块）
  ```
   import math
   #导入了math包
   math.random(1,10)
   
   import math.random # 这样写就是错误的，random是函数名不能这样的方式引用
  ```
* from moudule import funcname
  ```
   from math import random
   #使用直接导入了math包下的random方法
   random(1,10)
  ```

* **注意**
  * 使用pycharm 将顶级包设为根目录，避免导入包出错。
    ```
     1. 鼠标右击顶级包文件夹
     2. 选择"mark directory as"--"Sources root"
    ```
  * 使用pycharm 用鼠标点击要调用的其他包的的方法，按住alt+回车，自动导入。


* **注意：**
  * 避免两个模块之间相互导包，会报错的！

### 包【package】
#### 包的定义
* 避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）
#### 包的注意事项
* 每一个包目录下面都会有一个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包

#### __init__.py文件的作用
* 标识该目录是一个python的模块包（module package）
* 简化模块导入操作，只要import这个包，就会执行对应的__init__.py文件

### 使用时候的注意事项
* if __name__ == '__main__'
  * __name__ 是当前模块名，当模块被直接运行时模块名为 __main__ 。这句话的意思就是，当模块被直接运行时，以下代码块将被运行，当模块是被导入时，代码块不被运行。

