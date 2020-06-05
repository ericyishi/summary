# 时间复杂度
* O(1)<O(log(n))<O(n)<O(nlog(n))<O(n^2)<O(2^n)<O(n!)
* n值越大差异越大
* 一个好的时间复杂度的程序，让更节约资源，性能更佳
### 例子
* 从1加到n
  * 方法1：
    ```
     sum=0
     for i in range(1,n)
      sum+=i
    ```
    * 执行了n次，时间复杂度为O(n)
  * 方法二：
    ```
     # 使用公式n(n+1)/2
     sum=n(n+1)/2
    ```
    * 只执行了1次，O(1)
* 斐波拉契
  * 常规写法
    ```
     def fib(n):
       if n<2:
         return n
       else:
         return fib(n-1)+fib(n-2)
    ```
    * O(2^n)