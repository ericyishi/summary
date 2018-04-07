# 继承
### 继承的概念
* 子类会自动拥有父类所有**可继承的**（除开私有的）属性和方法。
### 继承的体系
  * a: 父类: 具有所有子类的共性内容;
	   子类: 不但有共性还有自身特有的内容
  * b: 整个继承体系,越向上越抽象,越向下越具体
### 继承的格式和使用
   ```
     class 子类 extends 父类{}
   ```
   使用的方式：
   * ①子类可以直接使用父类中的可继承的成员变量
   * ②通过子类的对象去调用也可以。
### 继承的好处
* 1.提高代码的复用性。
* 2.继承的出现让类与类之间产生了关系
### 注意事项
* JAVA中，类只支持单继承，**不允许多继承**【一个类只能有一个父类】
* 可以多层次继承
```
 class A{public void function(){}}
 class B extends A{public void function(){}}
 class C extends B{}
 new C().function();//这是调用的B中的方法
 C类：同时拥有A和B的属性和方法
 B类：只能拥有A类属性和方法
```
* 继承后成员变量的特点
  * 子类的对象，调用成员变量：
    * 1.子类自己有该成员变量，则使用自己的；
    * 2.子类自己没有，则调用父类的
    * 3.层级向上寻找，如果都没有，就报错了。
    ```
      	class Fu{
     		//Fu中的成员变量。
     		int num = 5;
     	}

     	class Zi extends Fu{
     		//Zi中的成员变量
     		int num2 = 6;
     		//Zi中的成员方法
     		public void show()
     		{
     			//访问父类中的num
     			System.out.println("Fu num="+num);
     			//访问子类中的num2
     			System.out.println("Zi num2="+num2);
     		}
     	}

     	class Demo{
     		public static void main(String[] args)
     		{
     			Zi z = new Zi(); //创建子类对象
     			z.show(); //调用子类中的show方法
     		}
     	}
    ```
  * 当子类出现同名的成员变量时，在子类中若要访问父类中的成员，必须使用关键字**super**
    ```
    super.xxx();
    ```
    * super出现在继承了父类的子类中。
    * super用来表示当前对象中包含的父类对象的空间的引用。
    ```
      class Fu{
     			//Fu中的成员变量。
     			int num = 5;
     		 }

      class Zi extends Fu{
      	//Zi中的成员变量
      	int num = 6;
      	void show(){
      		//子类的局部变量
      		int num=7

      		//直接访问,遵循就近查找原则
                    System.out.println(num);//7

      		//子父类中出现了同名的成员变量时
      		//在子类中需要访问父类中非私有成员变量时，需要使用super关键字
      		//访问父类中的num
      		System.out.println("Fu num="+super.num);//5


      		//访问子类中的num2
      		System.out.println("Zi num2="+this.num);//6
      	}
      }

     class Demo5 {
     	public static void main(String[] args)
     	{
     		Zi z = new Zi(); //创建子类对象
     		z.show(); //调用子类中的show方法
     	}
     }

    ```


