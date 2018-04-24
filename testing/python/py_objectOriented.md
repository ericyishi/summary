# 面向对象(Object-Oriented)
### 概念
1. 面向对象
    * 对象指的是类的实例
    * 将对象作为程序的基本单元，将程序和数据封装其中，以提高软件的重用性、灵活性和扩展性。
2. 类
    * 类是一种抽象的类型
3. 对象
    * 对象是这种类型的实例

### 类
1. 定义
   ```
    python3:
    class 类名：
    class People:
      def eat(self):
        print("%s is eating"%self.name)

    python2：
     class 类名(Object):
   ```

2. 实例化
   ```
    p = People()
    p.eat() //eating
   ```
   * 不需要像其他语言一样,需要new

3. 类属性
   ```
    class People:
          name="zhang"
          def eat(self):
            print("%s is eating"%self.name)
   ```
   * 调用的时候，使用self.属性名
   * self代表对象本身

4. 实例属性
   * 写在方法里面的属性
   * 将实例属性前面加self.就能变为类属性

### 类中方法
1. 定义
   ```
    def 方法(self):
   ```
   * 没有self参数会报错，因为实例化的时候，调用该方法会自动传入一个self对象进去。
   * 但是使用类.方法()的方式就不会报错
   * 使用装饰器@staticmethod静态方法，也可以使用对象或者类名调用方法不报错
        ```
         @staticmethod
         def speak():
           print("speaking")
        ```
        ```
         p=People()
         p.speak()
        ```
2. 构造方法
   1. 创建时候
        ```
         def __init__(self):
           print("初始化时自动执行")
        ```
   2. 删除时候
        * 析构方法
        ```
         def __del__(self):
          print("删除对象时候会调用")
        ```

### 私有化
* 私有化只能在类里面定义
1. 属性私有化定义
   ```
   def __init__(slef,name):
     self.__name=name

   ```
   * 在原来属性名之前加__
2. 方法私有化定义
   ```
    def __speak(self):

   ```

3. 类外强制使用私有变量和方法
   ```
    实例化.__dict__
   ```
   * 得到一个改变名字的字典对象，里面有原来的私有化属性

### demo
```
 class Student():
     def __init__(self, name, age, score_cn, score_math, score_en):
         self.__name = name
         self.__age = age
         self.score = {"语文": score_cn, "数学": score_math, "英语": score_en}
         self.__score_cn = score_cn
         self.__score_math = score_math
         self.__score_en = score_en

     def get_name(self):
         return self.__name

     def get_age(self):
         return self.__age

     def get_score(self):
         return self.score

     def get_course(self):  # 获取最高分的课程
         return max(self.score, key=self.score.get)

     def get_avg(self):
         return sum(self.score.values()) / len(self.score)


 s1 = Student("zhang", 13, 89, 99, 92)
 print(s1.get_name())
 print(s1.get_age())
 print(s1.get_score())
 print(s1.get_course())
 print("average score:%.2f"%s1.get_avg())
```

### 三大特性
* 封装
* 继承
   ```
    class 子类(父类):

   ```
   * Python支持多继承
      ```
       class 子类(父类1,父类2,...):
      ```

   * 重写（overwrite）
     * 重写后，还想调用父类原来的方法，使用super().方法名()来调用


```
  # Person.py
  class Person:
      __name =
      def __init__(self, name):
          self.__name = n
      def make_money(self):
          print("赚钱")


*****************************
  # Student.py
  import Per
  class Student(Person.Person):
      def __init__(self, name, age):
          Person.__init__(name) # 使用父类的构造函数
          self.age = age


      def make_money(self): # 重写父类的方法
          print("学生赚钱")


  s1 = Student("zhang", 12)
  s1.make_money()
```

* 多态
   * Python 没有覆写（override）的概念。严格来讲，Python 并不支持「多态」。
