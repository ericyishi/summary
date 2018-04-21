# List接口
### List接口的特点
  * 它是一个元素存取有序的集合。
        例如，存元素的顺序是11、22、33。那么集合中，元素的存储就是按照11、22、33的顺序完成的）。
  * 它是一个带有索引的集合，通过索引就可以精确的操作集合中的元素（与数组的索引是一个道理）。
  * 集合中可以有重复的元素，通过元素的equals方法，来比较是否为重复的元素。

### 常用子类
  * ArrayList集合
  * LinkedList集合

### List接口的特有方法
   * 增加元素方法
     1. add(Object e)：向集合末尾处，添加指定的元素
     2. add(int index, Object e)   向集合指定索引处，添加指定的元素，原有元素依次后移
     ```
       /*
        *  add(int index, E)
        *  将元素插入到列表的指定索引上
        *  带有索引的操作,防止越界问题
        *  java.lang.IndexOutOfBoundsException
        *     ArrayIndexOutOfBoundsException
        *     StringIndexOutOfBoundsException
        */
        public static void function(){
          List<String> list = new ArrayList<String>();
          list.add("1");
          list.add("2");
          list.add("3");
          list.add("4");
          System.out.println(list);

          list.add(1, "HELLO");
          System.out.println(list); // [1, HELLO, 2, 3, 4]
        }
     ```


   * 删除元素删除
     1. remove(Object e)：将指定元素对象，从集合中删除，返回值为被删除的元素
     2. remove(int index)：将指定索引处的元素，从集合中删除，返回值为被删除的元素
     ```
      /*
       *  E remove(int index)
       *  移除指定索引上的元素
       *  返回被删除之前的元素
       */
       public static void function_1(){
         List<Double> list = new ArrayList<Double>();
         list.add(1.1);
         list.add(1.2);
         list.add(1.3);
         list.add(1.4);

         Double d = list.remove(0);
         System.out.println(d); //[1.1]
         list.remove(1.4);
         System.out.println(list); //[1.2, 1.3]
       }
     ```

   * 替换元素方法
     1. set(int index, Object e)：将指定索引处的元素，替换成指定的元素，返回值为**替换前**的元素
        /*
         *  E set(int index, E)
         *  修改指定索引上的元素
         *  返回被修改之前的元素
         */
        public static void function_2(){
          List<Integer> list = new ArrayList<Integer>();
          list.add(1);
          list.add(2);
          list.add(3);
          list.add(4);

          Integer i = list.set(0, 5);
          System.out.println(i); //1
          System.out.println(list); //[5,2,3,4]
        }
   * 查询元素方法
     1. get(int index)：获取指定索引处的元素，并返回该元素



