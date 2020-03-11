# 数据类型
* redis是key-value的数据，所以每个数据都是一个键值对
* 键的类型都是字符串
* 值支持五种数据类型：
  1. string（字符串）
  2. hash（哈希）
  3. list（列表）
  4. set（集合）
  5. zset(sorted set：有序集合)
  
### string
* string就是最基本的类型，不仅仅只能存字符串，能够满足工作大部分需求
* string 类型的值最大能存储 512MB
* 可以为任何数据，数字，图片，序列化对象等

#### 命令
##### 设置键值
```html
 set key value
```
```html
 set name zhangsan
```
* 设置键值的过期时间，单位为秒
```html
 setex  key seconds value
```
```html
 setex myname 10 lisi #设置myname="lisi"有效期10s 
```
* 10s后再get myname会显示nil

##### 获取键值
```html
get key
```
##### 查看键
```html
 keys 正则
``` 
* 查看所有的键
```html
 keys *
```
##### 判断键是否存在
```html
 exists key #返回1存在，返回0不存在
```
##### 删除键
```html
 del key # 直接删除键和值
```
##### 设置过期时间
```html
 expire key seconds # 可以对曾今未设置过期的键或者要修改过期时间的键重新设置
```
##### 查看键的剩余有效时间
```html
ttl key
```

### hash
* hash用于存储对象，对象的格式为键值对
* Redis hash 是一个 string 类型的 field 和 value 的映射表，hash 特别适合用于存储对象。

#### 命令
##### 设置键
```html
 HSET key field value
```
* 可以代表对象名 field为属性名，value为属性值
```html
 HMSET runoob field1 "Hello" field2 "World" #hmset可以设置多个值
```
##### 获取值
```html
 hget key field
```
```html
 HGET runoob field1
```
##### 返回所有的键值
  ```html
   hgetall key
  ```
##### 获取所有的属性
  ```html
   HKEYS key
  ```
##### 返回包含属性的个数
  ```html
   HLEN key
  ```

##### 获取所有值
  ```html
   HVALS key  
  ```

### list
* 列表的元素类型为string
* 按照插入顺序排序
* 在列表的头部或者尾部添加元素
* 列表最多可存储 23^2 - 1 元素 (4294967295, 每个列表可存储40多亿)
#### 命令
##### 设置
* 在头部插入数据
```html
 LPUSH key value [value ...]
```
```html
 lpush runoob redis
```

* 在尾部插入数据
```html
 RPUSH key value [value ...]
```
```html
 rpush runoob mongo
```

* 在一个元素的前|后插入新元素
```html
 LINSERT key BEFORE|AFTER pivot value
```
* pivot 为锚点，可以设置对应的key，也可以设置下标
* 索引是基于0的下标
* 索引可以是负数，表示偏移量是从list尾部开始计数，如-1表示列表的最后一个元素
```html
 linsert runoob before redis python
```
##### 获取
* 移除并且返回 key 对应的 list 的第一个元素
  ```html
   LPOP key
  ```

* 移除并返回存于 key 的 list 的最后一个元素
  ```html
   RPOP key
  ```

* 返回存储在 key 的列表里指定范围内的元素
```html
 LRANGE key start stop
```
 * start 和 end 偏移量都是基于0的下标
 * 偏移量也可以是负数，表示偏移量是从list尾部开始计数，如-1表示列表的最后一个元素
```html
 lrange runoob 0 -1 #从0到-1代表全部
```
```html
 1) "python"
 2) "redis"
 3) "mongo"

```
 
### set
* Redis 的 Set 是 string 类型的无序集合。
* 集合是通过哈希表实现的，所以添加，删除，查找的复杂度都是 O(1) 
* 集合中最大的成员数为 23^2 - 1(4294967295, 每个集合可存储40多亿个成员)。
#### 命令
##### 设置值
```html
 sadd key member [member ...]
```
```html
 sadd sname zhangsan
 sadd sname lisi
```
##### 获取值
* 返回key集合所有的元素
```html
 smembers key
```
```html
 smembers sname
```
```html
1) "lisi"
2) "zhangsan"

```
##### 返回集合元素个数
```
 scard key
```
### zset
*  sorted set，有序集合
* 元素为string类型
* 元素具有唯一性，不重复
* 每个元素都会关联一个double类型的score，表示权重，通过权重将元素从小到大排序
* 元素的score可以相同
#### 命令    
##### 设置值
* 添加
```html
 ZADD key score member [score member ...]
```
```html
 zadd myset 3 hello 1 world 5 123 
```

##### 获取值
* 返回指定范围内的元素
```html
 ZRANGE key start stop
```
```html
 zrange myset 0 -1
```
```html
 1) "world"
 2) "hello"
 3) "123"
```

* 返回元素个数
  ```html
   ZCARD key
  ```

* 返回有序集key中，score值在min和max之间的成员
  ```html
   ZCOUNT key min max
  ```

* 返回有序集key中，成员member的score值
  ```html
   ZSCORE key member  
  ```
