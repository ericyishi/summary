# JSON模块
#### 四个常用的方法
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
    print(type(jsObj))  # <type 'dict'>
   ```
   * 若在数据写入json文件时，未先进行转换，报错如下
   ```
    import json    
    
    name_emb = {'a':'1111','b':'2222','c':'3333','d':'4444'}    
                
    emb_filename = ('/home/cqh/faceData/emb_json.json')    
        
    # jsObj = json.dumps(name_emb) #如果不进行格式转换，是会报错的     
        
    with open(emb_filename, "w") as f:    
        f.write(name_emb)    
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

 


