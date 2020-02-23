# 类和对象
### 概念
* 类是一群具有相同特征和行为的事物的总称
* 对象是类的实例

### 查看对象的方法
    ```
     dir([])#查看列表的属性和方法
    
    ```
### 创建类
* 通过class关键字来创建一个类
    ```
    class Stu：
        a=3 #类属性
    
        # __init__ 是一个初始化的实例方法，实例方法第一个参数都是self
        # 通常来定义类的属性
        def __init__(self,name,age):
            self.name=name
            self.age=age
        def study():
            print("learning") 
        @classmethod
        def classMethod(cls):
            print("class method")       
            print("类属性",cls.a)       
        @staticmethod
        def staticdemo():
            print('这是一个静态方法')   
        
    ```
### 常见的方法类型
1. __init__(self):初始化方法
  * 不需要显示调用，在实例化的时候会由python自动调用
  * 初始化方法也不是必须的，一般是在需要定义对象属性或者继承父类时需要定义__init__方法
  * 如果没有定义该方法，会默认调用父类(终极父类时object)的__init__方法
  
2. 实例方法
  * 如果一个方法后面第一个参数是self就是实例方法
  * 实例方法只能通过对象（实例）进行调用
  * 实例方法在调用时不需要传入self参数，会隐式把实例对象传入该方法self参数
  
3. 类方法
  * 类方法可以直接由类名进行调用，类方法也可以通过实例进行调用
  * 类方法在定义时必须以@classmethod装饰器进行装饰
  * 所有类方法的第一个参数必须是cls
  * 类方法不能访问实例属性(self.xxx)以及实例方法，只能访问类属性【通常放在init初始化前面】
      ```
       #直接调用
       Stu.classMethod()
       Stu.a
      ```
  * 但是实例可以调用类方法和属性值
      ```
       s=Stu()
       s.classMethod()
       s.a
      ```  
4. 静态方法
 * 只能通过@staticmethod装饰器来进行装饰才能使用
 * 静态方法不能访问实例属性和类属性
 * 可以通过类名直接调用，以及实例化对象来调用
      ```
       Stu.staticdemo()
       s=Stu()
       s.staticdemo()
      ```
### 属性的种类
* 实例属性：由实例对象进行访问，或者实例方法访问。可以在__init__方法中进行初始化赋值
* 类属性：通过类名或实例访问，也可以在实例方法中进行访问
 