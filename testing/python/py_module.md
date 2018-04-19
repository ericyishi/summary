# 模块与包
### 模块【module】
#### 模块的定义
* Python中，一个.py文件就是一个模块
#### 模块的好处
* 提高代码的可维护性
* 代码的重用性
* 避免函数名变量名冲突
#### 模块的导入方式
* import module
  ```
   import math
   #导入了math包
   math.random(1,10)
  ```
* from moudule import funcname
  ```
   from math import random
   #使用直接导入了math包下的random方法
   random(1,10)
  ```

* **注意：**
  * 避免两个模块之间相互导包，会报错的！

### 包【package】
#### 包的定义
* 避免模块名冲突，Python又引入了按目录来组织模块的方法，称为包（Package）
#### 包的注意事项
* 每一个包目录下面都会有一个__init__.py的文件，这个文件是必须存在的，否则，Python就把这个目录当成普通目录，而不是一个包
