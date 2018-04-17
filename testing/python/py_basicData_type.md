# 基础数据类型
### 标准的数据类型6大类：
* Number【数字】
* String【字符串】
* List【列表】
* Tuple【元组】
* Sets【集合】
* Dictionary【字典】

* 其中可变数据2个：List【列表】和 Dictionary【字典】

### 数值型
1. 分类
   * int 整型
   * float 浮点数
   * complex 复数
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
       print(str1+str2)  # hey man
      ```

   * 切片
     * 取值范围是[a,b)
       ```
        str = "hello world";
        str[0:3]   # 取值是hel
       ```
     * 按步长截取[startIndex:endIndex:step]
       ```
        str = "hello";
        str[0:3:2]  # 取值是hl,每隔一个取值
       ```
       * 步长为负，是倒序输出。
       ```
        str[::-1]  # dlrow olleh
        str[3::-1] # lleh,倒序将下标0至3的值输出
       ```
     * 反向截取
       ```
        str[-1] # 输出最后一位d
        str[-1:] # 输出最后一位d
        str[:-1] # 输出：hello worl
        str[-3:-1] # 输出：rl
        str[-3:] # 输出：rld，从最后往前到倒数第三位

       ```

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
     print(str6.islower()) # false
     print(str7.islower()) # false
     print(str8.islower()) # false
     print(str9.islower()) # true
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
  * isspace() 判断字符串中只包含空格，返回true
    ```
     str10 = "     "
     str11 = ""
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
   2. 删除
      ```
       del(l_t1[0])
       print(l_t1)  # [ "jerry", "ac", 65 ]
       del(l_t1)
       print(l_t1) #NameError: name 'l_test1' is not defined
      ```
   3. 清空内容
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

   * count() 统计某个元素在列表中出现的次数
     ```
       l_t4 = ["123", "ac", 3, 10, [10]]
       print(l_t4.count(10)) # 1
     ```
   * append() 列表末尾增加新的内容
     ```
       l_t2 = ["123", "ac", 3]
       l_t2.append(10)
       print(l_t2) # ["123", "ac", 3,10]
       l_t2.append([10])
       print(l_t2) # ["123", "ac", 3,10,[10]]
     ```
   * extend() 向一个列表中添加另一个列表
     * **注意**当添加内容是一个字符串的时候，会拆分成单个元素添加进去，这就是与append区别
      ```
        l_t2 = ["123", "ac", 3]
        l_t3 = ["new", "hey", "on"]
        l_t2.extend(l_t3)
        print(l_t2) # ['123', 'ac', 3, 'new', 'hey', 'on']
        l_t3.extend("abc")
        print(l_t3) # ['new', 'hey', 'on', 'a', 'b', 'c']
      ```
   * index() 查找某个值第一次出现的索引值，不在是会报错的【列表没有find方法】
     ```
      l_t4 = [1, [2,[3]],[3], 3, "123", "ac", 3]
      l_t4.index(3) # 3
      print(l_t2.index([3])) # 2
      print(l_t2.index(9)) # 9 is not in list
     ```
   * insert(index,content) 将内容插入列表的指定位置
     ```
      l_t2 = ["123", "ac", 3]
      l_t2.insert(1,"haha")
      print(l_t2) # ["123","haha", "ac", 3]
     ```
   * pop(index) 移除元素，不传参数是最后一个
     ```
      l_t2 = ["123", "ac", 3]
      l_t2.pop(1)
      l_t3 = ["new", "hey", "on"]
      l_t3.pop()
      print(l_t2) # ['123', 3]
      print(l_t3) # ['new', 'hey']
     ```

   * remove() 移除列表中某个值的第一个匹配项
     ```
     l_t5 =["ok",1,"haha",2,3,"2",1]
     l_t5.remove(1)
     print(l_t5)  # ['ok', 'haha', 2, 3, '2', 1]
     ```
   * reverse() 倒序
     ```
      l_t5 =["ok",1,"haha",2,3,"2",1]
      l_t5.reverse()
      print(l_t5) # [1, '2', 3, 2, 'haha', 1, 'ok']
     ```
      * 也能使用切片
        ```
         l_t5 =["ok",1,"haha",2,3,"2",1]
         l_t5[::-1]
         print(l_t5) # [1, '2', 3, 2, 'haha', 1, 'ok']
        ```
   * sort() 排序
     * 会对原来的列表进行修改
     * 默认是升序
     * reverse=True 是降序，注意关键字True首字母要大写
     ```
      l_t5 = [9, 1, 4, 5, 77, 22]
      l_t6 = [1, 5, 7, 8, 2, 66]
      l_t5.sort()
      l_t6.sort(reverse=True)
      print(l_t5) # [1, 4, 5, 9, 22, 77]
      print(l_t6) # [66, 8, 7, 5, 2, 1]
     ```
   * sorted() 排序
     * 不会修改原来的内容，而是将排序后的结果返回一个新的列表
     ```
      l_t5 = [9, 1, 4, 5, 77, 22]
      l_t6 = [1, 5, 7, 8, 2, 66]
      print(sorted(l_t5)) # [1, 4, 5, 9, 22, 77]
      print(sorted(l_t6,reverse=True)) # [66, 8, 7, 5, 2, 1]
      print(l_t5) # [9, 1, 4, 5, 77, 22]
      print(l_t6) # [1, 5, 7, 8, 2, 66]
     ```

### 元组
1. 定义
   * 使用 ()，添加元素并使用逗号,分隔
   ```
    tup_a = (1, "1sd", "hello")
   ```
   * 元组的元素无法修改，这里指的是内存地址，对于元组内有列表，那么依然是可以改变其值的
     ```
      tup_c = (1, ["hello", 2, 3], "1sd", "hello")
      tup_c[1][0]="zhang"
      print(tup_c)  # (1, ['zhang', 2, 3], '1sd', 'hello')
     ```
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


### 集合
1. 定义
   * 使用 {}，以,分隔
   * 无序的，不重复的元素集，所以没有下标，也不能进行切片
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
2.
