# 子类重写(override)
* 又称为复写或者覆盖
### 为何要重写
```
  功能不能够满足我们的需求,此时我们也不会去改这个方法,
  因为项目中可能有大量的功能已经使用到该方法,如果随意修改可能使调用该方法的功能出现问题,
  所以使用重写方式基于原有功能提供更强的功能.
```
### 重写的案例
* 需求
  * 比如手机，当描述一个手机时，它具有发短信，打电话，显示来电号码功能，
  * 后期由于手机需要在来电显示功能中增加显示姓名和头像，
  *	这时可以重新定义一个类描述智能手机，并继承原有描述手机的类。
  * 并在新定义的类中覆盖来电显示功能，在其中增加显示姓名和头像功能

* 分析
  * 对于发短信和打电话功能,让智能手机直接沿用(继承)手机的就可以
  * 但是在智能手机中的来电显示不但实现号码,还显示姓名和头像,同样的都是来电显示功能,智能手机的来电显示比手机的功能更加强大,我们考虑使用重写
```
  //手机类
  	class Phone{
  		public void sendMessage(){
  			System.out.println("发短信");
  		}
  		public void call(){
  			System.out.println("打电话");
  		}
  		public void showNum(){
  			System.out.println("来电显示号码");
  		}
  	}

  //智能手机类
  	class NewPhone extends Phone{
  		//覆盖父类的来电显示号码功能，并增加自己的显示姓名和图片功能
  		//从现实生活角度考虑沿用原有的showNum方法名便于用户更快熟悉和接受,而不是再起个新的名字
  		//用户还需要花费大量时间慢慢接受

  		public void showNum(){
  			//调用父类已经存在的功能使用super
                 //如果不加super这是调用子类自身的showNum(),自己调用自己,递归
                 //方法不断入栈导致内存溢出
  			super.showNum();


  			//增加自己特有显示姓名和图片功能
  			System.out.println("显示来电姓名");
  			System.out.println("显示头像");
  		}
  	}

  	public class Test {
  		public static void main(String[] args) {
  			new NewPhone().showNum();//来电显示  显示来电姓名 显示头像
  		}
  	}
```

### 子类重写注意事项
* 子类重写父类方法，必须保证子类的修饰符的权限>=父类方法修饰符的权限
    ```
    package com.test.inheritance
    public class Fu{
      public void show(){}
    }
    ```
    ```
    package com.test.inheritance
    public class ZI{
      void show(){}//这样会编译错误，使用默认权限，因为小于父类public访问权限
    }
    ```
    * 四大访问权限的范围
      * public>protected>不写（默认权限protected）>private
* 子类方法和要重写的父类的方法:方法的**方法名**和**参数列表**都要一样。
* 返回值类型
  * 如果是**基本数据类型**,子类的方法和重写的父类的方法返回值类型**必须相同**
  * 如果是引用数据类型,子类的方法和重写的父类的方法返回值类型可以相同或者子类方法的返回值类型是父类方法返回值类型的子类
  ```
   class Fu{
   	int show(){

   	}
   	public Fu method(){

   	}

   	public Fu method2(){

   	}

   }
   class Zi() extends Fu{
   	public int show(){//返回值为基本类型INT的重写，必须要和父类保持一致

   	}
   	public Fu method(){//子类的方法和重写的父类的方法返回值类型FU可以相同

   	}
   	public Zi method2(){//子类方法的返回值类型是父类方法返回值类型的子类
   	}
   }
  ```