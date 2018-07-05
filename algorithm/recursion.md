# 递归
### 定义
* 如果一个函数在内部调用自身本身，这个函数就是递归函数

### 一般写法
* fact(n)可以表示为n*fact(n-1),但是为1的时候需要单独处理
```
 def fact(n):
    if n==1:
	  return 1
	return n*fact(n-1)  
```
```
 def sum_cycle(n):
    '''
    1 to n,The sum function
    '''
    sum = 0
    for i in range(1,n + 1): #range取值范围结束是开区间
        sum *= i
    return sum
```
* 上面两种写法代码实现了功能，但是但第一种写法数值大的话，是会栈溢出的(当数值为1000的时候)
* 函数调用是通过栈（stack）这种数据结构实现的，每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。
```
 RuntimeError: maximum recursion depth exceeded
```
### 优化写法
* 解决递归调用栈溢出的方法是通过尾递归优化，事实上尾递归和循环的效果是一样的，所以，把循环看成是一种特殊的尾递归函数也是可以的。
* 尾递归是指，在函数返回的时候，调用自身本身，并且，return语句不能包含表达式。这样，编译器或者解释器就可以把尾递归做优化，使递归本身无论调用多少次，都只占用一个栈帧，不会出现栈溢出的情况。
```
 def fact(n):
    return fact_iter(n, 1)

 def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)
```
* return fact_iter(num - 1, num * product)仅返回递归函数本身，num - 1和num * product在函数调用前就会被计算，不影响函数调用

### 应用：斐波拉切函数
1. 普通写法：
```
 # 递归
def Fib(n):
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return Fib(n - 1) + Fib(n - 2)
```	

2. 优化写法【使用yield】
```
 def Fib_Yield(n):
    a, b = 0, 1
    while n > 0:
        yield b
        a, b = b, a + b
        n -= 1


def Fib(n):
    # return [f for i, f in enumerate(Fib_Yield(n))]
    return list(Fib_Yield(n))
	
print(Fib(10))	
```