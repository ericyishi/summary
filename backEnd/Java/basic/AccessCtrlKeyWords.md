# 访问控制关键字
### private关键字
 * A.private概述
	* private可以修饰成员内容包括成员方法和成员变量
	* 被private修饰的内容不能在其他类访问
 * B.使用步骤
	* 1、通过private修饰属性
 * C.完整代码
 ```
  	class Person {
  			private int age;
  			private String name;

  			public void show() {
  				System.out.println("age=" + age + ",name" + name);
  			}
  		}
 ```

