# 访问权限修饰符

### 访问权限修饰符类型
![img](https://github.com/ericyishi/img-folder/blob/master/summary/backend/accessCtrlKeyWords.png)
* 不能同时使用的修饰符
  * 同时，abstract与private不能同时使用；
  * 同时，abstract与static不能同时使用；
  * 同时，abstract与final不能同时使用。
* 要想仅能在本类内部访问使用private修饰；
* 要想本包中的类都可以访问不加修饰符即可；
* 要想本包中的类与其他包中的子类可以访问使用protected修饰
* 要想所有包中的所有类都可以访问使用public修饰。
* **注意**如果类用public修饰，则类名必须与文件名相同。一个文件中只能有一个public修饰的类。

### public 关键字
* 公共访问,
* 能修饰：类,方法,成员变量

### protected 关键字
* 受保护访问
* 能修饰：方法,成员变量

### 默认不写
* 默认访问
* 能修饰：类,方法,成员变量


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


