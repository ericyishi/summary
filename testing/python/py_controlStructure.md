# 控制结构
### 控制结构分类
   * 顺序结构
   * 分支结构
   * 循环结构
### 顺序结构

### 分支结构
1. if语句
    ```
     if 条件A:
       语句1
     elif 条件B:
       语句2
     else:
       语句3
    ```
    * 注意，每个判断语句后面要有分号：
	  ```
	    可以简单的写在一行【当a为true的时候，打印输出语句】
		if a:print('this is true')
	  ```
### 循环结构
* 没有switch case语句，也没有do while
1. for循环
   1. for 变量 in 对象
      ```
       # 遍历的是字符串
       str="hello world"
       for i in str:
        print(i) # 每个字符以独立的一行的输出
        print(i,end=" ") # 所有结果都在一行，并以一个空格分隔
      ```
       * 这里用end=" "指定输出以空格分隔，而不是默认换行“\n”


      ```
       # 也能够遍历列表、字典
       * 但是先要转换成items
       dicts={"username":"zhang","age":12}
       content=dicts.items() #[('username','zhang'),('age':12)]
       for k,v in content:
            print("key is %r",k)
            print("value is %r",v)
      ```

    2. for 变量 in range(INTEGER)
       * range里面的东西是整数
       * 对于进行一定次数的循环，需要使用range()
       * range() 指定区间范围，结束范围是**开区间**。
         ```
          range(10) 取值是[0,10)
          区间值里面也能够切片
          rang(0:10:2)
         ```
       * 常与for语句搭配使用
         ```
          # 这里的i是下标
          for i in rang(3):
           print(i) # 0,1,2
		  
          for i in range(1,3):
            print(i) # 1,2  		  
         ```
2. while循环
   1. while
      ```
       while(循环的条件):
         循环体
      ```
   2. while else
      ```
       while(循环的条件):

         循环体
       else:
         退出循环时执行一次
      ```


4. continue与break
   * continue跳出本次循环
   * break 跳出循环体
   * exit()
5. pass占位语句
   * 保持程序结构的完整性，使用pass,不做任何操作。
     ```
      while True:
        pass
     ```



