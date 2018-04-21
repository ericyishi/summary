# HashSet哈希表

### 特点
   * 是无序的【创建顺序与输出顺序不一致】
   * 没有索引
   * 不存储重复元素【输出重复的是会自动去除】
   * 底层数据结构,哈希表
   * 存储,取出都比较快
   * 线程不安全


### 存储与遍历
   * 在写法上与ArrayList一致
   ```
     public static void test_hashSet(){
     	 Set<String> set = new HashSet<String>();
          set.add("1");
          set.add("1");// 不会报错，但是输出时候是没有重复的
          set.add("2");
          set.add("3");
          set.add("4");
          set.add("5");

          //使用迭代器遍历
          Iterator<String> it = set.iterator();
          while(it.hasNext()){
            System.out.println(it.next());
          }
          System.out.println("==============");
          //使用for循环遍历
          for(String s : set){
            System.out.println(s);
          }
      }

   ```

### 哈希表的存储过程【通过字符串的哈希值引出】
   * 相同字符串的哈希值一定相同
   * 相同的哈希值不一定是相同的字符串
        ```
          public static void test_hashash(){
         	 String s1 = new String("abc");
              String s2 = new String("abc");
              String s3 = new String("Aa");
              String s4 = new String("BB");
              System.out.println(s1.hashCode());//96354
              System.out.println(s2.hashCode());//96354
              System.out.println(s3.hashCode());//2112
              System.out.println(s4.hashCode());//2112
          }
        ```
   * 再强调一点，两个String的hashCode相同并不代表着equals比较时会相等，他们两者之间是没有必然关系
   * 所以使用哈希表添加“Aa”“BB”是不会发生剔除的,因为还要equals()比较。
       ```
         public static void test_testhash(){
         	 Set<String> set = new HashSet<String>();
         	 set.add("abc");
         	 set.add("abc");
         	 set.add("Aa");
         	 set.add("Bb");
         	 System.out.println(set);//[abc, Aa, Bb]
          }
       ```
   * **哈希表存储过程**：
     * 每存入一个新的元素都要走以下三步:
       1. 首先调用本类的hashCode()方法算出哈希值

       2. 在容器中找是否与新元素哈希值相同的老元素,如果没有直接存入
         如果有转到第三步：

       3. 新元素会与该索引位置下的老元素利用equals方法一一对比
         一旦新元素.equals(老元素)返回true,停止对比,说明重复,不再存入
         如果与该索引位置下的老元素都通过equals方法对比返回false,说明没有重复,存入
   * 结论：
     * 如果两个对象的哈希值相同，两个对象的equals不一定返回true
     * 如果两个对象的equals方法返回true，两个对象的哈希值一定相同