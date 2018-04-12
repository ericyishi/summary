# 匿名内部类
### 匿名对象
* 概念
  * 匿名对象是指创建对象时，只有创建对象的语句，却没有把对象地址值赋值给某个变量。
       ```
         public class Person{
          public void eat(){
          	System.out.println("有个人在吃饭");
            }
         }

         创建一个普通对象
         Person p = new Person();
         创建一个匿名对象
         new Person();
       ```
* 匿名对象的特点
  a. 创建匿名对象直接使用，没有变量名
     ```
      new Person().eat()
      //eat方法被一个没有名字的Person对象调用了
     ```
  b. 匿名对象在没有指定其引用变量时，只能使用一次！
     ```
      new Person().eat(); 创建一个匿名对象，调用eat方法
      new Person().eat(); 想再次调用eat方法，重新创建了一个匿名对象【两个是完全不同的人】
     ```
  c. 匿名对象可以作为方法接收的参数、方法返回值使用
     ```
      class Demo {
      		public static Person getPerson(){//返回值是Person类型
      			//匿名对象作为方法返回值
      			return new Person();
      		}
      		public static void method(Person p){//作为方法接收的参数
      		}
      	}

      class Test {
      			public static void main(String[] args) {
      				//调用getPerson方法，得到一个Person对象
      				Person person1 = Demo.getPerson();
      				//调用method方法
      				Demo.method(person1);
      				//匿名对象作为方法接收的参数
      				Demo.method(new Person());
      			}
      		}
     ```

### 内部类
* 概念
  * 将类写在其他类的内部，可以写在其他类的成员位置和局部位置，这时写在其他类内部的类就称为内部类。
  * 我们定义内部类时，就是一个正常定义类的过程，同样包含各种修饰符、继承与实现关系等。
  * 在内部类中可以直接访问外部类的所有成员。
* 何时使用
  * 在描述事物时，若一个事物内部还包含其他可能包含的事物，比如在描述汽车时，汽车中还包含这发动机，这时发动机就可以使用内部类来描述。
     ```
      class 汽车 { //外部类
          	class 发动机 { //内部类
          	}
          }
     ```
* 内部类分类
   * 成员内部类
      1. 概念
          * 成员内部类，定义在外部类中的成员位置。与类中的成员变量相似，可通过外部类对象进行访问
      2. 定义格式
           ```
             class 外部类 {
             			修饰符 class 内部类 {
             				//其他代码
             			}
             		}
           ```
       3. 访问方式
           ```
             外部类名.内部类名 变量名 = new 外部类名().new 内部类名();
           ```
       4. demo
           ```
             class Body {//外部类，身体
             			 private boolean life= true; //生命状态
             			 public class Heart { //内部类，心脏
             				 public void jump() {
             					 System.out.println("心脏噗通噗通的跳")
             						System.out.println("生命状态" + life); //访问外部类成员变量
             				}
             			}
             		}

             		访问内部类
             		public static void main(String[] args) {
             			//创建内部类对象
             			Body.Heart bh = new Body().new Heart();
             			//调用内部类中的方法
             			bh.jump();
             		}
           ```

   * 局部内部类
        1. 概念
            * 局部内部类，定义在外部类方法中的局部位置。与访问方法中的局部变量相似，可通过调用方法进行访问。
        2. 定义格式
             ```
               class 外部类 {
               			修饰符 返回值类型 方法名(参数) {
               				class 内部类 {
               					//其他代码
               				}
               			}
               		}
             ```
        3. 访问方式
             * 在外部类方法中，创建内部类对象，进行访问
        4. demo
             ```
               //定义类
               		class Party {//外部类，聚会
               			public void puffBall(){// 吹气球方法
               				class Ball {// 内部类，气球
               					  public void puff(){
               						System.out.println("气球膨胀了");
               					  }
               				}
               				//创建内部类对象，调用puff方法
               				new Ball().puff();
               			}
               		}
               		访问内部类
               		public static void main(String[] args) {
               			//创建外部类对象
               			Party p = new Party();
               			//调用外部类中的puffBall方法
               			p.puffBall();
               		}
             ```
### 匿名内部类
* 概念
   * 内部类是为了应对更为复杂的类间关系。查看源代码中会涉及到，而在日常业务中很难遇到，这里不做赘述。
   * 最常用到的内部类就是匿名内部类，它是局部内部类的一种。
   * 定义的匿名内部类有两个含义：
      * 临时定义某一指定类型的子类
      * 定义后即刻创建刚刚定义的这个子类的对象
* 本质
   * 匿名内部类的本质是一个实现了接口或继承了某个类的子类匿名对象
* 格式
   ```
       new 接口或者父类(){
          重写抽象方法
       };
       从 new开始,到分号结束,创建了接口的实现类的对象
   ```
* demo
   ```
     public interface Smoking {
     		public abstract void smoking();
     		}

      //这部分是常规做法
      实现类,实现接口 重写接口抽象方法,创建实现类对象
      class XXX implements Smoking{
          public void smoking(){

          }
      }
      XXX x = new XXX();
      x.smoking();
      Smoking s = new XXX();
      s.smoking();



     	匿名内部类的写法:
     	public class Test {
     		public static void main(String[] args) {
     			//匿名内部类,简化问题: 定义实现类,重写方法,建立实现类对象,合为一步完成
     			//定义实现类,重写方法,创建实现类对象,一步搞定
     			new Smoking(){
     				public void smoking(){
     					System.out.println("人在吸烟");
     				}
     			}.smoking();
     		}
     	}
   ```

   ```
     //定义一个抽象类
     public abstract class Animal {
     			public abstract void eat();
     			public abstract void sleep();
     		}

      //定义一个匿名内部类
      public class Test2{

       public static void main(String[] args){
          new Animal(){
               				public void eat(){
               					System.out.println("在吃饭");
               				}
               				public void sleep(){
               					System.out.println("在睡觉");
               				}
            }.sleep()//或者.eat()。无法同时调用两个方法
       }
      }


      //解决test2出现的问题：
      //以上代码,就是Animal的子类的对象,根据多态性, 父类引用 等于 子类的对象所以我们可以改写成下面的写法
      //Test3 就能同时调用两个方法了。
      public class Test3{
             public static void main(String[] args){
               public static void main(String[] args) {
               			Animal a= new Animal(){
               				public void eat(){
               					System.out.println("在吃饭");
               				}
               				public void sleep(){
               					System.out.println("在睡觉");
               				}
               			 };
               			 a.eat();
               			 a.sleep();
               		}
          }
      }

   ```