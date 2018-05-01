# 字节流与字符流
### 输入与输出
1. 参照物
   * 是参照JAVA程序的
2. Output
   * 写操作
   * 把内存中的数据存储到持久化设备上这个动作称为输出（写）Output操作
   * 程序到文件称为输出
3. Input
   * 读操作
   * 把持久设备上的数据读取到内存中的这个动作称为输入（读）Input操作
   * 文件到程序称为输入

### 流的分类
1. Java的字节流
  * **InputStream**是所有字节输入流的祖先，而**OutputStream**是所有字节输出流的祖先。
  * 字节流可以操作任何数据,因为在计算机中任何数据都是以字节的形式存储的
2. Java的字符流
  * **Reader**是所有读取字符串输入流的祖先，而**Writer**是所有输出字符串的祖先。
  * 字符流只能操作纯字符数据，比较方便。
* InputStream，OutputStream,Reader,writer都是抽象类。所以不能直接new
* 在客户端的一次请求中，getOutputStream和getWrite这两个方法是互斥的。只能一次使用一个

### 两者区别
1. 处理单位大小不同：
    * 字节流处理单元为 1 个字节，操作字节和字节数组。
       * 如果是音频文件、图片、歌曲，就用字节流好点
    * 字符流处理的单元为 2 个字节的 Unicode 字符，分别操作字符、字符数组或字符串
       * 所以字符流是由Java虚拟机将字节转化为2个字节的Unicode字符为单位的字符而成的，所以它对多国语言支持性比较好！
       * 如果是关系到中文（文本）的，用字符流好点
2. 操作文件方式：
   * 字节流在操作时本身不会用到缓冲区（内存），是文件本身直接操作的，
   * 字符流在操作时使用了缓冲区，通过缓冲区再操作文件。
3. 关闭操作
   * 字节流在操作文件时，即使不关闭资源（close方法），文件也能输出
   * 但是如果字符流不使用close方法的话，则不会输出任何内容，说明字符流用的是缓冲区，但是可以使用flush方法强制进行刷新缓冲区，这时才能在不close的情况下输出内容
### 使用时候注意事项
   * 使用前，导入IO包中的类
   * 使用时，进行IO异常处理
   * 使用后，释放资源

### 字节流
1. 字节输出流FileOutputStream
   * 构造方法：
     * 作用：绑定输出的输出目的
     * FileOutputStream(File file)
     	* 创建一个向指定 File 对象表示的文件中写入数据的文件输出流。
     * FileOutputStream(File file, boolean append)
     	* 创建一个向指定 File 对象表示的文件中写入数据的文件输出流，第二个参数为true，以追加的方式写入。
     * FileOutputStream(String name)
     	* 创建一个向具有指定名称的文件中写入数据的输出文件流。
     * FileOutputStream(String name, boolean append)
     	* 创建一个向具有指定 name 的文件中写入数据的输出文件流，第二个参数为true，以追加的方式写入。

   * 常用方法：
     *  void close(): 关闭此输出流并释放与此流有关的所有系统资源。
     *  void write(byte[] b)： 将 b.length 个字节从指定的 byte 数组写入此输出流
     *  void write(byte[] b, int off, int len) ：将指定 byte 数组中从偏移量 off 开始的 len 个字节写入此输出流。
     * abstract  void write(int b) ： 将指定的字节写入此输出流。
   * demo：字节输出流FileOutputStream写字节
     ```
       public class FileOutputStreamDemo {

       	/**
       	 * @param args
       	 * @throws FileNotFoundException
       	 */
       	public static void main(String[] args) throws IOException  {
       		// TODO Auto-generated method stub

       			FileOutputStream fos = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
       			//流对象的方法write写数据
       			//写1个字节
       			fos.write(97);//写入了一个a
       			//关闭资源
       			fos.close();

       	}

       }
     ```
      * 结果：向桌面demo.txt文件中写入了一个a
      * 注意在IO使用时候一定要抛出异常否则是报错无法执行的，throws IOException就行了
      * 用完了，别忘记关闭
      * 可以创建文件,如果文件存在,直接覆盖

   * demo：字节输出流FileOutputStream写数组
     ```
      public class FileOutputStreamDemo2 {
      	public static void main(String[] args)throws IOException {
      		FileOutputStream fos = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
      		//流对象的方法write写数据
      		//写字节数组
      		byte[] bytes = {65,66,67,68};
      		fos.write(bytes);//上面ASCII对应ABCD

      		//写字节数组的一部分,开始索引,写几个
      		fos.write(bytes, 1, 2);//只写入CD

      		//写入字节数组的简便方式
      		//写字符串
      		fos.write("hello".getBytes());//需要转成字节码

      		//关闭资源
      		fos.close();

      	}
      }
     ```
     * 结果：ABCDBChello 原来的a也不在了
     * 转字节的方法.getBytes()
   * demo:追加的方式
     ```
      public class FileOutputStreamDemo3 {
      					public static void main(String[] args)throws IOException {
                        			File file = new File("C:\\Users\\Administrator\\Desktop\\demo.txt");
                        			FileOutputStream fos = new FileOutputStream(file,true);
                        			fos.write("hello\r\n".getBytes());
                        			fos.write("world\r\n".getBytes());
                        			fos.close();
                        		}
      				}

     ```
     * 结果：
      ```
       ABCDBChello
       hello
       world
      ```
     * 使用\r\n表示换行
   * IO中使用异常处理
     ```
      public class FileOutputStreamDemo4 {
      				public static void main(String[] args) {
      					//try 外面声明变量,try 里面建立对象
      					FileOutputStream fos = null;
      					try{
      						fos = new FileOutputStream("s:\\a.txt");
      						fos.write(100);
      					}catch(IOException ex){
      						System.out.println(ex);
      						throw new RuntimeException("文件写入失败,重试");
      					}finally{
      						try{
      							if(fos!=null)
      							  fos.close();
      						}catch(IOException ex){
      							throw new RuntimeException("关闭资源失败");
      						}
      					}
      				}
      			}
     ```
     * 由于找不到s盘，所以会报错
     * 结果
       ```
        exception in thread "main" java.io.FileNotFoundException: s:\a.txt (系统找不到指定的路径。)
        java.lang.RuntimeException: 文件写入失败,重试
       ```
2. 字节输入流FileInputStream
   * 常用方法
      * abstract  int read() ：读取1个字节。从输入流中读取数据的下一个字节，返回-1表示文件结束
      * int read(byte[] b) ：读取一定量的字节,存储到数组中
      * int read(byte[] b, int off, int len) ：将输入流中最多 len 个数据字节读入 byte 数组。
      * void close() ：关闭此输入流并释放与该流关联的所有系统资源。
   * demo:FileInputStream读取字节
     ```
      public class FileInputStreamDemo {
      	public static void main(String[] args) throws IOException{
      		FileInputStream fis = new FileInputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
      		//读取一个字节,调用方法read 返回int
      		//使用循环方式,读取文件,  循环结束的条件  read()方法返回-1
      		int len = 0;//接受read方法的返回值

      		while( (i = fis.read()) != -1){
      			System.out.print((char)i);
      		}
      		//关闭资源
      		fis.close();
      	}
      }
     ```
     * 结果为：
       ```
        ABCDBChello
        hello
        world
       ```
     * 这里需要类型转换，否则结果为ASCII码
       ```
        656667686667104101108108111131010410110810811113101191111141081001310
       ```
   * demo:FileInputStream读取字节数组
     ```
      public class FileInputStreamDemo1 {
      	public static void main(String[] args) throws IOException {
      		FileInputStream fis = new FileInputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
      		// 创建字节数组
      		byte[] b = new byte[2];

      		int len = fis.read(b);
      		System.out.println(new String(b));// AB
      		System.out.println(len);// 2

      		len = fis.read(b);
      		System.out.println(new String(b));// CD
      		System.out.println(len);// 2

      		len = fis.read(b);
      		System.out.println(new String(b));// BC
      		System.out.println(len);// 1

      		len = fis.read(b);
      		System.out.println(new String(b));// he
      		System.out.println(len);// -1

      		fis.close();
      	}
     ```
     * 文件内容为
       ```
         ABCDBChello
         hello
         world
       ```
     * 读取方法  int read(byte[] b) 读取字节数组
     * 数组作用: 缓冲的作用, 提高效率
     * read返回的int,表示什么含义 读取到多少个有效的字节数

3. 应用
   * 字节流复制文件--读取单个字节就写入单个字节
     ```
      import java.io.FileInputStream;
      import java.io.FileOutputStream;
      import java.io.IOException;

      /*
       *  将数据源 c:\\a.txt
       *  复制到 d:\\a.txt  数据目的
       *  字节输入流,绑定数据源
       *  字节输出流,绑定数据目的
       *
       *  输入,读取1个字节
       *  输出,写1个字节
       */
      	public class Copy {
      		public static void main(String[] args) {
      			//定义两个流的对象变量
      			FileInputStream fis = null;
      			FileOutputStream fos = null;
      			try{
      				//建立两个流的对象,绑定数据源和数据目的
      				fis = new FileInputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
      				fos = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\new\\demo2.txt");
      				//字节输入流,读取1个字节,输出流写1个字节
      				int len = 0 ;
      				while((len = fis.read())!=-1){
      					fos.write(len);
      				}
      			}catch(IOException ex){
      				System.out.println(ex);
      				throw new RuntimeException("文件复制失败");
      			}finally{
      				try{
      					if(fos!=null)
      						fos.close();
      				}catch(IOException ex){
      					throw new RuntimeException("释放资源失败");
      				}finally{
      					try{
      						if(fis!=null)
      							fis.close();
      					}catch(IOException ex){
      						throw new RuntimeException("释放资源失败");
      					}
      				}
      			}
      		}
      	}
     ```
   * 字节流复制文件读取字节数组
     * 这种方式更高效
     ```
      import java.io.FileInputStream;
      import java.io.FileOutputStream;
      import java.io.IOException;


      public class Copy_1 {
      	public static void main(String[] args) {
      		long s = System.currentTimeMillis();
      		FileInputStream fis = null;
      		FileOutputStream fos = null;
      		try{
      			fis = new FileInputStream("C:\\Users\\Administrator\\Desktop\\demo.txt");
      			fos = new FileOutputStream("C:\\Users\\Administrator\\Desktop\\new\\demo3.txt");
      			//定义字节数组,缓冲
      			byte[] bytes = new byte[1024*10];
      			//读取数组,写入数组
      			int len = 0 ;
      			while((len = fis.read(bytes))!=-1){
      				fos.write(bytes, 0, len);
      			}
      		}catch(IOException ex){
      			System.out.println(ex);
      			throw new RuntimeException("文件复制失败");
      		}finally{
      			try{
      				if(fos!=null)
      					fos.close();
      			}catch(IOException ex){
      				throw new RuntimeException("释放资源失败");
      			}finally{
      				try{
      					if(fis!=null)
      						fis.close();
      				}catch(IOException ex){
      					throw new RuntimeException("释放资源失败");
      				}
      			}
      		}
      		long e = System.currentTimeMillis();
      		System.out.println(e-s);
      	}
      }
     ```
### 转码问题
* 文字--->(数字) ：编码。 “abc”.getBytes()  byte[]
* (数字)--->文字  : 解码。 byte[] b={97,98,99}  new String(b)

### 字符流
1. 字符输出流FileWriter 【写操作】
   * 常用方法
     * write(int c) 写1个字符
     * write(char[] c)写字符数组
     * write(char[] c,int,int)字符数组一部分,开始索引,写几个
     * write(String s) 写入字符串
     * 字符输出流写数据的时候,必须要运行一个功能,刷新功能
       *  flush()
   * demo写入数据
     ```
      import java.io.FileWriter;
      import java.io.IOException;


      public class FileWriteDemo {
      	public static void main(String[] args) throws IOException{
      		FileWriter fw = new FileWriter("C:\\Users\\Administrator\\Desktop\\demo.txt");

      		//写1个字符
      		fw.write(100);
      		//再写1个字符
      		fw.write(97);
      		fw.flush();

      		//写1个字符数组
      		char[] c = {'a','b','c','d','e'};
      		fw.write(c);
      		fw.flush();

      		//写字符数组一部分
      		fw.write(c, 2, 2);
      		fw.flush();

      		//写如字符串
      		fw.write("bye");
      		fw.flush();

      		fw.close();
      	}
      }
     ```
2. 字符输入流FileReader类【读操作】
   * 常用方法
      *  int read() 读取单个字符
      * int read(char[] cbuf) 将字符读入数组
      * abstract  int read(char[] cbuf, int off, int len)  将字符读入数组的某一部分。
   * demo 字符输入流读操作
     ```
      import java.io.FileReader;
      import java.io.IOException;

      public class FileReadDemo {
      	public static void main(String[] args) throws IOException {
      		FileReader fr = new FileReader("C:\\Users\\Administrator\\Desktop\\demo.txt");
      		char[] buf=new char[1024];
      		int len = 0;
      		while ((len = fr.read(buf)) != -1) {
      			System.out.print(new String(buf, 0, len));
      		}

      		fr.close();
      	}
      }
     ```

3. 使用字符流复制操作
   ```
    import java.io.FileReader;
    import java.io.FileWriter;
    import java.io.IOException;

    public class copy3 {
    				public static void main(String[] args) {
    					FileReader fr = null;
    					FileWriter fw = null;
    					try{
    						fr = new FileReader("c:\\1.txt");
    						fw = new FileWriter("d:\\1.txt");
    						char[] cbuf = new char[1024];
    						int len = 0 ;
    						while(( len = fr.read(cbuf))!=-1){
    							fw.write(cbuf, 0, len);
    							fw.flush();
    						}

    					}catch(IOException ex){
    						System.out.println(ex);
    						throw new RuntimeException("复制失败");
    					}finally{
    						try{
    							if(fw!=null)
    								fw.close();
    						}catch(IOException ex){
    							throw new RuntimeException("释放资源失败");
    						}finally{
    							try{
    								if(fr!=null)
    									fr.close();
    							}catch(IOException ex){
    								throw new RuntimeException("释放资源失败");
    							}
    						}
    					}
    				}
    			}
   ```


### flush方法和close方法区别
* a: flush()方法
	* 用来刷新缓冲区的,刷新后可以再次写出,只有字符流才需要刷新
* b: close()方法
	* 用来关闭流释放资源的的,如果是带缓冲区的流对象的close()方法,不但会关闭流,还会再关闭流之前刷新缓冲区,关闭后不能再写出