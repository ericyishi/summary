# random模块
### 概述
* random模块包含一些对随机的方法。
### 使用
```
import random
dir(random) # 就能看到这个模块所包含的方法
```
### 常用方法
1. random()
* 生成**一个**0到1之间的随机浮点数，包括0但不包括1，也就是[0.0, 1.0)
```
 random.random()
```
2. randint()
* 生成范围内的**一个**整数，两边都是闭区间
```
random.randint(1,10) # 产生1至10（包含1与10）的一个随机数（整数int型） 
```
3. choice(seq)
* 从序列中随机选取一个元素。seq需要是一个序列，比如list、元组、字符串。
```
random.choice(seq)
 
random.choice([1, 2, 3, 5, 8, 13]) #list
 
random.choice('hello') #字符串
 
random.choice(['hello', 'world']) #字符串组成的list
 
random.choice((1, 2, 3)) #元组
```
4. sample(seq,n)
* 从序列中随机选取n个元素,返回是**列表**
* sample不改变原来序列
```
 random.sample((1, 2, 3),2) #[3,1]
 random.sample('abcdefghijklmnopqrstuvwxyz',2) #['x','f']
 
```
5. random.shuffle(x)
* 把序列x中的元素顺序打乱。
* shuffle直接改变原有的序列。
* 不支持字符串和元祖
```
 a=[1,2,3,4,5]
 random.shuffle(a) # 没有返回值，所以不能用print(random.shuffle(a))来输出打印打乱
 print(a)
```