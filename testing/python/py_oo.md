# 面向对象三大特性
* 继承、封装、多态

### 继承
* 类A继承类B，那么类A会自动获得类B的所有属性和方法
* 可以提高代码的重用性，同时扩展自己方法与属性
* 默认继承的是object类，可以不写显示写出
  ```
   class B:
     def study():
        print("learning")
     
   class A(B):
     pass 
     
    A().study()#可以直接调用父类的方法  
  ```
 #### 继承后子类初始化的注意事项
 * 当使用继承时，我们必须注意初始化方法__init__的行为：
  1. 如果子类没有定义自己的初始化方法，则父类的初始化方法会自动调用。实例化时候也需要按照父类的初始化传入参数
  2. 如果子类定义了自己的初始化方法【为了定义自己的实例属性】，而子类中没有显式调用父类的初始化方法，则父类的**所有属性**【实例方法不受影响】不会被初始化！
     * 所以通常都是需要调用父类的初始化方法
     * 
       ```
        class B:
          def __init__(self,name):
             self.name=name
          def study():
             print("learning")
          
        class A(B):
          def __init__(self,age):
             self.age=age
          pass 
          
         A("zhangsan").name #这样是会报错的，因为没有显示声明父类的初始化方法，导致子类直接覆盖掉了
         A().study()
       ```
     * **所以需要显示调用父类的初始化方法，有什么参数也得传入**
       ``` 
        class A(B):
          def __init__(self,name,age): #父类的参数也得写上去
             B.__init__(self,name) #这里需要对父类进行初始化
             self.age=age
          pass 
          
         print A("zhangdan",18).name #zhangsan
            
       ```  
 #### 重写父类的方法
 * 子类中有个方法跟父类的方法相同
 * 重写后，子类的方法会覆盖父类的这个方法，实现了子类方法的自定义
       
### 封装
* 将对象的状态信息隐藏在对象内部，不允许外部程序直接访问对象内部信息，只能通过该类提供的方法来实现对类内部信息的操作和访问。  
* 把该隐藏的信息隐藏起来，把该暴露的信息暴露出来
 #### 封装目的
 1. 隐藏类的实现细节
 2. 让使用者只能通过事先约定的访问方法来访问内部信息
 3. 便于修改，提高代码的可维护性
 #### 封装的考虑
 1. 将对象的属性和实现细节隐藏起来，不允许外部直接访问
 2. 把方法接口暴露出来，让方法来控制对象这些属性的安全访问和操作
    * 在python中实现属性或方法的隐藏的方法：在定义方法或属性时，使用双下划线开头"__"
      ```
       class C:
         def __init__(self):
            self.__x=10  #隐藏属性
            self.y=20 #实例属性
            
         def getx(self): #对外的访问接口
            return self.__x
            
         def setx(self,x):#对外的设置接口
            self.__x=x   
               
       dir(C()) # ['_C__x', '__doc__', '__init__', '__module__', 'y'] 
       # 可以看到我们隐藏的属性还是能看到，强制访问还是可以的C()._C__x ,没有像强类型语言那么严格有private，public的权限控制
       print(C()._C__x) #10
      ```
### 多态
* 如果一个类的子类中重写父类的某一个方法，那么在其他函数中去调用这个方法，会根据传入子类的不同类型，而呈现不同的行为
  ```
   class Animal：
     def say(self):
       print('动物叫')
   class Sheep(Animal):
     def say(self):
        print('羊在叫')
   class Dog(Animal):
        print('狗在叫')
        
   def animal_say(animal)   #外部的方法，传入一个动物的实例
        animal.say()
        
   if __name__="__main__":
        dog=Dog()
        animal_say(dog) #狗在叫
        animal_say(Sheep())#羊在叫 
                       
  ```
  * 之所以可以传入子类的实例，因为子类对象就是一个父类对象
    ```
     isinstance(dog,Animal) #True
    ```
  * 在python中即便不是Animal的实例或者子类实例的其他类，也可以传入【动态语言的特性】
    ```
     class NotAnimal:
        def say(self):
            print("不是动物在叫")
      
      
      animal_say(NotAnimal())#也不会报错，如果是java这类静态语言是不行的
            
    ``` 
* 多态实现了著名的“开闭原则”
  1. 对扩展开放：允许任意新增父类Animal的子类
  2. 对修改封闭：不需要修改依赖Animal类型的animal_say方法，只需传入不同类型即可     
        