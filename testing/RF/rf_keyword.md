# 关键字
### Evaluate
* evaluate能让你直接运行python脚本。这样可以在Library没有给你提供你想要的方法时，直接用python脚本来实现你想要的方法。
  ```html
   # 格式：
     变量 evaluate python代码 引入库名
     ${nowTime}    evaluate     time.strftime("%Y/%m%d %H:%M:%S",time.localtime(time.time()))    time
  ```
  * 这样就可以利用python获取想要的时间格式
  
### log
* 打印
* log：适用于scalar变量，或者输出dict这类需要把符号变成$
* log many：**用于输出List、dict变量**  

### Run Keywords
* 后面跟多个参数
  ```
   Run Keywords log 123 AND 456
  ```
### 循环:FOR
* “FOR”关键字前面需要增加一个“:”，写成“:FOR”，其它与Python的语法相同。  
  ```html
   :FOR	${i}	IN 	1	2	3
    \	Log	${i}			
  ```
  * 值为1、2、3
  ```html
   :FOR	${i}	IN RANGE	1	10	2
    \	Log	${i}			
  ```
  * 值为1、3、5、7、9
 
### Evaluate
* 可以直接运行python
* 3个参数：
  * 表达式
  * 导入的模块，默认为None
  * 命名空间，默认为None
```html
 ${random}    Evaluate    random.randint(0,sys.maxint)    random,sys
 Log    ${random} 
```    
* 注意：也可以引入对上一步骤变量做计算，但需要加上引号
```html
 Log    Evaluate    len('${a}')
```