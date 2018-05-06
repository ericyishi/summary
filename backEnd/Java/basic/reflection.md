# 反射
* 我们的程序在运行时，需要动态的加载一些类这些类可能之前用不到所以不用加载到jvm，而是在运行时根据需要才加载的操作
* 常见例子：项目底层有时是用mysql，有时用oracle，需要动态地根据实际情况加载驱动类，这个时候反射就有用了，假设 com.java.dbtest.myqlConnection，com.java.dbtest.oracleConnection这两个类我们要用，这时候我们的程序就写得比较动态化，通过Class tc = Class.forName("com.java.dbtest.TestConnection");通过类的全类名让jvm在服务器中找到并加载这个类，而如果是oracle则传入的参数就变成另一个了。

# 反射技术
  * 条件：运行状态
  * 已知：一个类或一个对象(根本是已知.class文件)
  * 结果：得到这个类或对象的所有方法和属性

# 加载方式
  * 通过Class类中的方法（将类名作为字符串传递给Class类中的静态方法forName即可）
    ```
     Class c3 = Class.forName("Student");
    ```
# 应用
  * 通过配置文件来决定运行的步骤
    * 通过配置文件得到类名和要运行的方法名,用反射的操作类名得到对象和调用方法
    * 实现步骤:
	  * 准备配置文件,键值对
	  * IO流读取配置文件  Reader
	  * 文件中的键值对存储到集合中 Properties
	  * 集合保存的键值对,就是类名和方法名
	  * 反射获取指定类的class文件对象
	  * class文件对象,获取指定的方法
	  * 运行方法
	* code
	    ```
	     import java.io.FileReader;
			import java.lang.reflect.Method;
			import java.util.Properties;

			/*
			 *  调用Person方法,调用Student方法,调用Worker方法
			 *  类不清楚,方法也不清楚
			 *  通过配置文件实现此功能
			 *    运行的类名和方法名字,以键值对的形式,写在文本中
			 *    运行哪个类,读取配置文件即可
			 */
			public class Test {
				public static void main(String[] args) throws Exception{
					//IO流读取配置文件
					FileReader r = new FileReader("config.properties");
					//创建集合对象
					Properties pro = new Properties();
					//调用集合方法load,传递流对象
					pro.load(r);
					r.close();
					//通过键获取值
					String className = pro.getProperty("className");
					String methodName = pro.getProperty("methodName");
					//反射获取指定类的class文件对象
					Class c = Class.forName(className);
					Object obj = c.newInstance();
					//获取指定的方法名
					Method method = c.getMethod(methodName);
					method.invoke(obj);
				}
			}

	    ```
	    ```
         配置文件：
			#className=cn.itcast.demo3.Student
			#methodName=study
			className=cn.itcast.demo3.Person
			methodName=eat
			#className=cn.itcast.demo3.Worker
			#methodName=job

	    ```
