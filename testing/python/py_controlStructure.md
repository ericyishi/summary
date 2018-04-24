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
    * 注意每个判断语句后面要有分号：
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
       * 这里用end=" "指定输出以空格分隔，而不是默认换行

    2. for 变量 in range()
       * range() 指定区间范围，结束范围是开区间。
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



