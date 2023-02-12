# 线程
### 线程的定义
* 有时被称为轻量级进程，是程序执行流的最小单元。
* 一个标准的线程由线程ID，当前指令指针(PC），寄存器集合和堆栈组成。
* 线程是进程中的一个实体，是被系统独立调度和分派的基本单位，线程自己不拥有系统资源，只拥有一点儿在运行中必不可少的资源，但它可与同属一个进程的其它线程共享进程所拥有的全部资源。

### 多线程
* 在单个程序中同时运行多个线程完成不同的工作，称为多线程。多线程类似于同时执行多个不同程序
* 多线程优点：
  1. 使用线程可以把占据长时间的程序中的任务放到后台去处理。
  2. 程序的运行速度可能加快。
  3. 在一些等待的任务实现上如用户输入、文件读写和网络收发数据等，线程就比较有用了。在这种情况下我们可以释放一些珍贵的资源如内存占用等等。
* 模块：
  1. _thread：_thread是低级模块
  2. threading：threading是高级模块，对_thread进行了封装。绝大多数情况下，我们只需要使用threading这个高级模块。
     ```
	   threading.Thread(target=function_name,args=(param,)) ;
	 ```
	 * function_name: 需要线程去执行的方法名,注意**不要加括号**（）
     * args: 线程执行方法接收的参数，该属性是一个元组，如果只有一个参数也需要在末尾加**逗号**。
    ```html
    import threading
    class People():
    
        def speakName(self,name):
            print(name)
    
    
    if __name__=='__main__':
        p=People()
        th1=threading.Thread(target=p.speakName,args=('wangsan',)) #一个入参一定要加,因为是元组
        th2=threading.Thread(target=p.speakName,args=('lisi',))
        th1.start()
        th2.start()
    ``` 
    ```html
      执行结果为：
      wangsan
      lisi
 
    ```

    ```
	 # 使用线程列表的方式
	 if __name__ == '__main__':
		threads = []
		d = Demo()
		t1 = threading.Thread(target=d.movie,args=('魔兽世界',))
		threads.append(t1)
		t2 = threading.Thread(target=d.music,args=('演员',))
		threads.append(t2)
		for i in range(len(threads)):
		threads[i].start()
		print("all over %s" %ctime()
	```
### 线程守护
* 只要主线程结束了，无论子线程是否执行完成都会结束
```html
  '''
  进程守护
  '''
    import threading
    import time
    class People():
    
        def speakName(self,name):
            time.sleep(2)  #sleep2秒钟，为了让主线程先跑完
            print(name)
    
    
    if __name__=='__main__':
        p=People()
        th1=threading.Thread(target=p.speakName,args=('wangsan',))
        th2=threading.Thread(target=p.speakName,args=('lisi',))
        th1.setDaemon(True)
        th2.setDaemon(True)
        th1.start()
        th2.start()
        print('主线程结束')
```
```html
  运行结果：
    主线程结束  
```
* 只有这一个打印，没有机会打印出子线程里的内容，因为里面有个sleep2秒。还没有等到主线程就结束了。
* **注意**：
  * ①线程守护，需要每一个!子线程都要写:子线程.setDaemon(True),否则就可能失效
  * ②写在start之前
  
### 线程阻塞
* 阻塞主线程，让主线程在子线程结束后再结束
```html
    import threading
    import time
    class People():
    
        def speakName(self,name):
            print(name)
            print('\n')
    
    
    
    if __name__=='__main__':
        p=People()
        th1=threading.Thread(target=p.speakName,args=('wangsan',))
        th2=threading.Thread(target=p.speakName,args=('lisi',))
        th1.start()
        th2.start()
        th1.join()
        th2.join()
        print('主线程结束')
```  
```html
运行结果：
     wangsan
     lisi
     主线程结束
```
* **注意**：
  * ①线程阻塞，每一个子线程都需要写join
  * ②写在start之后

### 线程锁
* 多线程对同一个对象进行操作就会出现不安全情况
* 由于锁只有一个，无论多少线程，同一时刻最多只有一个线程持有该锁，所以，不会造成修改的冲突。
```
    balance = 0
	lock = threading.Lock()
	def run_thread(n):
	for i in range(100000):
	# 先要获取锁:
	lock.acquire()
	try:
	# 放心地改吧:
	change_it(n)
	finally:
	# 改完了一定要释放锁:
	lock.release()
```
### 进程池

### 全局锁【GIL】
```
 启动与CPU核心数量相同的N个线程，在4核CPU上可以监控到CPU占用率仅有102%，
也就是仅使用了一核。
但是用C、C++或Java来改写相同的死循环，直接可以把全部核心跑满，4核就跑到
400%，8核就跑到800%，为什么Python不行呢？
因为Python的线程虽然是真正的线程，但解释器执行代码时，有一个GIL锁：Global
Interpreter Lock，任何Python线程执行前，必须先获得GIL锁，然后，每执行100条字节码，
解释器就自动释放GIL锁，让别的线程有机会执行。这个GIL全局锁实际上把所有线程的执行
代码都给上了锁，所以，多线程在Python中只能交替执行，即使100个线程跑在100核CPU
上，也只能用到1个核。 GIL是Python解释器设计的历史遗留问题，通常我们用的解释器是
官方实现的CPython，要真正利用多核，除非重写一个不带GIL的解释器。 所以，在Python
中，可以使用多线程，但不要指望能有效利用多核。如果一定要通过多线程利用多核，那只
能通过C扩展来实现，不过这样就失去了Python简单易用的特点。 不过，也不用过于担心，
Python虽然不能利用多线程实现多核任务，但可以通过多进程实现多核任务。多个Python
进程有各自独立的GIL锁，互不影响。
```
* 解决办法：
  1. 更换解释器 比如使用jpython(java实现的python解释器)
  2. 使用多进程完成多任务的处理
	
* 描述Python GIL的概念， 以及它对python多线程的影响？编写一个多线程抓取网页的程序，并阐明多线程抓取程序是否可比单线程性能有提升，并解释原因。
```
 Python语言和GIL没有半毛钱关系。仅仅是由于历史原因在Cpython虚拟机(解释器)，难以移除GIL。
 GIL：全局解释器锁。每个线程在执行的过程都需要先获取GIL，保证同一时刻只有一个线程可以执行代码。
 线程释放GIL锁的情况： 在IO操作等可能会引起阻塞的system call之前,可以暂时释放GIL,但在执行完毕后,
必须重新获取GIL Python 3.x使用计时器（执行时间达到阈值后，当前线程释放GIL）或Python 2.x，tickets计数
达到100
 Python使用多进程是可以利用多核的CPU资源的。
 多线程爬取比单线程性能有提升，因为遇到IO阻塞会自动释放GIL锁
 结论:
  1. 在处理像科学计算 这类需要持续使用cpu的任务的时候 单线程会比多线程快
  2. 在处理像IO操作等可能引起阻塞的这类任务的时候 多线程会比单线程
```

### 线程池
* 我们知道系统处理任务时，需要为每个请求创建和销毁对象。当有大量并发任务需要处理时，再使用传统的多线程就会造成大量的资源创建销毁导致服务器效率的下降。这时候，线程池就派上用场了。
* 线程池技术为线程创建、销毁的开销问题和系统资源不足问题提供了很好的解决方案。
* 当有很多任务需要采用线程执行的时候，而且有时可能会创建很多线程的时候，最好使用下线程池。
* 线程池的好处：
1:提高效率 
  * 创建好一定数量的线程放在池中，等需要使用的时候就从池中拿一个，这要比需要的时候创建一个线程对象要快的多。
2:方便管理
  * 可以编写线程池管理代码对池中的线程统一进行管理，比如说系统启动时由该程序创建100个线程，每当有请求的时候，就分配一个线程去工作，如果刚好并发有101个请求，那多出的这一个请求可以排队等候，避免因无休止的创建线程导致系统崩溃。
```
# 未使用线程池
 import time
def sayhello(str):
    print "Hello ",str
    time.sleep(2)

name_list =['xiaozi','aa','bb','cc']
start_time = time.time()
for i in range(len(name_list)):
    sayhello(name_list[i])
print '%d second'% (time.time()-start_time)
```

```
# 使用了线程池的方法
import time
import threadpool  
def sayhello(str):
    print "Hello ",str
    time.sleep(2)

name_list =['xiaozi','aa','bb','cc']
start_time = time.time()
pool = threadpool.ThreadPool(10) 
requests = threadpool.makeRequests(sayhello, name_list) 
[pool.putRequest(req) for req in requests] 
pool.wait() 
print '%d second'% (time.time()-start_time)

#使用多线程，非线程池的方式

import time
import threading
def sayhello(str):
    print ("Hello ",str)
    time.sleep(2)

name_list =['xiaozi','aa','bb','cc']
start_time = time.time()

threads=[]
for i in name_list:
    t=threading.Thread(target=sayhello,args=(i,))
    threads.append(t)

for j in range(len(threads)):
    threads[j].start()#启动线程



for k in range(len(threads)):
    threads[k].join() #线程阻塞，让主线程在子线程结束后再结束。但不能把这个线程阻塞写在线程启动后的循环里，因为他会每个等待2s后再去创建下一个线程，所以时间为8s

print('%d second' % (time.time() - start_time)) #2s
```
* 线程池的使用：
  1. 引入threadpool模块
  2. 定义线程函数
  3. 创建线程 池threadpool.ThreadPool()
  4. 创建需要线程池处理的任务即threadpool.makeRequests()
  5. 将创建的多个任务put到线程池中,threadpool.putRequest
  6. 等到所有任务处理完毕theadpool.pool()
