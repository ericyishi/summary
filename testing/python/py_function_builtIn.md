# 内置函数
* python内置的函数，无需引用
#### range()函数
#### 介绍
* 常搭配for循环一起使用
* 创建是整数列表
#### 用法
```
 range(start,stop,step)
 # stop是开区间
```
1. 返回的是对象【type(range(10)),得到<class 'range'>】。所以使用数据类型list之类的做接收是需要强转
```
 a=range(3)
 type(a)#<class 'range'>
 lis=list(range(10))
```
2. 与循环搭配使用
```
for i in range(3):
    print(i,end=" ") #0 1 2

```
### map()函数
#### 介绍
* map()是 python 内置的高阶函数
* 它接收一个函数 f 和一个 list，并通过把函数 f 依次作用在 list 的每个元素上，得到一个新的object并返回
```
def mymap(func,seq):
    mapped_seq=[]
    for item in seq:
        mapped_seq.append(func(item))
    return mapped_seq    

```
*python2返回列表，Python3返回迭代对象【如果需要list对象，还需要强制转化】
```
 # 仅首字母大写
def normalize(name):
    l=name[0].upper()
    l=l+name[1:].lower()
    return l
 
# 测试:
L1 = ['adam', 'LISA', 'barT']
L2 = list(map(normalize, L1))
print(L2)


```
### reduce()函数
