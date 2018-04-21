# Map集合
### 特点
* 与collection存储独立元素不同，Map存储的是键值对。
* 键是不能重复的

### 常用子元素
* HashMap
* LinkedHashMap

### 常用方法
* put(Key,Value) 将键值对存储到集合中
  * 如果存储的是重复的键,将原有的值,覆盖，返回被覆盖之前的值
  * 返回值一般情况下返回null
  * 
* get(Key) 通过键对象,获取值对象
  * 如果集合中没有这个键,返回null
* remove(Key)
  * 移除集合中的键值对,返回被移除之前的值
* keyset() 遍历集合，得到所有键，以set集合返回
```
  public static void hashMap_1(){
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("lisa",23);
		map.put("lucy",25);
		map.put("daniel",28);
		System.out.println(map.put("daniel",30)); //返回是之间的值28
		map.put("rick",30);
		System.out.println(map.get("zhang")); //null
  		System.out.println(map.remove("lisa"));//删除，也返回对应的值23
		System.out.println(map); //{daniel=30, rick=30, lucy=25}
		Set<String> a=map.keySet(); //获取key值的集合
		for(String k : a){
			System.out.println("key:"+k+",value:"+map.get(k));
		}
	}
```    
### Map集合Entry对象
* Entry是Map接口中提供的一个静态内部嵌套接口。
*即键值对对象，这样我们在遍历Map集合时，就可以从每一个键值对（Entry）对象中获取对应的键与对应的值。

#### 相关方法
 * entrySet()方法：用于返回Map集合中所有的键值对(Entry)对象，以Set集合形式返回。
 * getKey()方法：获取Entry对象中的键
 * getValue()方法：获取Entry对象中的值
 ```
  	public static void testEntrySet(){
		HashMap<String,Integer> m=new HashMap<String,Integer>();
		m.put("lisa",21);
		m.put("lucy",10);
		m.put("daniel",24);
		Set<Map.Entry <String,Integer> >  myset = m.entrySet();
		Iterator<Map.Entry <String,Integer>> it=myset.iterator();
		while(it.hasNext()){
			Map.Entry< String,Integer> entry = it.next();//Map.Entry对象,就能使用Entry的方法了
			String key = entry.getKey();
			Integer value = entry.getValue();
			System.out.println(key+"...."+value);
		}
	}
 ```
  * **注意：**Map集合不能直接使用迭代器或者foreach进行遍历。但是转成Set之后就可以使用了
 
### HashMap
* 是一个最常用的Map,它根据键的HashCode值存储数据,
* 根据键可以直接获取它的值，具有很快的访问速度。
* HashMap最多只允许一条记录的键为Null;
* 允许多条记录的值为 Null;
* HashMap不支持线程的同步，即任一时刻可以有多个线程同时写HashMap;可能会导致数据的不一致。如果需要同步，可以用 Collections的synchronizedMap方法使HashMap具有同步的能力。
  
### LinkedHashMap
* LinkedHashMap继承HashMap
* 迭代的有顺序

