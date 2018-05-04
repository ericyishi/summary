# 操作cookie
* cookie数据是以字典形式存放的
### 常用方法
* get_cookies() 获取所有cookies内容
  ```
   # 遍历所有的键值
    for c in driver.get_cookies():
      print("%s -> %s"%(c['name'],c['value']))
  ```
* get_cookie(key) 通过字典的key找内容
* add_cookies(dictObj) 添加cookie
* delete_cookies(name,options) 删除cookie
  * options 支持"路径"和"域"
* delete_all_cookies() 删除所有cookies


