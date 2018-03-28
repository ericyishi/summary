# 数组
### 数组定义
* 格式：
```
    数据类型[] 变量名=new 数据类型[存储元素的个数];
    int[] arr=new int[4];
```
* **注意：数组个数初始化就决定了，是定长的，不能改变。**
或者
```
   数据类型[] 变量名=new 数据类型[]{元素1，元素2，元素3};
   int[] arr=new int[] {1,2,3,4};
   或者：
   int[] arr={1,2,3,4}
```
* **注意：第二种方法不能在中括号中写内容**
* 数组的最小索引是0, 最大索引数组.length-1
### 数组的内存分配
* int[] x;	            	// 声明一个int[]类型的变量
*	x = new int[100];		// 创建一个长度为100的数组
    * 第一行代码 int[] x; 声明了一个变量x，该变量的类型为int[]，即一个int类型的数组。变量x会占用一块内存单元，它没有被分配初始值
    * 第二行代码 x = new int[100]; 创建了一个数组，将数组的地址赋值给变量x。在程序运行期间可以使用变量x来引用数组，这时内存中的状态会发生变化

### 数组中常见的异常
* 1.下标越界
* 2.空指针
```
public class ArrayDemo_4{
			public static void main(String[] args){
				//数组的索引越界异常
				//int[] arr = {5,2,1};
				//数组中3个元素,索引 0,1,2
				//System.out.println(arr[3]);//java.lang.ArrayIndexOutOfBoundsException: 3

				//空指针异常
				int[] arr2 = {1,5,8};
				System.out.println(arr2[2]);
				arr2 = null; // arr2 不在保存数组的地址了
				System.out.println(arr2[2]);//java.lang.NullPointerException
			}
		}
```

### 二维数组
* 1.定义
  * 定义格式
   	* a 第一种定义格式:
   		*  int[][] arr = new int[3][4];
   		*  上面的代码相当于定义了一个3*4的二维数组，即二维数组的长度为3，二维数组中的每个元素又是一个长度为4的数组
   	* b 第二种定义格式【不推荐】
   		*  int[][] arr = new int[3][];
   		*  第二种方式和第一种类似，只是数组中每个元素的长度不确定
   	* c 第三种定义格式
   		*  	int[][] arr = {{1,2},{3,4,5,6},{7,8,9}};
   		*  	二维数组中定义了三个元素，这三个元素都是数组，分别为{1,2}、{3,4,5,6}、{7,8,9}
* 2.访问
 ```
   class ArrayDemo08 {
   		public static void main(String[] args){

   			//定义二维数组的方式
   			int[][] arr = new int[3][4];
   			System.out.println( arr );
   			System.out.println("二维数组的长度: " + arr.length);//3
   			//获取二维数组的3个元素
   			System.out.println( arr[0] );//打印出来的是地址
   			System.out.println( arr[1] );//打印出来的是地址
   			System.out.println( arr[2] );//打印出来的是地址

   			System.out.println("打印第一个一维数组的元素值");
   			System.out.println( arr[0][0] );
   			System.out.println( arr[0][1] );//访问的为二维数组中第1个一维数组的第2个元素0，所有值都为0，因为没有还没有赋初值
   			System.out.println( arr[0][2] );
   			System.out.println( arr[0][3] );

   			System.out.println("打印第二个一维数组的元素值");
   			System.out.println( arr[1][0] );
   			System.out.println( arr[1][1] );
   			System.out.println( arr[1][2] );
   			System.out.println( arr[1][3] );

   			System.out.println("打印第三个一维数组的元素值");
   			System.out.println( arr[2][0] );
   			System.out.println( arr[2][1] );
   			System.out.println( arr[2][2] );
   			System.out.println( arr[2][3] );
   		}
   	}
 ```

* 3.二维数组的内存分配
  * 举例:int[][] arr = new int[3][2];
	 * 外层数组长在内存开辟连续的3个大的内存空间,每一个内存空间都对应的有地址值
	 * 每一个大内存空间里又开辟连续的两个小的内存空间.

* 4.遍历
    * A:二维数组遍历
  		 int[][] arr = {{1,2,4},{4,7},{0,9,3}};
    		 先使用for循环遍历arr这个二维数组,得到每一个元素为arr[i]为一维数组
  		 再外层for循环中嵌套一个for循环遍历每一个一维数组arr[i],得到每一元素

  	* B:举例:遍历二维数组
  	```
  		public class ArrayArrayDemo_2{
  			public static void main(String[] args){
  				int[][] arr = { {1,2,3},{4,5},{6,7,8,9},{0} };

  				//外循环,遍历二维数组
  				for(int i = 0 ; i < arr.length ;i++){
  					//内循环,遍历每个一维数组 arr[0] arr[1] arr[i]
  					for(int j = 0 ; j < arr[i].length; j++){
  						System.out.print(arr[i][j]);
  					}
  					System.out.println();
  				}
  			}
    ```
  	* C:二维数组累加求和
  	```
  	   class ArrayDemo09 {
  			public static void main(String[] args){
  			  	int[][] arr2 = { {1,2},{3,4,5},{6,7,8,9,10} };
  				int sum2 = 0;
  				for (int i=0; i<arr2.length; i++) {
  					for (int j=0; j<arr2[i].length; j++) {
  		                 //System.out.println(arr2[i][j])
  						sum2 += arr2[i][j];
  					}
  				}
  				System.out.println("sum2= "+ sum2);
  			}
  		}
  	```