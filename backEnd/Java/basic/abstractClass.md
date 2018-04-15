# 抽象类
* 关键字abstract
* 就是将一类具体的事物，具有的行为相同，但是具体的内容又不一样，将这种共性抽取出来。就是抽象类。
* 可以用来修饰**类**和**方法**
### 抽象类的用途
* 抽象类是对象的抽象，继承抽象类,强制子类重写抽象的方法
### 定义格式
```
 public abstract class 类名{//抽象类
 public abstract void 方法名( );//抽象方法
 }
```
* **注意**：
  * 1.不具有方法体{}
  * 2.抽象方法一定是在抽象类里面
### 抽象类的使用方法
* 定义类继承抽象类，将抽象方法进行重写，创建子类对象。
    ```
    public abstract class Develop {
    			   //定义方法工作方法,但是怎么工作,说不清楚了,讲不明白
    				//就不说, 方法没有主体的方法,必须使用关键字abstract修饰
    				//抽象的方法,必须存在于抽象的类中,类也必须用abstract修饰
    				public abstract void work();
    			}
    ```

    ```
    //定义类继承抽象类
    public class Android extends Develop{
    	     public void work(){//去掉abstract 修饰符，加上方法主体。
    	    	 System.out.println("Android工程师开发手机软件");
    	     }
    	}
    ```

### 抽象类的注意事项
   1. 抽象类是不能实例化的，不能实例化的原因是，无法调用其抽象方法，没有方法主体。
   2. 抽象类和抽象方法都要被abstract修饰。抽象方法一定要定义在抽象类中。
   3. 只有覆盖了抽象类中**所有**的抽象方法，子类才可以创建对象(使用new)。否则子类还是一个抽象类。
   4. 之所以继承抽象类，更多的是在思想，是面对共性类型操作会更简单。
   5. 抽象类也可以不定义抽象方法【目的：不让该类创建对象,方法可以直接让子类去使用】
   ```
      pulic abstract class Animal(){
      public void sleep(){
      System.out.println("动物睡觉");
      }


      public class Cat extends Animal{

      }

      public class Test {
      	public static void main(String[] args) {
      				//Cat c = new Cat();
      				new Cat().sleep();//不让该类创建对象,方法可以直接让子类去使用
      			}
       }
   ```
   6. 抽象关键字abstract不可以和哪些关键字共存？
   ```
    1.private：私有方法子类是无法继承到的，也就不存在所谓的覆盖。
    2.final
    3.static
   ```


### 使用@override的好处
* @override是标签，不是关键字，可写可不写。
* 1.可以当注释用,方便阅读；
* 2.编译器可以给你验证@Override下面的方法是否是你父类中所有的，如果不是则报错。例如，你想重写父类中的某个方法，如果没写@Override，而你下面的方法又写错了，比如参数类型个数或者方法名不同，这时你的编译器是可以编译通过的，因为编译器以为这个方法是你的子类中自己增加的方法。


### 抽象类作为方法参数与返回值
1. 抽象类作为方法参数
   * 开发中，抽象类作为方法参数的情况也很多见。当遇到方法参数为抽象类类型时，要**传入一个实现抽象类所有抽象方法的子类对象**。
     ```
      //抽象类
      		abstract class Person{
      			public abstract void show();
      		}
      		class Student extends Person{
      			@Override
      			public void show() {
      				System.out.println("重写了show方法");
      			}
      		}
      		//测试类
      		public class Test {
      			public static void main(String[] args) {
      				//通过多态的方式，创建一个Person类型的变量，而这个对象实际是Student
      				Person p = new Student();
      				//调用method方法
      				method(p);
      			}

      			//定义一个方法method，用来接收一个Person类型对象【Person是一个抽象类】，在方法中调用Person对象的show方法
      			public static void method(Person p){//抽象类作为参数
      				//通过p变量调用show方法,这时实际调用的是Student对象中的show方法
      				p.show();
      		}
      		}
     ```
2. 抽象类作为方法返回值
  * 抽象类作为方法返回值的情况，也是有的，这时需要**返回一个实现抽象类所有抽象方法的子类对象**
  ```
   //抽象类
   		abstract class Person{
   			public abstract void show();
   		}
   		class Student extends Person{
   			@Override
   			public void show() {
   				System.out.println("重写了show方法");
   			}
   		}
   		//测试类
   		public class Test {
   			public static void main(String[] args) {
   				//调用method方法，获取返回的Person对象
   				Person p = method();
   				//通过p变量调用show方法,这时实际调用的是Student对象中的show方法
   				p.show();
   			}

   			//定义一个方法method，用来获取一个Person对象，在方法中完成Person对象的创建
   			public static Person method(){
   				Person p = new Student();
   				return p;
   			}
   		}
  ```

### 案例
```
A:员工案例Employee类的编写:按照分析的继承体系来逐个实现
		 /*
		 *  定义员工类
		 *    内容,都是所有子类的共性抽取
		 *      属性: 姓名,工号
		 *      方法: 工作
		 */
	   public abstract class Employee {
			private String id;// 员工编号
			private String name; // 员工姓名

			public String getId() {
				return id;
			}
			public void setId(String id) {
				this.id = id;
			}
			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}

			//工作方法（抽象方法）
			public abstract void work();
	 }
```
```
 B:员工案例的子类的编写:
     /*
	 *  定义研发员工类
	 *    属于员工中的一种, 继承员工类
	 *    抽象类Develop 给自己的员工定义自己有的属性
	 */
	public abstract class Develop extends Employee{

	}
	/*
    	*定义Android工程师 继承 研发部员工类，重写工作方法
    	*/
    public class Android extends Develope {
       @Override
        public void work() {
     	 System.out.println(andorid工程师，正在研发淘宝手机客户端软件");
        }
      }

```
```
  public class Test{
   public static void main(String args[]){
     Android ad = new Android();
     ad.work();
   }
  }
```
