# Collection接口与迭代器Iterator
* 所有集合类的根类型

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




### Collection 提供的方法
* 使用ArrayList也可以直接调用这些方法，因为其是Collection具体实现类
1. toArray() 集合转为数组
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

2. contains(Object o) 判断对象是否在集合中
  ```
    Collection<String> coll = new ArrayList<String>();
        coll.add("123");
        coll.add("456");
        coll.add("789");
        boolean b = coll.contains("456");
        System.out.println(b); //true
  ```

3. **.iterator() 迭代器**


### 迭代器iterator的使用
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