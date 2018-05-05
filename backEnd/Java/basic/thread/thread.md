# 多线程
### 概念
1. 进程
   * 进程指正在运行的程序。确切的来说，当一个程序进入内存运行，即变成一个进程，进程是处于运行过程中的程序，并且具有一定独立功能。
2. 线程
   * 线程是进程中的一个执行单元，负责当前进程中程序的执行
   * 一个程序运行后至少有一个进程，一个进程中可以包含多个线程
3. 单线程
   * 一个程序中有一个线程顺序执行。
4. 多线程
   * 一个程序中有多个线程在同时执行。
5. 主线程
   * 当一个程序启动时，就有一个进程被操作系统（OS）创建，与此同时一个线程也立刻运行，该线程通常叫做程序的主线程。主线程是程序开始时就执行的
   * **jvm启动后，必然有一个执行路径(线程)从main方法开始的，一直执行到main方法结束，这个线程在java中称之为主线程**，当程序的主线程执行时，如果遇到了循环而导致程序在指定位置停留时间过长，则无法马上执行下面的程序，需要等待循环结束后能够执行。
6. 子线程
   * 如果你需要再创建线程，那么创建的线程就是这个主线程的子线程。

### 线程
1. 线程Thread类
   * Thread是程序中的执行线程。Java 虚拟机允许应用程序并发地运行多个执行线程。
   * 常用方法
     1. start() 该线程开始执行
     2. run() 该线程要执行的操作
     3. sleep(ms) 在指定毫秒数内让当前正在执行的线程休眠
   * 创建线程的目的
      * 是为了建立程序单独的执行路径，让多部分代码实现同时执行。也就是说线程创建并执行需要给定线程要执行的任务。
      * 主线程，它的任务定义在main函数中。自定义线程（子线程）需要执行的任务都定义在run方法中。
2. 创建方式：
   1. ***继承Thread类***
      * 该子类应重写 Thread 类的 run 方法。创建对象，开启线程。
      * run方法相当于其他线程的main方法。
      * 创建步骤：
        1. 定义一个类继承Thread。
        2. 重写run方法。
        3. 创建子类对象，就是创建线程对象。
        4. 调用start方法，开启线程并让线程执行，同时还会告诉jvm去调用run方法。
        ```
         // MyThread.java
         public class MyThread extends Thread {

	        public MyThread(String name) {

	        	super(name);
	        }

            //需要重写run()方法，因为Thread下的是没有内容
	        @Override
	        public void run() {
	        	for (int i = 0; i < 10; i++) {
	        		System.out.println(getName()+"正在执行！"+i);
	        	}
	        }
            }
        ```
        ```
         //Demo01.java
          public class Demo01 {
        	public static void main(String[] args) {
        		//创建自定义线程对象,传入的内容即是线程的名字
        		MyThread mt = new MyThread("新的线程！");
        		//开启新线程,会自动去运行run()方法的
        		mt.start();
        		//在主方法中执行for循环
        		for (int i = 0; i < 10; i++) {
        			System.out.println("main线程！"+i);
        		}
        	}
        }
        ```

   2. ***声明一个实现 Runnable 接口的类***
      * 该类实现 run 方法。然后创建Runnable的子类对象，传入到某个线程的构造方法中，开启线程。
      * Runnable接口用来指定每个线程要执行的任务。包含了一个 run 的无参数抽象方法，需要由接口实现类重写该方法。
      * 创建步骤:
        1. 定义类实现Runnable接口。
        2. 覆盖接口中的run方法。
        3. 创建Thread类的对象
        4. 将Runnable接口的子类对象作为参数传递给Thread类的构造函数。
        5. 调用Thread类的start方法开启线程。
      ```
        public class MyRunnable implements Runnable{

            //定义线程要执行的run方法逻辑
            @Override
            public void run() {

                for (int i = 0; i < 3; i++) {
                    System.out.println(Thread.currentThread().getName()+"正在执行！"+i);
                }
            }
        }
      ```
      ```
        public class RunnableDemo {
            public static void main(String[] args) {
                //创建线程执行目标类对象
                Runnable runn = new MyRunnable();
                //将Runnable接口的子类对象作为参数传递给Thread类的构造函数
                Thread thread = new Thread(runn);
                Thread thread2 = new Thread(runn);
                //开启线程
                thread.run();
                thread2.start();
                for (int i = 0; i < 5; i++) {
                    System.out.println(Thread.currentThread().getName()+"线程：正在执行！"+i);
                }
            }
        }


      ```
      * 运行结果
      ```
        main正在执行！0
        main正在执行！1
        main正在执行！2
        main线程：正在执行！0
        main线程：正在执行！1
        main线程：正在执行！2
        main线程：正在执行！3
        main线程：正在执行！4
        Thread-1正在执行！0
        Thread-1正在执行！1
        Thread-1正在执行！2
      ```
      * 实现Runnable的好处
        * 实现Runnable接口避免了单继承的局限性，所以较为常用。
        * 实现Runnable接口的方式，更加的符合面向对象，线程分为两部分，一部分线程对象，一部分线程任务。
        * 继承Thread类，线程对象和线程任务耦合在一起。一旦创建Thread类的子类对象，既是线程对象，有又有线程任务。
        * 实现runnable接口，将线程任务单独分离出来封装成对象，类型就是Runnable接口类型。Runnable接口对线程对象和线程任务进行解耦。

3. 获取线程名称
   * Thread.currentThread()获取当前线程对象
   * Thread.currentThread().getName();获取当前线程对象的名称
4. 线程对象调用 run方法和调用start方法区别
   * 线程对象调用run方法不开启线程。仅是对象调用方法。
   * 线程对象调用start开启线程，并让jvm调用run方法在开启的线程中执行。
   ```
    public class Demo2 {
    public static void main(String[] args){
        MyThread d = new MyThread("d1");
        MyThread d2 = new MyThread("d2");
        d.run();//没有开启新线程, 在主线程调用run方法
        d2.start();//开启一个新线程，新线程调用run方法
    }
   }
   ```
    * 执行结果：
   ```
     main正在执行！0
     main正在执行！1
     main正在执行！2
     main正在执行！3
     main正在执行！4
     main正在执行！5
     main正在执行！6
     main正在执行！7
     main正在执行！8
     main正在执行！9
     d2正在执行！0
     d2正在执行！1
     d2正在执行！2
     d2正在执行！3
     d2正在执行！4
     d2正在执行！5
     d2正在执行！6
     d2正在执行！7
     d2正在执行！8
     d2正在执行！9
   ```
### 线程的匿名内部类使用
* 用线程的内匿名内部类方式，可以方便的实现每个线程执行不同的线程任务操作。
* 方式1：创建线程对象时，直接重写Thread类中的run方法
  ```
     new Thread(){
          public void run(){
            System.out.println("!!!");
          }
        }.start();
  ```
* 方式2：使用匿名内部类的方式实现Runnable接口，重新Runnable接口中的run方法
  ```
    Runnable r = new Runnable(){
          public void run(){
            System.out.println("###");
          }
        };
    new Thread(r).start();
  ```
* 方式3：两者集合
  ```
    new Thread(new Runnable(){
          public void run(){
            System.out.println("@@@");
          }
        }).start();
  ```