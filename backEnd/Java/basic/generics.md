# 泛型
### 概念
* java 泛型是java SE 1.5的新特性，泛型的本质是参数化类型，也就是说所操作的数据类型被指定为一个参数。
* 这种参数类型可以用在类、接口和方法的创建中，分别称为泛型类、泛型接口、泛型方法。
### 泛型的好处
* 将运行时期的ClassCastException，转移到了编译时期变成了编译失败。
* 避免了类型强转的麻烦。
### 泛型的引入
* 我们都知道集合中是可以存放任意对象的。
* 只要把对象存储集合后，那么这时他们都会被提升成Object类型。
* 当我们在取出每一个对象，并且进行相应的操作，这时必须采用类型转换。
    ```
     public class GenericDemo {
          public static void main(String[] args) {
            List list = new ArrayList();
            list.add("abc");
            list.add("itcast");
            list.add(5);//由于集合没有做任何限定，任何类型都可以给其中存放
                        //相当于:Object obj=new Integer(5);

            Iterator it = list.iterator();
            while(it.hasNext()){
              //需要打印每个字符串的长度,就要把迭代出来的对象转成String类型
              String str = (String) it.next();//String str=(String)obj;
                                              //编译时期仅检查语法错误,String是Object的儿子可以向下转型
                                              //运行时期String str=(String)(new Integer(5))
                                              //String与Integer没有父子关系所以转换失败
                                              //程序在运行时发生了问题java.lang.ClassCastException
              System.out.println(str.length());
            }
          }
        }
    ```
* 泛型指明了集合中存储数据的类型  <数据类型>
    ```
     public class GenericDemo {
          public static void main(String[] args) {
            function();
          }

          public static void function(){
            Collection<String> coll = new ArrayList<String>();
            coll.add("abc");
            coll.add("rtyg");
            coll.add("43rt5yhju");
        //    coll.add(1); //无法加入1

            Iterator<String> it = coll.iterator();
            while(it.hasNext()){
              String s = it.next();
              System.out.println(s.length());
            }
          }
        }
    ```
    *  泛型只在编译时存在,编译后就被擦除,在编译之前我们就可以限制集合的类型起到作用
       ```
        例如:ArrayList<String> al=new ArrayList<String>();
        编译后:ArrayList al=new ArrayList();
       ```
### 泛型的通配符
* 对于不同的类型的集合，想要一个迭代器来循环，就要使用到泛型的通配符
  ```
  //定义一个迭代器，实现ArrayList、Hashset以及不同数据类型的迭代
   public class IteratorAll {
	    public static void main(String[] args) {
	    	ArrayList<String> array = new ArrayList<String>();

	          HashSet<Integer> set = new HashSet<Integer>();

	          array.add("123");
	          array.add("456");

	          set.add(789);
	          set.add(890);

	          iterator(array);
	          iterator(set);

	    }
	    public static void iterator(Collection<?> coll){
	          Iterator<?> it = coll.iterator();
	          while(it.hasNext()){
	            //it.next()获取的对象,什么类型
	            System.out.println(it.next());
	          }
	        }

   }
  ```
### demo
  ```
      /*
    *  将的酒店员工,厨师,服务员,经理,分别存储到3个集合中
    *  定义方法,可以同时遍历3集合,遍历三个集合的同时,可以调用工作方法
    */
   import java.util.ArrayList;
   import java.util.Iterator;
   public class GenericTest {
    public static void main(String[] args) {
      //创建3个集合对象
      ArrayList<ChuShi> cs = new ArrayList<ChuShi>();
      ArrayList<FuWuYuan> fwy = new ArrayList<FuWuYuan>();
      ArrayList<JingLi> jl = new ArrayList<JingLi>();

      //每个集合存储自己的元素
      cs.add(new ChuShi("张三", "后厨001"));
      cs.add(new ChuShi("李四", "后厨002"));

      fwy.add(new FuWuYuan("翠花", "服务部001"));
      fwy.add(new FuWuYuan("酸菜", "服务部002"));

      jl.add(new JingLi("小名", "董事会001", 123456789.32));
      jl.add(new JingLi("小强", "董事会002", 123456789.33));

   //   ArrayList<String> arrayString = new ArrayList<String>();
      iterator(jl);
      iterator(fwy);
      iterator(cs);

    }
    /*
     * 定义方法,可以同时遍历3集合,遍历三个集合的同时,可以调用工作方法 work
     * ? 通配符,迭代器it.next()方法取出来的是Object类型,怎么调用work方法
     * 强制转换:  it.next()=Object o ==> Employee
     * 方法参数: 控制,可以传递Employee对象,也可以传递Employee的子类的对象
     * 泛型的限定  本案例,父类固定Employee,但是子类可以无限?
     *   ? extends Employee 限制的是父类, 上限限定, 可以传递Employee,传递他的子类对象
     *   ? super   Employee 限制的是子类, 下限限定, 可以传递Employee,传递他的父类对象
     */
    public static void iterator(ArrayList<? extends Employee> array){

       Iterator<? extends Employee> it = array.iterator();
       while(it.hasNext()){
         //获取出的next() 数据类型,是什么Employee
         Employee e = it.next();
         e.work();
       }
    }
   }
  ```