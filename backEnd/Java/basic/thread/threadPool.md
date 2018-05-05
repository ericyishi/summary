# 线程池
### 概念
* 线程池，其实就是一个容纳多个线程的容器
* 其中的线程可以反复使用，省去了频繁创建线程对象的操作，无需反复创建线程而消耗过多资源。
* 线程池主要用来解决线程生命周期开销问题和资源不足问题。
  ```
   在java中，如果每个请求到达就创建一个新线程，开销是相当大的。
   在实际使用中，创建和销毁线程花费的时间和消耗的系统资源都相当大，
   甚至可能要比在处理实际的用户请求的时间和资源要多的多。
   除了创建和销毁线程的开销之外，活动的线程也需要消耗系统资源。
   如果在一个jvm里创建太多的线程，可能会使系统由于过度消耗内存或“切换过度”而导致系统资源不足。
   为了防止资源不足，需要采取一些办法来限制任何给定时刻处理的请求数目，
   尽可能减少创建和销毁线程的次数，
   特别是一些资源耗费比较大的线程的创建和销毁，尽量利用已有对象来进行服务。
   通过对多个任务重复使用线程，线程创建的开销就被分摊到了多个任务上了，
   而且由于在请求到达时线程已经存在，所以消除了线程创建所带来的延迟。
   这样，就可以立即为请求服务，使用应用程序响应更快。
   另外，通过适当的调整线程中的线程数目可以防止出现资源不足的情况。
  ```

### 使用线程池的方式
* 方式1：Runnable接口
  * 通常，线程池都是通过线程池工厂创建，再调用线程池中的方法获取线程，再通过线程去执行任务方法。
  * Executors：线程池创建工厂类
    ```
     public static ExecutorService newFixedThreadPool(int nThreads)：返回线程池对象
     //创建线程池对象
	   ExecutorService service = Executors.newFixedThreadPool(2);//包含2个线程对象
    ```
  * ExecutorService：线程池类
    ```
     Future<?> submit(Runnable task)：获取线程池中的某一个线程对象，并执行
    ```
    * Future接口：用来记录线程任务执行完毕后产生的结果。线程池创建与使用
  * 使用线程池中线程对象的步骤：
    1. 创建线程池对象
    2. 创建Runnable接口子类对象
    3. 提交Runnable接口子类对象
    4. 关闭线程池

  * demo
    ```
        import java.util.concurrent.ExecutorService;
        import java.util.concurrent.Executors;

        public class ThreadPoolDemo {
            public static void main(String[] args) {
                //创建线程池对象
                ExecutorService service = Executors.newFixedThreadPool(5);//包含2个线程对象
                //创建Runnable实例对象
                MyRunnable r = new MyRunnable();

                //自己创建线程对象的方式
                //Thread t = new Thread(r);
                //t.start(); ---> 调用MyRunnable中的run()

                //从线程池中获取线程对象,然后调用MyRunnable中的run()
                service.submit(r);
                //再获取个线程对象，调用MyRunnable中的run()
                service.submit(r);
                service.submit(r);

        //注意：submit方法调用结束后，程序并不终止，是因为线程池控制了线程的关闭。将使用完的线程又归还到了线程池中

        //关闭线程池
                service.shutdown();
            }
        }

    ```
    * 执行结果：
    ```
     pool-1-thread-1正在执行！0
     pool-1-thread-1正在执行！1
     pool-1-thread-1正在执行！2
     pool-1-thread-3正在执行！0
     pool-1-thread-3正在执行！1
     pool-1-thread-3正在执行！2
     pool-1-thread-2正在执行！0
     pool-1-thread-2正在执行！1
     pool-1-thread-2正在执行！2
    ```
    * 上面例子我们可以看到如果任务数小于线程池中的线程数，所以只需开启相应的线程个数即可。
    * 使用完了以后，又将线程归还个线程池中
    * 注意如果不关闭线程池service.shutdown();，那么这个程序并不终止。


* 方式2：Callable接口
  * Callable接口：与Runnable接口功能相似，用来指定线程的任务。其中的call()方法，用来返回线程任务执行完毕后的结果，call方法可抛出异常。
  * Callable接口实现类,call方法可抛出异常、返回线程任务执行完毕后的结果
  * 对于有返回值的使用Future 来接收结果对象
    ```
     Future<Integer> result = threadPool.submit(c);
    ```
     * Future.get()获取结果
     ```
      Integer s = result.get();
      System.out.println(s);
     ```
  * demo
    ```
    // MyCallable.java
     import java.util.concurrent.Callable;
     public class MyCallable implements Callable {
         @Override
         public Object call() throws Exception {
             System.out.println("我要一个教练:call");
             Thread.sleep(2000);
             System.out.println("教练来了： " +Thread.currentThread().getName());
             System.out.println("教我游泳,交完后,教练回到了游泳池");
             return null;
         }
     }
    ```
    ```
    import java.util.concurrent.ExecutorService;
    import java.util.concurrent.Executors;

    public class ThreadPoolDemo2 {
        public static void main(String[] args) {
            //创建线程池对象
            ExecutorService service = Executors.newFixedThreadPool(2);//包含2个线程对象
            //创建Callable对象
            MyCallable c = new MyCallable();

            //从线程池中获取线程对象,然后调用MyRunnable中的run()
            service.submit(c);

            //再获取个教练
            service.submit(c);
            service.submit(c);
    //注意：submit方法调用结束后，程序并不终止，是因为线程池控制了线程的关闭。将使用完的线程又归还到了线程池中

    //关闭线程池
            //service.shutdown();
        }
    }

    ```
     * 结果：
    ```
     我要一个教练:call
     我要一个教练:call
     教练来了： pool-1-thread-1
     教我游泳,交完后,教练回到了游泳池
     我要一个教练:call
     教练来了： pool-1-thread-2
     教我游泳,交完后,教练回到了游泳池
     教练来了： pool-1-thread-1
     教我游泳,交完后,教练回到了游泳池
    ```
  * demo2
     ```

     /*
      * 使用多线程技术,求和
      * 两个线程,1个线程计算1+100,另一个线程计算1+200的和
      * 多线程的异步计算
      */
     public class ThreadPoolDemo {
       public static void main(String[] args)throws Exception {
         ExecutorService es = Executors.newFixedThreadPool(2);
         Future<Integer> f1 =es.submit(new GetSumCallable(100));
         Future<Integer> f2 =es.submit(new GetSumCallable(200));
         System.out.println(f1.get());
         System.out.println(f2.get());
         es.shutdown();
       }
     }



     public class GetSumCallable implements Callable<Integer>{
       private int a;
       public GetSumCallable(int a){
         this.a=a;
       }

       public Integer call(){
         int sum = 0 ;
         for(int i = 1 ; i <=a ; i++){
           sum = sum + i ;
         }
         return sum;
       }
     }
  ```