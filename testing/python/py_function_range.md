# range()函数
### 介绍
* 是python内置的函数，无需引用
* 常搭配for循环一起使用
* 创建是整数列表
### 用法
```
 range(start,stop,step)
 # stop是开区间
```
1. 返回的是对象【type(range(10)),得到<class 'range'>】。所以使用数据类型list之类的做接收是需要强转
```
 lis=list(range(10))
```