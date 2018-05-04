# Properties类
### 特点
* 一个Map集合，存储的是属性，键值必须都是字符串类型的，所以这个集合类没有使用泛型
* Hashtable的子类，map集合中的方法都可以用。
* 它是一个可以持久化的属性集。键值可以存储到集合中，也可以存储到持久化的设备(硬盘、U盘、光盘)上。键值的来源也可以是持久化的设备。
* 它是唯一一个能与IO流交互的集合

### 常用方法

* setProperty(String key, String value)
  * setProperty等同与Map接口中的put
* getProperty(String key) 通过键获取值
* stringPropertyNames() 返回此属性列表中的键集
* demo
  ```
   	import java.io.IOException;
    import java.util.Properties;
    import java.util.Set;

    public class TestProperties {
    	public static void main(String[] args)throws IOException {
    		function();
    	}
    	/*
    	 * 使用Properties集合,存储键值对
    	 * setProperty等同与Map接口中的put
    	 * setProperty(String key, String value)
    	 * 通过键获取值, getProperty(String key)
    	 */
    	public static void function(){
    		Properties pro = new Properties();
    		pro.setProperty("a", "1");
    		pro.setProperty("b", "2");
    		pro.setProperty("c", "3");
    		System.out.println(pro);

    		String value = pro.getProperty("c");
    		System.out.println(value);

    		//方法stringPropertyNames,将集合中的键存储到Set集合,类似于Map接口的方法keySet
    		Set<String> set = pro.stringPropertyNames();
    		for(String key : set){
    			System.out.println(key+"..."+pro.getProperty(key));
    		}
    	}
    }

  ```