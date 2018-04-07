# 多态
### 多态的概念
* 现实事物经常会体现出多种形态，如学生，学生是人的一种，则一个具体的同学张三既是学生也是人，即出现两种形态。
* Java作为面向对象的语言，同样可以描述一个事物的多种形态。如Student类继承了Person类，一个Student的对象便既是Student，又是Person。
* Java中多态的代码体现在一个子类对象(实现类对象)既可以给这个子类(实现类对象)引用变量赋值，又可以给这个子类(实现类对象)的父类(接口)变量赋值。
  * 如Student类为Person类的子类。那么一个Student对象既可以赋值给一个Student类型的引用，也可以赋值给一个Person类型的引用。
### 多态的条件
* 首先要有一个父子关系【继承】或者类实现接口的关系，否则无法多态！
### 多态的体现
*  一个子类对象既可以给其引用变量赋值，又可以给其的父类（或者接口）变量赋值。
### 多态的分类
* 类的多态
  * 实例化时，前面是父类，后面是子类、这样的写法叫做类的多态
  * 最终的多态体现，父类的引用变量可以指向子类的对象。
```
class Student extends Person{}

class Person{}

class Test{
Person p=new Student();//一个Student的对象既是Student，又是Person
}
```
* 接口的多态

### 多态调用的方式
   ```
     格式：
     父类类型或者接口类型 变量名=new 子类对象；

     变量名.方法名();
   ```
   ```
   同一个父类的方法会被不同的子类重写。在调用方法时，调用的是各个子类重写后的方法。
   			如：
   			   Person p1 = new Student();
   			   Person p2 = new Teacher();
   			   p1.work(); //p1会调用Student类中重写的work方法
   			   p2.work(); //p2会调用Teacher类中重写的work方法
   			当变量名指向不同的子类对象时，由于每个子类重写父类方法的内容不同，所以会调用不同的方法。

   ```
* 三种形式：
 1. 普通类调用
    ```
    父类 变量名 = new 子类();
    举例：
    	class Fu {}
    	class Zi extends Fu {}
    	//类的多态使用
    	Fu f = new Zi();
    ```
 2. 抽象类调用
    ```
     抽象类 变量名 = new 抽象类子类();
     举例：
     abstract class Fu {
              public abstract void method();
     	     }
     class Zi extends Fu {
        public void method(){
        	System.out.println(“重写父类抽象方法”);
        }
     }
     //类的多态使用
     Fu fu= new Zi();
    ```
 3. 接口调用
    ```
    接口 变量名 = new 接口实现类();
    举例：
     interface Fu {
    	 public abstract void method();
      }
     class Zi implements Fu {
    	 public void method(){
           System.out.println(“重写接口抽象方法”);
      }
    }
    //接口的多态使用
    Fu fu = new Zi();
    ```

### 多态成员变量和方法
* 多态成员变量
  * 编译和运行都参考等号的左边，父类。
* 多态成员方法
  * 编译看左边，父类，运行看右边，子类。
  ```
   package com.test.poly;

   public class Fu {
   	public int num = 4;
   	public void show(){
   		System.out.println("fu function");
   	}
   }

   package com.test.poly;

   public class Zi extends Fu{
   	public int num = 5;
   	public void show(){
   		System.out.println("zi function");
   	}
   }
  ```
  ```
   package com.test.poly;

   public class Test {
    public static void main(String[] args) {
   		Fu t1 = new Fu();
   		System.out.println(t1.num);//4
   		Zi t2 = new Zi();
   		System.out.println(t2.num);//5

   		Fu t3 = new Zi();
   		System.out.println(t3.num);//4，调用父类的成员变量
   		t3.show();//zi function，调用子类的成员方法
   }
   }

  ```

### 多态转型
* 向上转型
  * 当有子类对象赋值给一个父类引用时，便是向上转型，多态本身就是向上转型的过程。子类提升为父类类型。
  ```
   格式：
   父类类型  变量名 = new 子类类型();
   如：Person p = new Student();
  ```
* 向下转型
  * 一个已经向上转型的子类对象可以使用强制类型转换的格式，将父类引用转为子类引用，这个过程是向下转型。如果是直接创建父类对象，是无法向下转型的！
  ```
  格式：
   子类类型 变量名 = (子类类型) 父类类型的变量;
   如:Student stu = (Student) p;  //变量p 实际上指向Student对象
  ```
* 例子
    ```
     //孔子装爹
     class 孔子爹{int age=80;void 上课(){生意}}
     class 孔子 extends 孔子爹{int age=45;void 上课(){论语}; void 打游戏(){}}
    //有人找孔子爹上课，爹没在家，孔子就代替他父亲去上课
    //化妆： 孔子爹 变量=new 孔子();
             变量.上课();//上课类容是论语
    ```
    ```
    //卸妆：变化孔子他自己
    孔子 k=(孔子)变量
    ```

### 多态的好处和弊端
* 当父类的引用指向子类对象时，就发生了向上转型，即把子类类型对象转成了父类类型。
* 向上转型的好处是隐藏了子类类型，提高了代码的扩展性。
* 但向上转型也有弊端，只能使用父类共性的内容，而无法使用子类特有功能，功能有限制。
### 案例
```
	//描述动物类，并抽取共性eat方法
		abstract class Animal {
			abstract void eat();
		}

		// 描述狗类，继承动物类，重写eat方法，增加lookHome方法
		class Dog extends Animal {
			void eat() {
				System.out.println("啃骨头");
			}

			void lookHome() {
				System.out.println("看家");
			}
		}

		// 描述猫类，继承动物类，重写eat方法，增加catchMouse方法
		class Cat extends Animal {
			void eat() {
				System.out.println("吃鱼");
			}

			void catchMouse() {
				System.out.println("抓老鼠");
			}
		}

		public class Test {
			public static void main(String[] args) {
				Animal a = new Dog(); //多态形式，创建一个狗对象
				a.eat(); // 调用对象中的方法，会执行狗类中的eat方法
				// a.lookHome();//使用Dog类特有的方法，需要向下转型，不能直接使用

				// 为了使用狗类的lookHome方法，需要向下转型
		// 向下转型过程中，可能会发生类型转换的错误，即ClassCastException异常
				// 那么，在转之前需要做健壮性判断
				if( !a instanceof Dog){ // 判断当前对象是否是Dog类型
				 		System.out.println("类型不匹配，不能转换");
				 		return;
				}
				Dog d = (Dog) a; //向下转型
				d.lookHome();//调用狗类的lookHome方法
			}
		}
```
### 多态的总结
* 什么时候使用向上转型：
	* 当不需要面对子类类型时，通过提高扩展性，或者使用父类的功能就能完成相应的操作，这时就可以使用向上转型。
	  ```
	  如：
	  Animal a = new Dog();
      a.eat();
	  ```

* 什么时候使用向下转型
	* 当要使用子类特有功能时，就需要使用向下转型。
	  ```
	  如：
	  Dog d = (Dog) a; //向下转型
      d.lookHome();//调用狗类的lookHome方法
      向下转型的好处：可以使用子类特有功能。
      弊端是：需要面对具体的子类对象；在向下转型时容易发生ClassCastException类型转换异常。在转换之前必须做类型判断。
      如：if( !a instanceof Dog){…}
	  ```

