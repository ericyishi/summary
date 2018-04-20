# 集合ArrayList与迭代器Iterator
### 集合的定义
```
  数据类型<集合存储的数据类型> 变量名=new 数据类型<集合存储的数据类型 >();
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

### 集合与数组的相同与区别
1. 相同：
   * 都是一种容器，可以用来存储多个数据
2. 不同：
   * 数组的长度是固定的。集合的长度是可变的。
   * 集合中存储的元素必须是引用类型数据

### 集合继承关系
1. 集合继承关系
   * 查看ArrayList类发现它继承了抽象类AbstractList同时实现接口List，而List接口又继承了Collection接口。Collection接口为最顶层集合接口了。
     ```
      interface List extends Collection {
            }
            public class ArrayList extends AbstractList implements List{
            }
     ```
2. 集合继承体系
   *  这说明我们在使用ArrayList类时，该类已经把所有抽象方法进行了重写。那么，实现Collection接口的所有子类都会进行方法重写。
       * Collecton接口常用的子接口有：List接口、Set接口
       * List接口常用的子类有：ArrayList类、LinkedList类
       * Set接口常用的子类有：HashSet类、LinkedHashSet类
   ```
                                 Collection 接口
                                        |
          ----------------------------------------------------------------
          |                                                              |
         List接口                                                       Set接口
          |                                                              |
      ----------------                                             -------------
      |              |                                             |            |
     ArrayList类    LinkedList类                                 HashSet类     LinkedHashSet类
   ```

### Collection 常用的方法【使用ArrayList也可以直接调用这些方法】
* toArray() 集合转为数组
  ```
   //使用了多态，调用父类Collection的方法
   Collection<String> coll=new ArrayList<String>()
   coll.add("123");
   coll.add("456");
   coll.add("789");
   Object[] objs = coll.toArray();
        for(int i = 0 ; i < objs.length ; i++){
          System.out.println(objs[i]);
        }
  ```
* contains(Object o) 判断对象是否在集合中
  ```
    Collection<String> coll = new ArrayList<String>();
        coll.add("123");
        coll.add("456");
        coll.add("789");
        boolean b = coll.contains("456");
        System.out.println(b); //true
  ```

### 迭代器的使用
* 因为集合对应了，不同的数据类型【ArrayList是数组,LinkedList底层是链表】，迭代器就就提供了统一的接口，将不同类型的数据元素都能遍历出来。
* 迭代器提供的方法：
   *  .iterator() 实例一个迭代器对象
   *  boolean hasNext() 判断集合中还有没有可以被取出的元素,如果有返回true
   *  next() 取出集合中的下一个元素

* 迭代器的定义
    ```
     Iterator<数据类型> it =集合.iterator() //运行结果就是Iterator接口的实现类的对象
    ```
* 迭代器的使用
    ```
     	public static void main(String[] args) {
		          Collection<String> coll = new ArrayList<String>();
		          coll.add("abc1");
		          coll.add("abc2");
		          coll.add("abc3");
		          coll.add("abc4");
		          //迭代器,对集合ArrayList中的元素进行取出
		          //调用集合的方法iterator()获取出,Iterator接口的实现类的对象
		          Iterator<String> it = coll.iterator();
		          String s1 = it.next(); //这个条语句s1是abc1
		          //迭代是反复内容,使用循环实现,循环的条件,集合中没元素, hasNext()返回了false
		          while(it.hasNext()){
		            String s = it.next();
		            System.out.println(s);//"abc2","abc3","abc4"
		          }

		        }
    ```
* 使用for循环迭代写法
    ```
     for (Iterator<String> it2 = coll.iterator(); it2.hasNext();  ) {
         System.out.println(it2.next());
       }
    ```

### for循环升级版
* 可以遍历数组、集合等！
* jdk1.5以上才支持
* 格式
   ```
   //数组
     String[] str = {"321","123","ABC"};
     for(String s : str){
       System.out.println(s);
     }
   ```
   ```
   //集合
    public void function_2(){
          ArrayList<Person> array = new ArrayList<Person>();
          array.add(new Person("a",20));
          array.add(new Person("b",10));
          for(Person p : array){
            System.out.println(p);// System.out.println(p.toString());
          }
        }
   ```