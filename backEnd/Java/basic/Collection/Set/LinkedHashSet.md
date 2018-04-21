# LinkedHashSet集合
### 特点
* 继承自HashSet基于链表的哈希表实现
* 具有顺序,存储和取出的顺序相同的
* 线程不安全的集合,运行速度块

### demo
  ```
  	public static void test_linkedhashSet(){
  		LinkedHashSet<Integer> link = new LinkedHashSet<Integer>();
          link.add(123);
          link.add(44);
          link.add(33);
          link.add(33);
          link.add(66);
          link.add(11);
          System.out.println(link); //[123, 44, 33, 66, 11]
  	}

  ```