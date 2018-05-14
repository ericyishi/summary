# 注释annotation
### 概述
* jdk5之后提供了一个特性,和类、接口同级
* 注解本质就是一个接口
* 格式
  ```
   public @interface 注解名{}
  ```
* 作用:
   * 编译检查
   * 替代配置文件
   * 定义注解(元注解:注解上的注解)
   * 分析代码(用到反射)
### java中3个注解
* @Override:声明该方法是从父类上继承过来的,执行编译期的检查
  * 这个注解只能定义在方法上，类上不可以
* @SuppressWarnings:抑制警告，让警告不显示。
  * 注解属性的值有好多,只需要知道一个all就可以了，抑制所有的警告
  * @SuppressWarnings("all")
* @Deprecated：不赞成使用该方法【原因可能过时了，可能有bug】
  * 作用于方法上，会让该方法名，划一条直线
### 自定义注释
* 注解属性:
  * 注解本质就是一个接口,接口中可以有常量和抽象方法
  * 抽象方法在注解中就称之为注解属性
* 注解属性类型:
  1. String
  2. Class
  3. Annotation
  4. Enum:枚举
* 格式
  ```
   public @interface myannotation{
            //注解属性
            int i();
            String s();
            String[] ss();
            Class cl();
            MyAnnotation1 m1();
           }
  ```
  * **注意**一旦注解有属性了,使用注解的时候必须赋值,(除非这个注解属性有默认值)
    ```
         public @interface myannotation{
                //注解属性
                int i();
               }
           __________________________________
          @myannotation(i=3)
            public class demo{

           }
    ```
  * 赋值的格式:
    ```
     @注解名(属性名=属性值)

     若注解类型为数组,且只有一个值的时候,可以有两种写法
        方式1:
		     属性名 = { 属性值 }

	    方式2:
			 属性名=属性值
     多个值的时候:
         @myannotation(i=3,s="hello")

    ```
    * **注意**若定义的时候属性名为value的时候,且只有这一个属性的时候，需要为这个value属性赋值的时候,value可以省略
      ```
        @myannotation(12)
      ```
* 元注解
  * 定义在注解上的注解
  * 元注解的注解种类
    1. @Retention
       * 规定注解保留到什么阶段【注解的生命周期】
         1. SOURCE:[默认]只在代码中保留,在字节码文件中就删除了
		 2. CLASS:在代码和字节码文件中保留
		 3. RUNTIME:【要手动设置成runtime才能够在所有阶段都保留】
    2. @Target
       * 规定注解作用在什么上面，值为ElementType的枚举值
         1. TYPE:作用在类、接口等上面
		 2. METHOD:作用方法上面
		 3. FIELD:作用字段上面
		 ```
		  @Target(ElementType.METHOD)
		  public @interface MyAnnotation4 {

		  }
		 ```
* demo
```
 //在一个类的方法中添加一个@MyTest,在另一个类的main方法中,就可以执行带有@MyTest的方法
 技术分析:
	* 注解
	* 反射
 1.定义一个注解 @MyTest
		 MyTest.java
		 package com.a_annotation;

		import java.lang.annotation.ElementType;
		import java.lang.annotation.Retention;
		import java.lang.annotation.RetentionPolicy;
		import java.lang.annotation.Target;
		//注解在运行时保留
		@Retention(RetentionPolicy.RUNTIME)

		//注解只能作用在方法上
		@Target(ElementType.METHOD)
		public @interface MyTest {

		}
 2.在一个测试类 MyTestTest 上的添加几个方法
			在方法上添加@MyTest

			//MyTestTest.java
			package com.itheima.a_annotation;
			public class MyTestTest {
				@MyTest
				public void f1(){
					System.out.println("f1方法执行了~~~~");
				}

				public void f2(){
					System.out.println("f2方法执行了~~~~");
				}

				@MyTest
				public void f3(){
					System.out.println("f3方法执行了~~~~");
				}
			}

 3. 在另一个有主方法的类上添加main方法
 	```
 	 运行main方法的时候,需要将带有 @MyTest注解的方法执行
			//MainTest.java
			package com.itheima.a_annotation;
			import java.lang.reflect.InvocationTargetException;
			import java.lang.reflect.Method;

			public class MainTest {
				/*public static void main(String[] args) {
					//运行这个类的时候 需要将 测试类中带有@mytest所有方法执行
					//获取字节码对象
					Class clazz=MyTestTest.class;

					//获取所有的方法
					Method[] arr = clazz.getMethods();

					//让方法执行
					for (Method m : arr) {
						//打印所有方法的名称
						System.out.println(m.getName());
					}
				}*/

				public static void main(String[] args) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException, InstantiationException {
					//运行这个类的时候 需要将 测试类中带有@mytest所有方法执行
					//获取字节码对象
					Class clazz=MyTestTest.class;

					//获取所有的方法
					Method[] arr = clazz.getMethods();

					//让带有注解的方法执行
					for (Method m : arr) {
						//获取有注解的方法

						//判断方法是否有指定的注解
						boolean flag=m.isAnnotationPresent(MyTest.class);
						if(flag){
							//System.out.println(m.getName());
							//让方法执行，必须是public，无参的才能执行
							m.invoke(clazz.newInstance());
						}
					}
				}
			}
 	```
```