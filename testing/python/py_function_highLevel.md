# 高阶函数
### 概念
* 符合以下条件之一的函数就是高阶函数：
  1. 接受函数名作为形参
  2. 返回值中包含函数名
```

  def A():
      print("AAA")
  
  def B(func):
      func()  
  
  B(A)  #AAA  
```  