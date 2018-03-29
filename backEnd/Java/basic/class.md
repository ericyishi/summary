# 类
### 类的定义
```
public class 类名{
		//属性定义
			修饰符 数据类型 变量名 = 值

		//方法定义
			修饰符 返回值类型  方法名(参数列表){
				  }
			}
```

```
 public class Phone{
 				/*
 				    定义手机的属性
 				*/
 				String color ;
 				String brand ;
 				double size ;
 			}
```

### 类的调用
* 1.导入包。**如果引用的文件和调用其的文件在同一个路径下则不需要导入引用文件的包。**
* 2.创建引用类型的变量。
数据类型 变量名=new 数据类型（）；
Phone p=new Phone();
* 3.编译谁？
运行谁，就编译谁。引用的会自动去编译成.class
```
  public class TestPhone{
  	public static void main(String[] args){
  		// 2: 创建引用类型的变量
  		Phone p = new Phone();
  		//System.out.println(p);  //输出内存的地址

  	    //3: 变量.类型中的功能
  		//变量 p.的方式,调用类中的属性
  		//属性就是变量 , 赋值和获取值
  		p.color = "土豪金";
  		p.brand = "爱立信";
  		p.size = 5.0;

  		//获取属性值
  		System.out.println(p.color+"  "+p.brand+"  "+p.size);
  	}
  }
```


### 调用内存图
![image](https://github.com/ericyishi/img-folder/blob/master/summary/backend/newClass.png)
### 实例化两个对象的内存图
![image](https://github.com/ericyishi/img-folder/blob/master/summary/backend/newClass2.png)
