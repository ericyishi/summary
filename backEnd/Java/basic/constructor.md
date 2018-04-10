# 构造方法 CONSTRUCTOR
### 应用场景
* 人对象一创建就要明确其姓名和年龄【而非实例化以后再setXXX】，就要用构造方法。
* 构造方法为了解决在开发实际中，在创建对象就要明确属性值。在new创建对象时，就给属性的对象初始化赋值。
  ```
   Perons p = new Person("张三",23);
   //在new 的时候给p对象的name属性和age属性进行赋值,使这个对象的属性有值。
  ```
### 构造方法定义和特点
  ```
    修饰符(权限) 构造方法名(参数列表)
   	{
   	}
  ```
  * 构造方法没有返回值类型。也不需要写返回值。因为它是为构建对象的，对象创建完，方法就执行结束。
  * 构造方法名称必须和类型保持一致。
  * 构造方法没有具体的返回值。
  ```
   public class Person{
    private String name;
    private int age;
    public Person(int a, String nm){//构造方法
        age = a;
        name = nm;
        System.out.println("这是一个空参数构造方法");
    }
   }

   public class Test{
    public static void main(String[] args){
    Person p=new Person(23,"张三");
    }
   }
  ```
  * new创建对象后，就直接**自动运行构造方法**里面的内容了【有且仅运行一次构造方法：new一次，运行一次】
  * 只要是一个类class就必须拥有构造方法，构造方法不写也有【javac会检测，没有会自动添加，有就用自定义的那个】！
### 构造方法的内存
* 有一个Person类, 创建Person 对象new Person()
   1. 首先会将main方法压入栈中，执行main方法中的 new Person(23,"张三");
   2. 在堆内存中分配一片区域，用来存放创建的Person对象，这片内存区域会有属于自己的内存地址（比如：0x88）。然后给成员变量进行默认初始化（name=null，age=0）
   3. 执行构造方法中的代码（age = a ; name = nm;）,将变量a对应的23赋值给age，将变量nm对应的”张三赋值给name，这段代码执行结束后，成员变量age和name的值已经改变。
   4. 执行结束之后构造方法弹栈，Person对象创建完成。将Person对象的内存地址0x88赋值给p2。

### 构造方法的重载
1. 一个类中可以有多个构造方法，多个构造方法是以重载的形式存在的
2. 构造方法是可以被private修饰的，原因：其他程序无法创建该类的对象。
3. 有了构造方法，是否还需要get/set方法？
   需要。set/get方法在创建对象以后需要修改和访问相应的属性值。
```
 class Person {
 	private int age;
 	private String name;
 	// 私有无参数的构造方法，即外界不能通过new Person();语句创建本类对象
 	private Person() {
 	}
 	// 多个构造方法是以重载的形式存在
 	Person(int a) {
 		age = a;
 	}
 	Person(String nm, int a) {
 		name = nm;
 		age = a;
 	}
 }
```

### 构造方法和一般方法区别
* 格式
  * 构造方法：
    ```
      修饰符  类名(参数类型 参数名 ...){
      			初始化成员变量
      		}
    ```

  * 一般方法：
    ```
      修饰符 返回值类型 方法的名字 （参数类型 参数名...）{
          方法的主体
       return 返回值;
       }
       //通常有返回值
    ```
* 作用
  * 构造方法:一般用来给成员变量初始化;
  * 一般方法：一般方法根据需求而定;
* 调用不同
  * 构造方法创建对象时调用, 或者this() super() 语句调用
  * 普通方法需要对象调用或者静态方法直接调用静态方法.
* 执行不同
  * 构造方法在对象创建时就执行了，而且只执行一次。
  * 一般方法是在对象创建后，需要使用时才被对象调用，并可以被多次调用。

### this关键字在构造方法之间的调用
* 之前学习方法之间调用时，可以通过方法名进行调用。可是针对构造方法，无法通过构造方法名来相互调用。
* 使用关键字this来调用。通过参数来进行匹配。
* this()必须也在构造函数第一行。
* 语法格式
   ```
    this(参数);
   ```
 ```
 DEMO1:
   class Person {
   		// Person的成员属性
   		private int age;
   		private String name;

   		// 无参数的构造方法
   		Person() {
   		}

   		// 给姓名初始化的构造方法
   		Person(String nm) {
   			name = nm;
   		}

   		// 给姓名和年龄初始化的构造方法
   		Person(String nm, int a) {
   			// 由于已经存在给姓名进行初始化的构造方法 name = nm;因此只需要调用即可
   			// 调用其他构造方法，需要通过this关键字来调用
   			this(nm);
   			// 给年龄初始化
   			age = a;
   		}
   	}
 ```
 ```
  DEMO2:
  public class Person{
  private String name;
  private int age;
  public Person(){
   this("李四",20);//直接调用下面带参数构造函数进行赋初值
   }

   public Person(String name,int age){
   this.name=name;
   this.age=age;
   }
  }
 ```
   * 通过一个this()【调用其他的构造方法】 ，在一个构造方法中调用另一个构造方法，需要参数列表匹配即可，好处减少代码的编写
   * 调用其他构造方法的语句必须定义在构造方法的第一行，原因是初始化动作要最先执行。

### super()在子类中的调用父类构造方法
* 子类中的调用父类构造方法
  * 在创建子类对象时，父类的构造方法会先执行，因为**子类中所有构造方法的第一行有默认的隐式super();**。
    * 原因是：子类继承了父类的内容，所以创建对象时，必须要先看父类是如何对其内容进行初始化的
    ```
     public class Student extends Person {
     			 public Student(){
     			 	super();
     			 }
     		}
    ```
  * **只能在子类中调用父类的构造方法，使用super()，在父类中无法调用子类的构造方法**。
    * 即便是new 子类();依然是先执行弗雷德构造方法！！
  * super()语句也必须是在构造函数的第一行中。
  * **注意：**当父类中没有空参数构造方法时【比如父类重载构造函数】，子类的构造方法必须有显示的super语句，指定要访问的父类有参数构造方法,否则会报错。
    ```
     public class Person{
      public Person(int i){
      //内容
      }
     }

      public class Student extends Person{
       public Student(){
        super(0)
        }
      }

      //子类就必须手动添加 符合要求的super()方法，例如super(0);因为默认的是不带参数的。否则子类直接就会报错，编译失败。
    ```
  * 调用格式
    ```
     1.使用super(),调用的是父类中的空参数构造方法；
     2.使用super(参数)调用的是父类的有参数构造方法。
    ```
    ```
      public class Test {
      			public static void main(String[] args) {
      				new Zi();
      			}

      		}
      		class Fu{
      			int num ;
      			Fu(){
      				System.out.println("Fu构造方法"+num);
      				num = 4;
      			}
      		}
      		class Zi extends Fu{
      			Zi(){
      		         //super(); 调用父类空参数构造方法
      				System.out.println("Zi构造方法"+num);
      			}
      		}
      	// 执行结果：
      　　     Fu构造方法0
      　　     Zi构造方法4
    ```
### 是把this() 还是把super()放在构造函数第一行
* 肯定不能同时存在，仍选其一。
* 保证子类所有的的构造方法能够调用到父类的构造方法。
    ```
     public class Student extends Person{
     public Student(){
      this("abc");//调用的是自己的构造方法，同时间接调用了父类的构造方法
     }

     public Student(String s){
      super(2);
      }
     }
    ```
### 例子
 * A: 项目介绍
		某IT公司有多名员工，按照员工负责的工作不同，进行了部门的划分（研发部员工、维护部员工）。研发部根据所需研发的内容不同，又分为JavaEE工程师、Android工程师；维护部根据所需维护的内容不同，又分为网络维护工程师、硬件维护工程师。
		公司的每名员工都有他们自己的员工编号、姓名，并要做它们所负责的工作。
		工作内容
		JavaEE工程师：员工号为xxx的 xxx员工，正在研发淘宝网站
		Android工程师：员工号为xxx的 xxx员工，正在研发淘宝手机客户端软件
		网络维护工程师：员工号为xxx的 xxx员工，正在检查网络是否畅通
		硬件维护工程师：员工号为xxx的 xxx员工，正在修复打印机
		请根据描述，完成员工体系中所有类的定义，并指定类之间的继承关系。进行XX工程师类的对象创建，完成工作方法的调用。

* B: 案例分析
		根据上述部门的描述，得出如下的员工体系图

		根据员工信息的描述，确定每个员工都有员工编号、姓名、要进行工作。则，把这些共同的属性与功能抽取到父类中（员工类），关于工作的内容由具体的工程师来进行指定。
		工作内容
		JavaEE工程师：员工号为xxx的 xxx员工，正在研发淘宝网站
		Android工程师：员工号为xxx的 xxx员工，正在研发淘宝手机客户端软件
		网络维护工程师：员工号为xxx的 xxx员工，正在检查网络是否畅通
		硬件维护工程师：员工号为xxx的 xxx员工，正在修复打印机
		创建JavaEE工程师对象，完成工作方法的调用

* 代码
```
 * A:定义员工类(抽象类)
 		public abstract class Employee {
 			private String id;// 员工编号
 			private String name; // 员工姓名

 			//空参数构造方法
 			public Employee() {
 				super();
 			}
 			//有参数构造方法
 			public Employee(String id, String name) {
 				super();
 				this.id = id;
 				this.name = name;
 			}
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

* B :定义研发部员工类Developer 继承 员工类Employee
 		public abstract class Developer extends Employee {
 			//空参数构造方法
 			public Developer() {
 				super();
 			}
 			//有参数构造方法
 			public Developer(String id, String name) {
 				super(id, name);
 			}
 		}

* C:定义维护部员工类Maintainer 继承 员工类Employee
 		public abstract class Maintainer extends Employee {
 			//空参数构造方法
 			public Maintainer() {
 				super();
 			}
 			//有参数构造方法
 			public Maintainer(String id, String name) {
 				super(id, name);
 			}
 		}

* D:定义JavaEE工程师 继承 研发部员工类，重写工作方法
 		public class JavaEE extends Developer {
 			//空参数构造方法
 			public JavaEE() {
 				super();
 			}
 			//有参数构造方法
 			public JavaEE(String id, String name) {
 				super(id, name);
 			}

 			@Override
 			public void work() {
 				System.out.println("员工号为 " + getId() + " 的 " + getName() + " 员工，正在研发淘宝网站");
 			}
 		}

* E:定义Android工程师 继承 研发部员工类，重写工作方法
 		public class Android extends Developer {
 			//空参数构造方法
 			public Android() {
 				super();
 			}
 			//有参数构造方法
 			public Android(String id, String name) {
 				super(id, name);
 			}

 			@Override
 			public void work() {
 				System.out.println("员工号为 " + getId() + " 的 " + getName() + " 员工，正在研发淘宝手机客户端软件");
 			}
 		}

* F:定义Network网络维护工程师 继承 维护部员工类，重写工作方法
 		public class Network extends Maintainer {
 			//空参数构造方法
 			public Network() {
 				super();
 			}
 			//有参数构造方法
 			public Network(String id, String name) {
 				super(id, name);
 			}

 			@Override
 			public void work() {
 				System.out.println("员工号为 " + getId() + " 的 " + getName() + " 员工，正在检查网络是否畅通");
 			}
 		}

* G:定义Hardware硬件维护工程师 继承 维护部员工类，重写工作方法
 		public class Hardware extends Maintainer {
 			//空参数构造方法
 			public Hardware() {
 				super();
 			}
 			//有参数构造方法
 			public Hardware(String id, String name) {
 				super(id, name);
 			}

 			@Override
 			public void work() {
 				System.out.println("员工号为 " + getId() + " 的 " + getName() + " 员工，正在修复打印机");
 			}
 		}

* H:在测试类中，创建JavaEE工程师对象，完成工作方法的调用
 		public class Test {
 			public static void main(String[] args) {
 				//创建JavaEE工程师员工对象，该员工的编号000015，员工的姓名 小明
 				JavaEE ee = new JavaEE("000015", "小明");
 				//调用该员工的工作方法
 				ee.work();
 			}
 		}
```