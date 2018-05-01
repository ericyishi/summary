# 文件类的操作
### File类的概述和作用
* File类是文件和目录路径名的抽象表示形式
* Java中把文件或者目录（文件夹）都封装成File对象
* 我们要去操作硬盘上的文件，或者文件夹只要找到File这个类即可
### File类常用的方法
* boolean createNewFile(): 创建文件 如果存在这样的文件，就不创建了
* boolean mkdir():创建文件夹 如果存在这样的文件夹，就不创建了
* boolean mkdirs():创建文件夹,如果父文件夹不存在，会帮你创建出来
* boolean delete():删除文件或者文件夹
* String getName(): 获取文件或者文件夹名
* long length(): 返回路径中表示的文件的字节数
* String getAbsolutePath(): 获取绝对路径,返回String对象
* File  getAbsoluteFile() : 获取绝对路径,返回File对象
	* eclipse环境中,写一个相对路径,返回的是绝对位置，在工程根目录下
	```
     public static void function_2(){
     	File file = new File("src");
     	// 写的是一个相对路径,获得是绝对位置,工程目录下
     	// D:\yis_java_workspace\File\src
     	File absolute = file.getAbsoluteFile();
     	System.out.println(absolute);
     	}
	```
* String getParent(): 获取父路径,返回String对象
* File getParentFile(): 获取父路径,返回File对象

### 递归遍历全目录
    ```
     /*
      *  定义方法,实现目录的全遍历
      */
     	public static void getAllDir(File dir){
     		System.out.println(dir);
     		//调用方法listFiles()对目录,dir进行遍历
     		File[] fileArr = dir.listFiles();
     		for(File f : fileArr){
     			//判断变量f表示的路径是不是文件夹
     			if(f.isDirectory()){
     				//是一个目录,就要去遍历这个目录
     				//本方法,getAllDir,就是给个目录去遍历
     				//继续调用getAllDir,传递他目录
     				getAllDir(f);
     			}else{
     				System.out.println(f);
     			}
     		}
     	}

     //测试
      getAllDir(new File("D:\\yis_crawler"));
    ```

### 文件过滤器
  * 过滤一个目录下的指定扩展名的文件，或者包含某些关键字的文件夹
  * 方法介绍
     * public String[] list(FilenameFilter filter)
       * 获取到File构造方法中封装的路径中的文件和文件夹名 (遍历一个目录)
       * **返回只有名字**
     * public File[] listFiles(FileFilter filter)
       * 获取到,File构造方法中封装的路径中的文件和文件夹名 (遍历一个目录)
       * **返回的是目录或者文件的全路径**
  * 需要自定义过滤器类
   ```
    public class MyFilter implements FileFilter{
    	public boolean accept(File pathname)  {
    		/*
    		 * pathname 接受到的也是文件的全路径
    		 * c:\\demo\\1.txt
    		 * 对路径进行判断,如果是java文件,返回true,不是java文件,返回false
    		 * 文件的后缀结尾是.java
    		 */
    		//String name = pathname.getName();
    		return pathname.getName().endsWith(".java"
    	}
    }
   ```
   * 过滤出以.java结尾的文件
   ```
    	/*
    	 *  File类的获取,文件获取过滤器
    	 *  遍历目录的时候,可以根据需要,只获取满足条件的文件
    	 *  遍历目录方法 listFiles()重载形式
    	 *  listFiles(FileFilter filter)接口类型
    	 *  传递FileFilter接口的实现类
    	 *  自定义FileFilter接口实现类,重写抽象方法,
    	 *  接口实现类对象传递到遍历方法listFiles
    	 */
    	public class FileDemo1 {
    		public static void main(String[] args) {
    			File file = new File("c:\\demo");
    			File[] fileArr = file.listFiles(new MyFilter());
    			for(File f : fileArr){
    				System.out.println(f);
    			}
    		}
    	}
   ```
   * 过滤器原理
     * listFiles()遍历目录的同时，获取到了文件名全路径，调用过滤器的方法accept，将获取到的路径传递给accept方法的参数pathname
     * accept方法接收了参数pathname，参数是listFiles传递来的
     * 在accept方法中，进行判断，如果这个路径是Java文件，返回true，走着返回false
     * 一旦方法返回了true
     * listFiles将路径保存到File数组中

   * 遍历出某文件夹下所有的py文件
     ```
      MyFilter.java
      import java.io.File;
      import java.io.FileFilter;


      	/*
      	 *  自定义python过滤器
      	 *  实现FileFilter接口,重写抽象方法
      	 */
      		public class MyFilter implements FileFilter{
      			public boolean accept(File pathname)  {
      				/*
      				 * pathname 接受到的也是文件的全路径

      				 * 对路径进行判断,如果是py文件,返回true,不是py文件,返回false
      				 * 文件的后缀结尾是.py
      				 */

      				// 核心！如果是文件夹那么就直接返回true
      				if(pathname.isDirectory()){
      					return true;
      				}
      				boolean result = pathname.getName().endsWith(".py");
      				return result;

      			}
      		}

     ```
     ```
      //测试

      public static void main(String[] args) {
      	getAllDir(new File("D:\\yis_crawler"));
      }

      public static void getAllDir(File dir){
      			//调用方法listFiles()对目录,dir进行遍历
      			File[] fileArr = dir.listFiles(new MyFilter());
      			for(File f : fileArr){
      				//判断变量f表示的路径是不是文件夹
      				if(f.isDirectory()){
      					//是一个目录,就要去遍历这个目录
      					//本方法,getAllDir,就是给个目录去遍历
      					//继续调用getAllDir,传递他目录
      					getAllDir(f);
      				}else{
      						  System.out.println(f);
      				}
      			}
      		}
     ```

