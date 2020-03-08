# JSON模块
### JSON是什么
* JSON是“JavaScript Object Notation”的缩写，它本来是JavaScript语言中创建对象的一种字面量语法
* 因为JSON也是纯文本，目前JSON基本上已经取代了XML作为异构系统间交换数据的事实标准

### JSON对象数据类型与python数据类型的关系
| JSON                                   | Python       |
| -------------------------------------- | ------------ |
| object                                 | dict         |
| array                                  | list         |
| string                                 | str          |
| number (int / real)                    | int / float  |
| true / false                           | True / False |
| null                                   | None         |



| Python                                 | JSON         |
| -------------------------------------- | ------------ |
| dict                                   | object       |
| list, tuple                            | array        |
| str                                    | string       |
| int, float, int- & float-derived Enums | number       |
| True / False                           | true / false |
| None                                   | null         |
### 四个常用的方法
* dump - 将Python对象按照JSON格式序列化到文件中
* dumps -将Python对象处理成JSON格式的字符串
* load - 将文件中的JSON数据反序列化成对象
* loads - 将字符串的内容反序列化成Python对象

* 备注：
  * 序列化是把对象转换成有序字节流，以便在网络上传输或者保存在本地文件中。反序列化则是一个反向过程，从有序字节流重建对象，恢复对象状态。
  * 序列化机制的核心作用就是对象状态的保存与重建

1. json.dumps() 用于将dict类型的数据转成str
   * 如果直接将dict类型的数据写入json文件中会发生报错，因此在将数据写入时需要用到该函数。
   ```
    import json  
    name_emb = {'a':'1111','b':'2222','c':'3333','d':'4444'}   
      
    jsObj = json.dumps(name_emb)      
     # 虽然看着一样，但是类型不同 
    print(name_emb)  # {'a': '1111', 'c': '3333', 'b': '2222', 'd': '4444'} 
    print(jsObj)  # {'a': '1111', 'c': '3333', 'b': '2222', 'd': '4444'} 
      
    print(type(name_emb))  #<type 'dict'>
    print(type(jsObj))  # <class 'str'>
   ```
   * 若在数据写入json文件时，未先进行转换，报错如下
   ```
    #-*- coding: utf-8 -*-
    import json
    
    name_emb = {'a': '1111', 'b': '2222', 'c': '3333', 'd': '4444'}
    
    emb_filename = ('./emb_json.json')
    
    # jsObj = json.dumps(name_emb) #如果不进行这步格式转换，下面写入文件的时候是会报错的
    
    with open(emb_filename, "w") as f:
        f.write(name_emb) # TypeError: write() argument must be str, not dict
        # f.write(jsObj) #传入转换后的格式
        f.close()   
   ```
2. json.loads() 用于将str类型的数据转成dict
   ```
    import json  
   
    name_emb = {'a':'1111','b':'2222','c':'3333','d':'4444'}   
      
    jsDumps = json.dumps(name_emb)      
      
    jsLoads = json.loads(jsDumps)   
      
    print(name_emb)  # {'a': '1111', 'c': '3333', 'b': '2222', 'd': '4444'} 
    print(jsDumps)  # {"a": "1111", "c": "3333", "b": "2222", "d": "4444"}  
    print(jsLoads)  # {'a': '1111', 'c': '3333', 'b': '2222', 'd': '4444'}  
      
    print(type(name_emb))  # <type 'dict'> 
    print(type(jsDumps))  # <type 'str'>  
    print(type(jsLoads))  #<type 'dict'> 
      
3. json.dump()用于将dict类型的数据转成str，并写入到json文件中。
   * dump()后面有两个参数
   * 两种方式(dumps\dump)都可以写入
   ```
    import json    
    
    name_emb = {'a':'1111','b':'2222','c':'3333','d':'4444'}    
                
    emb_filename = ('/home/cqh/faceData/emb_json.json')    
      
    # solution 1  
    jsObj = json.dumps(name_emb)      
    with open(emb_filename, "w") as f:    
        f.write(jsObj)    
        f.close()    
          
    # solution 2     
    json.dump(name_emb, open(emb_filename, "w"))
   ```
4. json.load() 用于从json文件中读取数据
   ```
    import json    
  
    emb_filename = ('/home/cqh/faceData/emb_json.json')    
      
    jsObj = json.load(open(emb_filename))      
      
    print(jsObj)  # {'a': '1111', 'c': '3333', 'b': '2222', 'd': '4444'}  
    print(type(jsObj)) # <type 'dict'>  
      
    for key in jsObj.keys():  
        print('key: %s   value: %s' % (key,jsObj.get(key)))
        # key: a   value: 1111  
        # key: c   value: 3333  
        # key: b   value: 2222  
        # key: d   value: 4444  
   ```

 


