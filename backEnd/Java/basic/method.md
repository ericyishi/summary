# 方法
### 方法的定义格式
```
 修饰符 返回值类型 方法的名字 （参数类型 参数名1,参数类型 参数名2...）{
    方法的主体
 return 返回值;
 }
```

例如：

```
无返回值：
  public static void consl(String content){
    system.out.println(content);
  }
```
```
    public static double getArea(double w,double h){
         return w*h;
    }
```


* 修饰符：目前就用 public static。后面我们再详细的讲解其他的修饰符。
* 返回值类型一定要与return出来的结果类型保持一致。
* 没有返回值，直接写void，后面可以不用跟return。
* 方法的定义是没有顺序的，写在main函数的上边或者下边都可以。但方法写在类中。
* 方法定义的时候，形参需要带上类型，但是调用时候，实参是不用写上类型的。



```
定义：
public static void printStore(String[] brand,double[] size,double[] price,int[] count){
				System.out.println("----------商场库存清单----------");
				System.out.println("品牌型号     尺寸    价格    库存数");
				//定义变量,计算总库存数,和总价格
				int totalCount = 0;
				int totalMoney = 0;
				//遍历数组,将数组中所有的商品信息打印出来
				for(int i = 0 ; i < brand.length ; i++){
					System.out.println(brand[i]+"   "+size[i]+"    "+price[i]+"   "+count[i]);
					totalCount += count[i];
					totalMoney += count[i]*price[i];
				}
				System.out.println("总库存数: "+totalCount);
				System.out.println("商品库存总金额: "+totalMoney);
			}
```

```
调用：
            String[] brand = {"MacBookAir","ThinkpadT450"};
	double[] size = {13.3,15.6};
	double[] price = {9998.97,6789.56};
	int[] count = {0,0};
	 printStore(brand,size,price,count);
```
### 方法调用内存图
![image](https://github.com/ericyishi/img-folder/blob/master/summary/backend/callMethodInMem.png)
### 方法的重载【overload】
* 在<u>同一个类</u>中，<u>方法名</u>相同，<u>参数列表(个数、类型、顺序)</u>不同。与返回值类型无关。

		* 参数列表不同：
			* A:参数 个数! 不同
			* B:参数 类型! 不同
			* C:参数的顺序不同(算重载,但是在开发中不用)

    ```
    * B: 案例代码
    		* public static int getSum(int a,int b){
    			System.out.println("两个int参数");
    			return a+b;
    		}
    		* public static int getSum(int a,int b,int c){
    			System.out.println("三个int参数");
    			return a+b+c;
    		}
    		* public static double getSum(double a,double b){
    			System.out.println("两个double参数");
    			return a+b;
    		}
    ```
* **注意事项**
  * a: 参数列表必须不同
  * b: 重载和参数变量名无关
  * c: 重载和返回值类型无关
  * d: 重载和修饰符无关
  * e: 技巧: 重载看方法名和参数列表


### 参数
1. 可变参数
   *  JDK1.5新的特性,方法的可变参数
   *  前提: 方法参数数据类型确定,参数的个数任意
   *  可变参数语法: 数据类型...变量名
   *  可变参数,本质就是一个数组
   ```
    public class VarArgumentsDemo {
         	public static void main(String[] args) {
         		//调用一个带有可变参数的方法,传递参数,可以任意
         	//	getSum();
         		int sum = getSum(5,34,3,56,7,8,0);
         		System.out.println(sum);

         	}

         	/*
         	 * 定义方法,计算10个整数和
         	 * 方法的可变参数实现
         	 */
         	public static int getSum(int...a){
         		int sum = 0 ;
         		for(int i : a){
         			sum = sum + i;
         		}
         		return sum;
         	}

         	/*
         	 * 定义方法,计算3个整数和
         	 */
         	/*public static int getSum(int a,int b ,int c){
         		return a+b+c;
         	}*/

         	/*
         	 * 定义方法,计算2个整数和
         	 */
         	/*public static int getSum(int a,int b){
         		return a+b;
         	}*/
         }
   ```
   * **注意事项：**
   * 一个方法只能有一个可变长参数，并且这个可变长参数必须是该方法的最后一个参数
     ```
       以下两种方法定义都是错误的。

        public void test(String... strings,ArrayList list){

        }

        public void test(String... strings,ArrayList... list){

        }
     ```
   * 避免对可变参数的方法的重载，以及使用没有指定数据类型的null
     ```
      package com;public class VarArgsTest1 {

          public void print(String test, Integer... is) {

          }

          public void print(String test,String...args ){

          }

          public static void main(String[] args) {
              VarArgsTest1 test = new VarArgsTest1();
              test.print("hello");//编译不通过
              test.print("hello", null);//编译不通过
          }
      }
     ```
     * 上面的demo两个例子都不通过的原因，编译器无法识别选择执行哪一个方法：
       1. 第一个是因为重载后，两个方法都符合要求
          * 解决：避免可变参数方法的重载

       2. 第二个是因为null也并没有指定类型，也都符合
          * 解决：
              ```
               public static void main(String[] args) {
                       VarArgsTest1 test = new VarArgsTest1();
                       String[] strs = null;
                       test.print("hello", strs);
                   }
              ```
