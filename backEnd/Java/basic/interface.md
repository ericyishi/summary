# 接口interface
### 接口的概念
* 接口是功能的集合，可以看做是一种数据类型，是比抽象类更为抽象的“类”。
* 接口只描述所应具备的方法，并没有具体的实现。
  * 与抽象类的区别：抽象类里面可以定义具体的方法，供子类直接调用，接口里面不能有具体的方法，全都是抽象方法，所以只能通过子类来完成
* 接口实现了功能的定义与实现的分离，解开了耦合性，扩展性就增强了
* 一切事物均有特定功能，即一切事物均有接口【不在事物本身体系类的，提供的额外功能叫做接口。】

### 接口的好处
* 1、接口的出现扩展了功能。
* 2、接口其实就是暴漏出来的规则。
* 3、接口的出现降低了耦合性，即设备与设备之间实现了解耦。
### 接口的定义
* 定义格式
```
 public interface 接口类{
 抽象方法1；//不能定义带有方法体的方法
 抽象方法2；
 抽象方法3；
 }
 //抽象方法的格式：public abstract 返回值类型 方法名字（参数列表）
```
```
public interface MyInterface{
public static final int a=1;// a的值不能改变
public abstract void function();
}
```
* 注意事项
  * 1. **成员方法**。接口中的方法均为公共的访问抽象方法，修饰符是固定的,只能是public。如果不写，系统会自动默认为public，建议直接写上【在重写接口中的方法，如果不写public的权限，默认是default的，所以相当于降低了权限，编译报错】。
    ```
    格式：
    public abstract 返回值类型 方法名（参数列表）
    ```
  * 2. **成员变量**。接口中无法定义普通的成员变量，有严格的要求，必须定义为常量。
    ```
    格式：
    public static final 数据类型 变量名=值
    ```
     * static 可以被类名（接口名）直接通过“. ”的方式直接调用【没有static需要通过对象来调用】。
     * 2.在接口中定义成员变量（常量）时，**public static final修饰符可以省略**，系统默认会自动有的！

### 类与接口的关系
* 类**实现**(implements)接口【类继承抽象类】
* 实现接口的类被称为实现类
* 实现类只重写接口中一部分抽象方法，那么实现类只是相当于继承，实现类依然是一个抽象类。
```
格式：
 class 类 implements 接口{
 //重写接口中的抽象方法
 }
```

### 接口的多实现
* 解决多继承的弊端【多继承时，当多个父类中有相同功能时，子类调用会产生不确定性。】。将多继承这种机制在java中通过多实现完成了
* 其实核心原因就是在于多继承父类中功能有主体，而导致调用运行时，不确定运行哪个主体内容。
* 为什么多实现能解决了呢？因为接口中的功能都没有方法体，由子类来明确。
```
public interface A{
 public abstract void a();
}

public interface B{
 public abstract void b();
}
```
```
class C implements A,B{
public void a(){} // 多实现。同时实现多个接口
public void b(){}
}
```

### 类在继承的同时实现多接口
* 子类通过继承父类扩展功能，通过继承扩展的功能都是子类应该具备的基础功能。如果子类想要继续扩展其他类中的功能呢？这时通过实现接口来完成。
* 接口的出现避免了单继承的局限性。**父类中定义的事物的基本功能。接口中定义的事物的扩展功能。**
```
 class Fu {
	public void show(){}
		}

 interface Inter {
	pulbic abstract void show1();
  }

 class Zi extends Fu implements Inter {
	public void show1() {
			}
  }
```

### 接口的多继承
* 多个接口之间可以使用extends进行继承。
```
interface Fu1{
	pulbic abstract void show();
		}
interface Fu2{
	pulbic abstract void show1();
		}
interface Fu3{
	pulbic abstract void show2();
		}

interface Zi extends Fu1,Fu2,Fu3{
	pulbic abstract void show3();
		}
```
* 类与类之间是通过继承产生关系，接口和类之间可以通过实现产生关系，接口和接口之间是通过继承产生关系
* 在开发中如果多个接口中存在相同方法，这时若有个类实现了这些接口，那么就要实现接口中的方法，由于接口中的方法是抽象方法，子类实现后也不会发生调用的不确定性。
* **问：JAVA中有多继承么？**
```
答：
①类没有多继承；
②接口之间多继承；
```
### 接口实现的例子
```
 	犬：
	|---行为：
	|---吼叫；
	|---吃饭；
	* 缉毒犬：
		|---行为：
		|---吼叫；
		|---吃饭；
		|---※缉毒；
#分析：
 1. 由于犬分为很多种类，他们吼叫和吃饭的方式不一样，在描述的时候不能具体化，也就是吼叫和吃饭的行为不能明确。
 2. 当描述行为时，行为的具体动作不能明确，这时，可以将这个行为写为抽象行为，那么这个类也就是抽象类
 3. 可是当缉毒犬有其他额外功能时，而这个功能并不在这个事物的体系中。这时可以让缉毒犬具备犬科自身特点的同时也有其他额外功能，可以将这个额外功能定义接口中。
```
```
public interface 缉毒{
		public abstract void 缉毒();
		}

//定义犬科的共性功能
public abstract class 犬科{
    public abstract void 吃饭();
    public abstract void 吼叫();
}

// 缉毒犬属于犬科一种，让其继承犬科，获取的犬科的特性，
//由于缉毒犬具有缉毒功能，那么它只要实现缉毒接口即可，这样即保证缉毒犬具备犬科的特性，也拥有了缉毒的功能
class 缉毒犬 extends 犬科 implements 缉毒{
	public void 缉毒() {
	}
	public void 吃饭() {
	}
	public void 吼叫() {
	}
}

class 缉毒猪 implements 缉毒{//让不同的类也能实现这个接口
	public void 缉毒() {
	}
}
```
### 接口和实现类的区别总结
* 相同点:
 	1. 都位于继承的顶端,用于被其他类实现或继承;
 	2. 都不能直接实例化对象;
 	3. 都包含抽象方法,其子类都必须覆写这些抽象方法;
* 区别:
 	1. 抽象类为部分方法提供实现,避免子类重复实现这些方法,提高代码重用性;接口只能包含抽象方法;
 	1. 一个类只能继承一个直接父类(可能是抽象类),却可以实现多个接口;(接口弥补了Java的单继承)
 	1. 抽象类是这个事物中应该具备的内容, 继承体系是一种 is..a关系
 	1. 接口是这个事物中的额外内容,继承体系是一种 like..a关系

* 二者的选用:
 	1. 优先选用接口,尽量少用抽象类;
 	1. 需要定义子类的行为,又要为子类提供共性功能时才选用抽象类;

### 案例
```
// 笔记本电脑案例代码实现
定义鼠标、键盘，笔记本三者之间应该遵守的规则
interface USB {
	void open();// 开启功能

	void close();// 关闭功能
}

	鼠标实现USB规则
class Mouse implements USB {
	public void open() {
		System.out.println("鼠标开启");
	}

	public void close() {
		System.out.println("鼠标关闭");
	}
}

	键盘实现USB规则
class KeyBoard implements USB {
	public void open() {
		System.out.println("键盘开启");
	}

	public void close() {
		System.out.println("键盘关闭");
	}
}

	定义笔记本
class NoteBook {
	// 笔记本开启运行功能
	public void run() {
		System.out.println("笔记本运行");
	}

	// 笔记本使用usb设备，这时当笔记本对象调用这个功能时，必须给其传递一个符合USB规则的USB设备
	public void useUSB(USB usb) {
		// 判断是否有USB设备
		if (usb != null) {
			usb.open();
			usb.close();
		}
	}

	public void shutDown() {
		System.out.println("笔记本关闭");
	}
}

public class Test {
	public static void main(String[] args) {
		// 创建笔记本实体对象
		NoteBook nb = new NoteBook();
		// 笔记本开启
		nb.run();

		// 创建鼠标实体对象
		Mouse m = new Mouse();
		// 笔记本使用鼠标
		nb.useUSB(m);

		// 创建键盘实体对象
		KeyBoard kb = new KeyBoard();
		// 笔记本使用键盘
		nb.useUSB(kb);

		// 笔记本关闭
		nb.shutDown();
	}
}
```


### 接口作为方法参数与返回值
1. 接口作为方法参数
   * 接口作为方法参数的情况是很常见的，经常会碰到。当遇到方法参数为接口类型时，那么该方法要**传入一个接口实现类对象**。
     ```
       //接口
       		interface Smoke{
       			public abstract void smoking();
       		}
       		class Student implements Smoke{
       			@Override
       			public void smoking() {
       				System.out.println("课下吸口烟，赛过活神仙");
       			}
       		}
       		//测试类
       		public class Test {
       			public static void main(String[] args) {
       				//通过多态的方式，创建一个Smoke类型的变量，而这个对象实际是Student
       				Smoke s = new Student();
       				//调用method方法
       				method(s);
       			}

       			//定义一个方法method，用来接收一个Smoke类型对象，在方法中调用Smoke对象的show方法
       			public static void method(Smoke sm){//接口作为参数
       				//通过sm变量调用smoking方法，这时实际调用的是Student对象中的smoking方法
       				sm.smoking();
       			}
       		}
     ```

2. 接口作为方法返回值
   * 当遇到方法返回值是接口类型时，那么该方法需要**返回一个接口实现类对象**。
     ```
       //接口
       		interface Smoke{
       			public abstract void smoking();
       		}
       		class Student implements Smoke{
       			@Override
       			public void smoking() {
       				System.out.println("课下吸口烟，赛过活神仙");
       			}
       		}
       		//测试类
       		public class Test {
       			public static void main(String[] args) {
       				//调用method方法，获取返回的会吸烟的对象
       				Smoke s = method();
       				//通过s变量调用smoking方法,这时实际调用的是Student对象中的smoking方法
       				s.smoking();
       			}

       			//定义一个方法method，用来获取一个具备吸烟功能的对象，并在方法中完成吸烟者的创建
       			public static Smoke method(){
       				Smoke sm = new Student();
       				return sm;
       			}
       		}
     ```