# LinkedList集合
### 特点
* 底层采用链表结构
* 每次查询都要从链头或链尾找起,查询相对数组较慢
* 但是删除直接修改元素记录的地址值即可,不要大量移动元素
*  LinkedList的索引决定是从链头开始找还是从链尾开始找
   * 如果该元素小于元素长度一半,从链头开始找起,如果大于元素长度的一半,则从链尾找起

### LinkedList特有方法
1. 添加
* 除了使用add(E)、add(index,E)这些方法外还有特有的方法
  * addFirst(E) 添加到链表的开头
  * addLast(E) 添加到链表的结尾
  ```
   public static void linkedList_add() {
   	LinkedList<String> link = new LinkedList<String>();
   	link.addLast("123");
   	link.add("abc");
   	link.add("bcd");
   	link.addFirst("456");
   	System.out.println(link); //[456, 123, abc, bcd]
   	}
  ```
2. 删除
* 除了remove()等方法，还有特有的方法：
   * removeFirst() 移除并返回链表的开头
   * removeLast() 移除并返回链表的结尾
3. 获取值
* 除了get()等方法，还有特有的方法：
   * getFirst() 获取链表的开头
   * getLast() 获取链表的结尾