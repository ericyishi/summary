# 与其他语言的差异
1. 没有&& ||
* 写成and or
2. 没有++、--
* 写成a+=1 a-=1
3. 三元运算符写法不一样【其他语言：result=条件?'执行表达式1':'执行表达式2'】
* python中没有其他语言中的三元表达式
* result= '执行表达式1' if 条件 else "执行表达式2"
  ```
   a = 1
   b = 2
   h = ""
   h = a+b if a>b else a-b
   print(h) #-1，条件为真，执行前面；
  ```
 4. 赋值
 * python中一行赋多个值不能中间逗号连接
 ```html
    a=1,b=2 #错误的写法，会提示can't assign to literal
    #正确写法如下：
    a,b=1,2 #左侧写变量右侧写值
    a=1;b=2 #中间分号分割
 ```