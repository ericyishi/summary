# ArrayList集合
### 特点
* 底层采用的是数组结构
### 定义
```
  ArrayList<集合存储的数据类型> 变量名=new ArrayList<集合存储的数据类型 >();
```
* 首先要导入包 import java.util.ArrayList
```
 例如：
 ArrayList<String> array=new ArrayList<String>();
```
* 1.存储引用类型,不存储基本类型
* 2.八个基本类型，对应着8个引用类型。右边一栏是类名
![image](https://github.com/ericyishi/img-folder/blob/master/summary/backend/reference.png)
```
ArrayList<Integer> array2 = new ArrayList<Integer>();

//创建集合容器,存储手机类型
ArrayList<Phone> array3 = new ArrayList<Phone>();
```
* 3.不用指定长度，随便装【变长】

### ArrayList集合中常用方法
* add(obj) 存储数据。
  * **方法中的参数类型与定义时集合对象时的数据类型要一致**
  * add(2,7) 在原来索引为2的位置上，添加7。add是增加，而非替代，原来位上的元素，都向后移动一位
* get(index)取出集合中的元素，是按索引来取。
* size()  返回集合长度。【集合是size()方法，数组是length属性】
* set(索引，修改后的内容) 将指定的索引的元素，进行修改
* remove(int 索引) 删除指定索引上的元素
* clear() 清空集合中的所有元素【集合还在，只是元素内容清空。】




```
import java.util.ArrayList;
		public class ArrayListDemo_1{
			public static void main(String[] args){
				//定义集合,存储字符串元素
				ArrayList<String> array = new ArrayList<String>();
				//调用集合方法add存储元素
				array.add("abc");
				array.add("itcast");
			    array.add("love");
				array.add("java");
				//输出集合的长度,调用集合方法size, size方法的返回值类型 int
				int size = array.size();
				System.out.println(size);

				//获取出集合中的一个元素,获取1索引的元素
				//集合的方法get, 获取元素后结果数据类型
				String s = array.get(1);
				System.out.println(s);


				System.out.println(array.get(0));
				System.out.println(array.get(1));
				System.out.println(array.get(2));
				System.out.println(array.get(3));
			}
		}
```


