# Java代码执行过程
### 1. 源文件
  * 源文件扩展名.java
    * Hello.java
    ```
      public class HelloWorld {
    	public static void main(String[] args) {
    		System.out.println("HelloWorld");
    		}
    	}
    ```
### 2. 编译
  * 通过编译器把源文件编译成字节码文件，字节码文件扩展名为.class
    * javac Hello.java
### 3. 运行
  * 最后使用解释器来运行字节码文件
    * java Hello(运行时不用写.class后缀名)
    * 运行结果为：

    ```
    HelloWorld
    ```
