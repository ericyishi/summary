# final关键字和static关键字
## final关键字
### 概述
* 为何要使用？
  ```
     继承的出现提高了代码的复用性，并方便开发。但随之也有问题，有些类在描述完之后，不想被继承，
   或者有些类中的部分方法功能是固定的，不想让子类重写。可是当子类继承了这些特殊类之后，
   就可以对其中的方法进行重写，那怎么解决呢？
   要解决上述的这些问题，需要使用到一个关键字final，final的意思为最终，不可变。
  ```
* final关键字来限制用户行为的,就是用来限制我们这些程序员的。

### 修饰的类型
* 可以用来修饰类，修饰方法，类的成员变量，以及局部变量。
1. final用来修饰类
    ```
     final class 类名{}
    ```
    * final修饰的类不可以被继承，但是可以继承其他类。
      ```
        class Yy {}
        final class Fu extends Yy{} //可以继承Yy类
        class Zi extends Fu{} //这样写是错误的，不能继承Fu类
      ```
    * 在使用final修饰类的时候，要注意谨慎选择，除非这个类真的在以后不会用来继承或者出于安全的考虑，尽量不要将类设计为final类。
2. final用来修饰方法
    * final修饰的方法不可以被覆盖,但父类中没有被final修饰方法，子类覆盖后可以加final。
       ```
       class Fu {
       	// final修饰的方法，不可以被覆盖
       	public final void method1(){}
       	public void method2(){}
       		}
       	class Zi extends Fu {
       		//重写method2方法
       		public final void method2(){}
       	}
        ```
    * 类的private方法会隐式地被指定为final方法。
3. final用来修饰局部变量
  * 对于一个final变量，如果是基本数据类型的变量，则其数值一旦在初始化之后便不能更改；如果是引用类型的变量，则在对其初始化之后便不能再让其指向另一个对象。
   1. 修饰基本数据类型变量
      * final修饰的变量称为常量，这些变量只能赋值一次
        ```
          final int i = 20;
          i = 30; //赋值报错，final修饰的变量只能赋值一次
        ```
   2. 修饰引用数据类型
      * 引用类型的变量值为对象地址值，地址值不能更改，但是地址内的对象属性值可以修改
        ```
          final Person p = new Person();
          Person p2 = new Person();
          p = p2; //这样写会报错的！final修饰的变量p，所记录的地址值不能改变
          p.name = "小明";//可以更改p对象中name属性值
          p不能为别的对象，而p对象中的name或age属性值可更改。
        ```

4. final修饰成员变量
  * 修饰成员变量，需要在创建对象前赋值，否则报错。
  * 如果不直接赋值，那么可以通过构造函数来赋值。
  * 当有多个构造函数时，当没有显式赋值时，均需要为其赋值。
     ```
       class Demo {
         //直接赋值
         final int m = 100;

         //final修饰的成员变量，需要在创建对象前赋值，否则报错。
         final int n;
         public Demo(){
         	//可以在创建对象时所调用的构造方法中，为变量n赋值
         	n = 2016;
         }
         public Demo(int a){
          n =2018;//这个构造函数也必须对n进行赋值，否则会报错
          }
           }
     ```
## static关键字
### 概述
* 为何要使用？
  ```
     当在定义类的时候，类中都会有相应的属性和方法。而属性和方法都是通过创建本类对象调用的。
   当在调用对象的某个方法时，这个方法没有访问到对象的特有数据时，方法创建这个对象有些多余。
   可是不创建对象，方法又调用不了，这时就会想，那么我们能不能不创建对象，就可以调用方法呢？
     可以的，我们可以通过static关键字来实现。
  ```
* static它是静态修饰符，能够修饰**方法**和**成员变量**。
### 被static修饰的对象特有数据
* 特点
  1. 被static修饰的成员(变量和方法)属于类，不属于这个类的某个对象。
  2. 上面可以理解为被static修饰的成员是共享的。也就是说，多个对象在访问或修改static修饰的成员变量时，其中一个对象将static成员变量值进行了修改，其他对象中的static成员变量值跟着改变，即多个对象共享同一个static成员变量
  ```
    class Demo {
    			public static int num = 100;
    		}

    class Test {
    	public static void main(String[] args) {
    		Demo d1 = new Demo();
    		Demo d2 = new Demo();
    		d1.num = 200;
    		System.out.println(d1.num); //结果为200
    		System.out.println(d2.num); //结果为200
    	}
    }
  ```

### 静态调用方式
* 注意事项：
  * 被static修饰的成员可以并且建议通过类名直接访问。
* 访问静态成员的格式：
  * 类名.静态成员变量名
  * 类名.静态成员方法名(参数)
  * 对象名.静态成员变量名     		------不建议使用该方式，会出现警告
  * 对象名.静态成员方法名(参数) 	------不建议使用该方式，会出现警告
  ```
   class Demo {
   		//静态成员变量
   		public static int num = 100;
   		//静态方法
   		public static void method(){
   			System.out.println("静态方法");
   		}
   	}
   	class Test {
   		public static void main(String[] args) {
   			System.out.println(Demo.num);
   			Demo.method();
   		}
   	}
  ```
* 对象的静态调用
  * 在多态中，非静态编译看父类，运行看子类，父类没有编译失败。
  * **注意**但多态中的静态方法,编译看父类,运行仍然看父类。因为静态和对象没有关系，属于静态绑定。
    ```
       public class Test{
       			public static void main(String[] args){
       				Fu f = new Zi();
       				f.show();   //父类的引用和父类的方法绑定,和对象无关,不会在运行时动态的执行子类特有的方法。
       			}
       		}
    ```

### static静态的使用场景
* 什么时候使用static修饰成员变量？
   * 加static修饰成员的时候，这个成员会被类的所有对象所共享。一般我们把共性数据定义为静态的变量。
* 什么时候使用static修饰成员方法？
   * 静态的方法只能访问静态的成员，如果静态方法中引用到了静态的其他成员，那么这个方法需要声明为静态的方法。

### 静态常量
* 概述
  * 开发中，我们想在类中定义一个静态常量，通常使用public static final修饰的变量来完成定义。
  * 此时变量名用全部大写，多个单词使用下划线连接。
* 定义格式
  ```
   public static final 数据类型 变量名 = 值;
  ```
  ```
   class Company {
   			public static final String COMPANY_SLOGAN = "洗洗更健康";
   			public static void method(){
   				System.out.println("一个静态方法");
   			}
   		}

   		当我们想使用类的静态成员时，不需要创建对象，直接使用类名来访问即可。
   		System.out.println(Company.COMPANY_SLOGAN); //打印“洗洗更健康”
   		Company.method(); // 调用一个静态方法
  ```
* 注意事项
  * 接口中的每个成员变量都默认使用public static final修饰。
  * 所有接口中的成员变量已是静态常量，由于接口没有构造方法，所以必须显示赋值。可以直接用接口名访问。
    ```
     interface Inter {
     			public static final int COUNT = 100;
     		}

     //访问接口中的静态变量
     Inter.COUNT
    ```
### final和static的区别
* 很多时候会容易把static和final关键字混淆，static作用于成员变量用来表示只保存一份副本，而final的作用是用来保证变量不可变。
  ```
   public class Test {
       public static void main(String[] args)  {
           MyClass myClass1 = new MyClass();
           MyClass myClass2 = new MyClass();
           System.out.println(myClass1.i);
           System.out.println(myClass1.j);
           System.out.println(myClass2.i);
           System.out.println(myClass2.j);

       }
   }

   class MyClass {
       public final double i = Math.random();
       public static double j = Math.random();
   }
  ```
   * 运行这段代码就会发现，每次打印的两个j值都是一样的，而i的值却是不同的。从这里就可以知道final和static变量的区别了