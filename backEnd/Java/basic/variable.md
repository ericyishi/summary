# 变量
### 变量使用的注意事项
* 1.不赋值不能使用【会报错，因为b没有赋值就是用了】
    ```
        public class Variable {
			public static void main(String[] args) {
				int a = 10;
				double b;
				a = 20;
				System.out.println(a);
				System.out.println(b);
			}
		}
    ```
 * 2. 有作用域限制。所在大括号内
    ```
              public static void main(String[] args) {
      			int x = 20;
      			{
      			    int y = 20;
      			}
      			System.out.println(x);//读取x变量中的值，再打印
      			System.out.println(y);//读取y变量中的值失败，失败原因，找不到y变量，因为超出了y变量作用范围，所以不能使用y变量
      			}
    ```
 * 3. 变量不可以重复定义
    ```
        double b;
        int b;
     ```
