# 基础数据类型
### 标准的数据类型6大类：
* Number【数字】
* String【字符串】 " "
* List【列表】 \[ \]
  * 有的地方，也把它称作数组
* Tuple【元组】（）
* Sets【集合】{}
* Dictionary【字典】键值对
```
 * Python中的变量是没有类型的，我们可以把它看做一个(*void)类型的指针
 * 变量是可以指向任何对象的，而对象才是有类型的。
 * 而且Python中的对象有不可变【指内存地址】对象（number，string，tuple）和可变
对象之分（list,sets,dict）。
```

### 查看数据类型有的方法
```
 help(数据类型)
 按回车查看更多
```
```
 help(list)
```

### 数字型
1. 分类
   * int 整型
   * float 浮点数
   * complex 复数【complex(a,b)】
2. 数值类型转换
   * input获取的内容，都是字符串类型
     * 可以使用type()验证
   ```
    a=int(input("请输入一个数："))
   ```
### 字符串
1. 定义字符串
* 使用引号('或")来创建字符串
```
 str="this is a string"
```
2. 字符串运算符
   * 字符串连接【使用+】
      ```
       str1="hey"
       str2="man"
       print(str1+str2)  # heyman
      ```
      * 使用逗号“,”,两个字符串之间有空格
        ```
         str1="hey"
         str2="man"
         print(str1+str2)  # hey man
        ```
      * 同种类型之间的连接，都可以使用加号

3. 字符串函数
  ```
   str = "hello world"
  ```
  * len() 返回字符串长度
    * 这是一个全局的函数
    ```
     格式：len(字符串)
     len(str)
    ```
  * count() 返回出现的次数
    ```
     格式：字符串.count("需要统计的字符串")
     print(str.count("l")) # 3
    ```
     * 也可以统计指定字符串长度的统计
       ```
         print(str.count("l", 0, 3))// # 1
       ```
  * split("指定字符分隔",（分隔符第几次出现）)
    ```
     print(str.split("l", 1))  # ['he', 'lo world']，以第一次出现的l来分隔字符串

     print(str.split("l"))  # ['he', '', 'o wor', 'd'] ，以l来分隔字符串
    ```
  * "分隔符".join(list|str|dict|tuple|sets) 可以将其他数据类型的数据，按指定分隔，转化为字符串
    * 里面的元素要是字符串才能够使用
    * 字典元素拼接的只是键
    ```
     t1 = ("a", "b", "c", "d", "e")
     str1 = "-".join(t1)
     print(str1)// "a-b-c-d-e"
    ```
    ```
     str2 = "哈哈哈哈哈"
     print(",".join(str2))//"哈,哈,哈,哈,哈"
    ```
    ```
     l1 = ["1", "2", "3"]
     print("abc".join(l1)) //"1abc2abc3"
    ```
    ```
     dic = {"01": "lee", "02": "rebeta"}
     print("&".join(dic)) //"01&02"
    ```
    ```
     lis = {"zhang", "wang", "lee"}
     print("&".join(lis)) //"lee&zhang&wang"

    ```

  * capitalize() 将字符串的第一个字母转化成大写
    ```
     print(str.capitalize()) # Hello world
    ```
  * center(length,"字符")
    * length长度大于原来字符串的长度，否则也没有任何效果
    * 字符只能一位，多了也会报错【 exactly one character long】

    ```
     print(str.center(25, "*")) # *******hello world*******
    ```
  * find 找到返回下标，找不到返回-1
    ```
     格式： 字符串.find()
     print(str.find("o")) # 4
     print(str.find("x")) # -1
    ``` 
  * index() 找到返回下标，找不到报错【与find的区别】
    ```
     print(str.index("l")) # 2
     print(str.index("x")) # ValueError:substring not found
    ```
  * replace("old","new") 新元素替换旧元素
    ```
     print(str.replace("el", "我")) #h我lo world
    ```
  * endswith()用于判断字符串是否以指定后缀结尾，如果以指定后缀结尾返回True，否则返回False。
    ```
     str="hello world"
     str.endswith("world") # True
    ```
  * startswith() 与上面类似，但是判断开头
  * isalNum() 判断字符串中所有值都为数字或者字母且不含有空格，则返回true
    ```
     str = "hello world"
     str2 = "hello"
     str3 = "12345"
     print(str.isalnum())  # false,有空格也会返回false
     print(str2.isalnum())  # true
     print(str3.isalnum())  # true
    ```
  * isalpha() 判断字符串中所有值都为者字母且不含有空格，则返回true
    ```
     str = "hello world"
     str2 = "hello"
     str3 = "12345"
     print(str.isalpha())  # false,有空格也会返回false
     print(str2.isalpha())  # true
     print(str3.isalpha())  # false
    ```
  * isdigit() 判断字符串中所有值都为者数字且不含有空格，则返回true
    ```
     str = "321 123"
     str2 = "hello"
     str3 = "12345"
     print(str.isdigit())  # false,有空格也会返回false
     print(str2.isdigit())  # false
     print(str3.isdigit())  # true
    ```
  * islower() 判断是否不含大写字母，可以含空格，返回true
    ```
     str6 = "aa12c"
     str7 = "aa aa"
     str8 = "aA"
     print(str6.islower()) # true
     print(str7.islower()) # true
     print(str8.islower()) # false
    ```
  * isupper() 判断是否都为大写字母，可以有空格，返回true
    ```
     str6 = "aa12c"
     str7 = "aa aa"
     str8 = "aA"
     str9 = "AB C"
     print(str6.isupper()) # false
     print(str7.isupper()) # false
     print(str8.isupper()) # false
     print(str9.isupper()) # true
    ```
  * upper() 所有字母都变成大写
    ```
     str7 = "aa aa"
     print(str7.upper()) # AA AA
    ```
  * lower() 所有字母都变成小写
    ```
     str8 = "aA"
     print(str8.lower()) #aa
    ```
  * isspace() 判断字符串中第一位是否空格，返回true
    ```
     str9 = "hello world"
     str10 = "     "
     str11 = ""
     print(str9.isspace())  # false
     print(str10.isspace())  # true
     print(str11.isspace())  # false
    ```
  * istitle() 检查字符串中的单词的首字母是否都是大写开头，是返回true
    ```
     str12 = "Hello World"
     str13 = "Hello world"
     print(str12.istitle())  # true
     print(str13.istitle())  # false
    ```
  * strip() 用于移除字符串头尾指定的字符（默认为空格）

### 列表【List】
1. 定义
   * 使用 [],中间的值以,分隔
     ```
      l_test1 = [1, "hah", "ac", 65]
     ```
   * 具有索引，下标从0开始
     ```
      l_test1[0] # 1
     ```
2. 列表的操作
   1. 修改值
      ```
       l-t1[1]="jerry"
       print(l_t1) # [1, "jerry", "ac", 65 ]
      ```
   2. 删除del()
     * 也可以不使用括号
      ```
       del l_t1[0]
      ```
      ```
       del(l_t1[0])
       print(l_t1)  # [ "jerry", "ac", 65 ]
       del(l_t1)
       print(l_t1) #NameError: name 'l_test1' is not defined
      ```
   3. 清空内容.clear()
      ```
       l-t1.clear()
       print(l_t1) # []
      ```
   4. 连接列表
      ```
       l_t2 = ["123", "ac", 3]
       l_t3 = ["new", "hey", "on"]
       l_after = l_t1 + l_t2  # 结果为：[1, 'hah', 'ac', 65, '123', 'ac', 3]

      ```
3. 列表的方法
   1. 增
       1. append(obj) 列表末尾增加新的内容,把整个对象都放进去
		 ```
		   l_t2 = ["123", "ac", 3]
		   l_t2.append(10)
		   print(l_t2) # ["123", "ac", 3,10]
		   l_t2.append([10])
		   print(l_t2) # ["123", "ac", 3,10,[10]]
		 ```
	   2. insert(index,content) 将内容插入列表的指定位置，原来位置上的往后移
			 ```
			  l_t2 = ["123", "ac", 3]
			  l_t2.insert(1,"haha")
			  print(l_t2) # ["123","haha", "ac", 3]
			 ``` 
	   3. extend(seq) 扩展。向一个列表中添加另一个列表
			* 是把元素里面的值一个个放入
			* **注意**当添加内容是一个字符串的时候，会拆分成单个元素添加进去，这就是与append区别
			  ```
				l_t2 = ["123", "ac", 3]
				l_t3 = ["new", "hey", "on"]
				l_t2.extend(l_t3)
				print(l_t2) # ['123', 'ac', 3, 'new', 'hey', 'on']
				l_t3.extend("abc")
				print(l_t3) # ['new', 'hey', 'on', 'a', 'b', 'c']
			  ```
	2. 删
	   1. pop(index) 移除元素，不传参数是最后一个
          * 返回移除的元素
			 ```
			  l_t2 = ["123", "ac", 3]
			  l_t2.pop(1)
			  l_t3 = ["new", "hey", "on"]
			  l_t3.pop()
			  print(l_t2) # ['123', 3]
			  print(l_t3) # ['new', 'hey']
			 ```
	   2. remove(obj) 移除列表中某个值的第一个匹配项
			 * 没有返回值
			 * 比较常用
			 ```
			 l_t5 =["ok",1,"haha",2,3,"2",1]
			 l_t5.remove(1)
			 print(l_t5)  # ['ok', 'haha', 2, 3, '2', 1]
			 ```
	   3. 删除整个变量
          ```
		   del l_t5
		  ```		   
	3. 改
	    * 使用下标
		   ```
		    l_t5 =["ok",1,"haha",2,3,"2",1]
			l_t5[0]=99
			print(l_t5) # [99,1,"haha",2,3,"2",1]
		   ```
	4. 查
	   1. index() 查找某个值第一次出现的索引值，不存在是会报错的【列表没有find方法】
		 ```
		  l_t4 = [1, [2,[3]],[3], 3, "123", "ac", 3]
		  l_t4.index(3) # 3
		  print(l_t2.index([3])) # 2
		  print(l_t2.index(9)) # 9 is not in list
		 ```
		 * 应用:提取
		   ```
		    print(name[name.index("zhangsan")]) #zhangsan
		   ```
    5. 其他
	   1. 统计某个元素在列表中出现的次数
	      * count() 
		  ```
			l_t4 = ["123", "ac", 3, 10, [10]]
			print(l_t4.count(10)) # 1
	      ```
   
       2. 倒序
	      1. reverse() 
		  ```
		   l_t5 =["ok",1,"haha",2,3,"2",1]
		   l_t5.reverse()
		   print(l_t5) # [1, '2', 3, 2, 'haha', 1, 'ok']
		  ```
          2. 也能使用切片
			```
			 l_t5 =["ok",1,"haha",2,3,"2",1]
			 l_t5[::-1]
			 print(l_t5) # [1, '2', 3, 2, 'haha', 1, 'ok']
			```
       3. 排序			
	      1. sort() 
			 * 会对原来的列表进行修改
			 * 默认是升序,按ASCII码来的。
			 * reverse=True 是降序，注意关键字True首字母要大写
			 ```
			  l_t5 = [9, 1, 4, 5, 77, 22]
			  l_t6 = [1, 5, 7, 8, 2, 66]
			  l_t5.sort()
			  l_t6.sort(reverse=True)
			  print(l_t5) # [1, 4, 5, 9, 22, 77]
			  print(l_t6) # [66, 8, 7, 5, 2, 1]
			 ```
	      2. sorted() 排序
			 * 不会修改原来的内容，而是将排序后的结果返回一个新的列表
			 ```
			  l_t5 = [9, 1, 4, 5, 77, 22]
			  l_t6 = [1, 5, 7, 8, 2, 66]
			  print(sorted(l_t5)) # [1, 4, 5, 9, 22, 77]
			  print(sorted(l_t6,reverse=True)) # [66, 8, 7, 5, 2, 1]
			  print(l_t5) # [9, 1, 4, 5, 77, 22]
			  print(l_t6) # [1, 5, 7, 8, 2, 66]
			 ```
       4. 浅复制
	      * copy()
		    1. 情况1
				```
				 a = [1,2,3,4,5]
				 b = a.copy()
				 a[3]='hey'
				 print(a) # [1,2,3,'hey',5]
				 print(b) # [1,2,3,4,5]
				```
			2. 情况2:有个子列表，修改会对两个同时修改，因为是copy的内存地址
			   ```
			     a = [1,2,3,[41,42],5]
				 b = a.copy()
				 a[3][0]='hel'
				 print(a) # [1,2,3,['hel',42],5]
				 print(b) # [1,2,3,['hel',42],5]
			   ```
			3. 浅拷贝几种方式：
               1. 默认方式
                  ```
				   person=['name',['saving',100]]
				   p1 = person.copy()
				  ```	
               2. 引入copy模块
                  ```
				   import copy
				   p2=copy.copy(person)
                  ```	
               3. p3=person[:]		
               4. p4=list(person)			   
	   5. 深拷贝【本质来说就是for循环，新开辟了一块内存地址】
          需要引入copy模块
          ```
		   import copy
		   a = [1,2,3,[41,42],5]
		   b = copy.deepcopy(a)
		   a[3][0]='hel'
		   print(a) # [1,2,3,['hel',42],5]
		   print(b) # [1,2,3,[41,42],5]
          ```		  
### 元组
1. 定义
   * 使用 ()，添加元素并使用逗号,分隔
   ```
    tup_a = (1, "1sd", "hello")
   ```
   * 单个元素的元组要在后面加上逗号，例如（1,）
     ```
      >>> a=(1,2)
      >>> b=(3)
      >>> c=a+b
      Traceback (most recent call last):
        File "<interactive input>", line 1, in <module>
      TypeError: can only concatenate tuple (not "int") to tuple
      >>> d=(3,)
      >>> c=a+d
      >>> print c
      (1, 2, 3)
     ```
   * **元组的元素无法修改**，但对于元组内有列表，那么是可以改变列表里的值

     ```
      tup_c = (1, ["hello", 2, 3], "1sd", "hello")
      tup_c[1][0]="zhang"
      print(tup_c)  # (1, ['zhang', 2, 3], '1sd', 'hello')
     ```
      * 不允许修改的是内存地址，所以修改列表里面的值，是不影响元组分配列表的地址。

2. 常用操作
   ```
    tup_a = (1, "1sd", "hello")
    tup_b = (3, 4)
    ls_a = [1, 2]
    print(tup_a[1]) # 1sd
    print(len(tup_a)) # 3
    print(tup_a[::-1]) # ('hello', '1sd', 1)
    print(tup_a[:-1]) # (1, '1sd')
    print(tup_a + tup_b) # (1, '1sd', 'hello', 3, 4) 元组之间也可以使用+进行连接
    print(tuple(ls_a) + tup_a) # (1, 2, 1, '1sd', 'hello')
   ```
3. 常用方法
   1. count()
      ```
	    a=(1,1,3,4)
		a.count(1) # 2
	  ```
   2. index()
      * 如果给的值有多个，返回第一个值的下标位置
      * 如果给的值不存在，报错
        ```
		 a=(1,1,3,4)
		 a.index(1) # 0
		 a.index(2) # ValueError
		 a.index(3) #2
        ```		

### 集合
1. 定义
   * 使用 {}，以,分隔
   * 无序的，不重复的元素集，所以没有下标，也不能进行切片
     ```
      lis={"zhang","wang","lee","zhang"}
      print(lis)//{'zhang', 'wang', 'lee'}自动去重复
     ```
   * 支持交、并、差集、对称差集等集合运算
   * 因为无序，每次打印输出的结果的位置也是变化的
   ```
    s={1,2,3,4,5}
    或者
    s=set()
   ```
   * 使用set()方式，可以将其他类型的数据强制转化为集合类型,但是字符串达不到预期效果
     ```
      sets_c = set({"a", 1, 2, "b", 2})
      sets_d = set(["a", "1", "2", "b", "2"])
      print(sets_c) # 去重 {1, 2, 'b', 'a'}
      print(sets_d) # 列表转化成集合，并去重了{'a', 'b', '1', '2'}
      sets_e = set("1,2,3")
      print(sets_e) # {',', '1', '2', '3'}

     ```
2. 常用操作
   * 添加元素
     ```
      s={1,2,3,4,5}
      s.add(12)
      print(s) # {1, 2, 3, 4, 5, 12}

     ```
   * 删除一个元素
     ```
      s={1,2,3,4,5}
      s.remove(2)
      print(s) # {1, 3, 4, 5}
     ```
   * 删除整个集合
     ```
      s={1,2,3,4,5}
      del(s)
      print(s) # NameError: name 's' is not defined
     ```
3. 集合运算
   * 并集
     ```
      a=t|s
     ```
   * 交集
     ```
      b=t&s
     ```
   * 差集【项在t中，但不在s中】
     ```
      c=t-s
     ```
   * 对称差集【项在t或s中，但不会同时出现两者中】
     ```
      d=t^s
     ```
### 字典
1. 定义
   * 使用 {键1:值1,键2:值2}
   * 通过键来存取元素的，不是索引
   * 根据键获取来获取值
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      print(dic_a["d1"]) # haha
     ```
2. 常用方法
   * update() 向另一个字典里添加一个字典
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      dic_b = {"1": 123}
      dic_a.update(dic_b)  # 将dic_b追加到dic_a
     ```
   * get() 获取指定的键。就返回none。
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      print(dic_a.get("d1")) # haha
      print(dic_a.get("d3"))  # none
     ```
   * setdefault() 可以通过键获取值，若键不存在，会默认添加为添加键值，值为none。
     * 所以也可以用这个方法直接添加键值
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      print(dic_a.setdefault("d1")) # haha
      print(dic_a.setdefault("d3")) # None
      print(dic_a) # {'d1': 'haha', 'd2': 'hehe', 'd3': None}
      print(dic_a.setdefault("wang", "33")) # 33
      print(dic_a) # {'wang': '33', 'd1': 'haha', 'd2': 'hehe', 'd3': None}
     ```
   * clear() 清除所有键值元素
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      dic_a.clear()
      print(dic_a) # {}
     ```
   * values() 返回所有的值
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      print(dic_a.values()) # dict_values(['haha', 'hehe'])
     ```
   * keys() 返回所有键
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      print(dic_a.keys()) # dict_keys(['d1', 'd2'])
     ```
   * items() 将所有字典项以列表返回，这些列表每一项都包含key和value
     ```
       dicts={"username":"zhang","age":12}
       content=dicts.items() #[('username','zhang'),('age':12)]
       for k,v in content:
            print("key is %r",k)
            print("value is %r",v)
     ```
   * copy() 深度拷贝
     ```
      dic_a = {"d1": "haha", "d2": "hehe"}
      dic_c = dic_a.copy()
      print(dic_a==dic_c) # True
      print(id(dic_c)) # 4164704
      print(id(dic_a)) # 4164424
     ```
   * fromkeys() 创建一个新字典，以seq作为键【可以是多个值】，值只能有一个
     ```
      # dict 对象是固定的写法

      seq = ['name', 'age', 'sex']
      value = 10
      dic_d = dict.fromkeys(seq, value)
      print(dic_d) # {'sex': 10, 'age': 10, 'name': 10}
     ```

### 切片

 * 取值范围是**[a,b)**
 * 适用类型：只要有索引的，都可以应用
   ```
    str = "hello world";
    str[0:3]   # 取值是hel
	str[:3]  # 取值是hel，前面是0，也可以省略
   ```
 * 按步长截取[startIndex:endIndex:step]
   * 步长默认是1
   ```
    str = "hello";
    str[0:3:2]  # 取值是hl,每隔一个取值
   ```
   * 步长为负，是倒序输出。
   ```
    str[::-1]  # dlrow olleh
    str[3::-1] # lleh,倒序将下标0至3的值输出
   ```
 * 反向截取，从-1开始表示最后一个
   * 注意切片是从左开始数，所以注意顺序
   ```
    str[-1] # 输出最后一位d
    str[-1:] # 输出最后一位d
    str[:-1] # 输出：hello worl
    str[-3:-1] # 输出：rl，从倒数第三位到倒数第二位（最后一位取不到）
    str[-3:] # 输出：rld，从倒数第三位到最后

   ```

### 不同类型之间的转换