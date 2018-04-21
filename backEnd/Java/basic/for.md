# for循环
### for循环高级用法
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