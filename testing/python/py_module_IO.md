# IO操作

### 文件操作操作方法
* python open() 函数用于打开一个文件，创建一个 file 对象，相关的方法才可以调用它进行读写
* open() 创建file 对象
  ```
   f=open("文件的路径","文件I/O操作符")
  ```
  * 默认的文件操作符是r
  * 除了上面的方式还可以使用with
    ```
     with open("文件的路径","文件I/O操作符") as f:

    ```
    * 使用with的好处是不用再手动写f.close()方法

* f.close() 关闭文件。关闭后文件不能再进行读写操作。
* f.flush() 刷新文件内部缓冲，直接把内部缓冲区的数据立刻写入文件, 而不是被动的等待输出缓冲区写入。
* f.seek(offset) 设置文件当前位置
* f.tell() 返回当前位置
* f.write(str) 将字符串写入文件，没有返回值
* f.read() 读取文件内容
* f.readlines() 读取文件内容，以**列表**的形式返回
  ```
   //s.txt【注意需要换行，因为readlines是以每一行作为一个元素来返回】
   apple
   banana
   orange
  ```
  ```
   //随机点名
   import random
   f = open(".//s.txt",encoding='UTF-8')
   content=f.readlines() //返回的是列表[]
   r=random.choice(content) //从列表中选1个元素出来
   print(r)

  ```
* f.readline() 读取文件内容，并返回**字符串**
* f.writelines() 写入文件内容，可以是字符串也可以是列表
### I/O操作符
* w
  * 以写方式打开文件，可向文件写入信息。**如文件存在，则清空该文件**，再写入新内容。如果不存在该文件，就会创建。
  ```
   f = open(r"C:\Users\Administrator\Desktop\demo.txt", "w")
   f.write('aaa\nhahaha')
   f.close()
  ```
* r
  * 以读的方式打开文件，必须存在，找不到文件会抛出异常
  ```
   f = open(r"C:\Users\Administrator\Desktop\demo.txt", "r")
   con = f.read()
   print(con)
   f.close()
  ```
  ```
   # 控制台结果：
   aaa
   hahaha
  ```
* **a**
  * 以追加模式打开文件（即一打开文件，文件指针自动移到文件末尾【不会换行！】）
  * 如果文件不存在则创建,如果文件存在，则可以追加文件内容
  * 只可以写，不可以读
  ```
   f = open(r"C:\Users\Administrator\Desktop\demo.txt", "a")
   f.write('第二次加入数据')
   f.close()
  ```
  ```
   # 结果：
   aaa
   hahahathe second time add
  ```
* a+
  * 打开一个文件用于读写。如果该文件已存在，文件指针将会放在文件的结尾。文件打开时会是追加模式。如果该文件不存在，创建新文件用于读写。
  ```
  ```

* w+
  * **消除文件原来内容**，然后以读写方式打开文件。
  * 使用w+读取内容的时候，必须使用：f.seek(0)要把光标放在最开始，才能在控制台里面打印出信息
  ```
   f = open(r"C:\Users\Administrator\Desktop\demo.txt", "w+")
   f.write('the third time add')
   f.seek(0)
   con=f.read()
   print(con)
   f.close()
  ```
  ```
   # 结果：
   the third time add
  ```
* r+
  * 以读写方式打开文件，可对文件进行读和写操作。
  * **依然会消除文件原来的内容**
  * 如果要将添加的内容打印出来要依然使用：f.seek(0)
  * 要是想从文件末尾追加可以使用a
  ```
  f = open(r"C:\Users\Administrator\Desktop\demo.txt", "r+")
  f.write('the fourth time add')
  f.seek(0)
  con = f.read()
  print(con)
  f.close()

  ```
  ```
   the fourth time add
  ```

* rb
  * 以二进制模式打开文件，并读取操作

* wb
  * 以二进制模式打开文件，并写入操作

### 复制文件
  ```
   # 桌面上的Q1文件，复制到D盘下去
   f = open(r"C:\Users\Administrator\Desktop\Q1.png", "rb")
   img = f.read()
   f.close()
   f = open("D:\\Q1.png", "wb")
   f.write(img)
   f.close()
  ```
  * 在读的时候，打开文件路径前使用一个r，代表将字符串里的内容，不进行转义操作，直接输出。
  * 如果不使用r那么需要把\变\\\

### demo
    ```
     # 查找D:\project_python路径下所有的py文件，并查找内容含有print的行，并写入桌面find.txt文件中
     import glob

     a = glob.glob(r"D:\project_python\*.py")
     for i in a:
         print(i)
         with open(i, encoding="utf-8") as f:
             while True:
                 content = f.readline()
                 if (content == ""):
                     break
                 else:
                     if (content.find("print") != -1):
                         print("find print:", content)
                         file = open(r"C:\Users\Administrator\Desktop\find.txt", "a")
                         file.write("%s\n" % content)
                         file.close()

                     else:
                          continue
    ```

   * glob.glob("路径\文件")可以找到该路径下的所有的文件。