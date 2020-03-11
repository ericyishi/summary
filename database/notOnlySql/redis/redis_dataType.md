# ��������
* redis��key-value�����ݣ�����ÿ�����ݶ���һ����ֵ��
* �������Ͷ����ַ���
* ֵ֧�������������ͣ�
  1. string���ַ�����
  2. hash����ϣ��
  3. list���б�
  4. set�����ϣ�
  5. zset(sorted set�����򼯺�)
  
### string
* string��������������ͣ�������ֻ�ܴ��ַ������ܹ����㹤���󲿷�����
* string ���͵�ֵ����ܴ洢 512MB
* ����Ϊ�κ����ݣ����֣�ͼƬ�����л������

#### ����
##### ���ü�ֵ
```html
 set key value
```
```html
 set name zhangsan
```
* ���ü�ֵ�Ĺ���ʱ�䣬��λΪ��
```html
 setex  key seconds value
```
```html
 setex myname 10 lisi #����myname="lisi"��Ч��10s 
```
* 10s����get myname����ʾnil

##### ��ȡ��ֵ
```html
get key
```
##### �鿴��
```html
 keys ����
``` 
* �鿴���еļ�
```html
 keys *
```
##### �жϼ��Ƿ����
```html
 exists key #����1���ڣ�����0������
```
##### ɾ����
```html
 del key # ֱ��ɾ������ֵ
```
##### ���ù���ʱ��
```html
 expire key seconds # ���Զ�����δ���ù��ڵļ�����Ҫ�޸Ĺ���ʱ��ļ���������
```
##### �鿴����ʣ����Чʱ��
```html
ttl key
```

### hash
* hash���ڴ洢���󣬶���ĸ�ʽΪ��ֵ��
* Redis hash ��һ�� string ���͵� field �� value ��ӳ���hash �ر��ʺ����ڴ洢����

#### ����
##### ���ü�
```html
 HSET key field value
```
* ���Դ�������� fieldΪ��������valueΪ����ֵ
```html
 HMSET runoob field1 "Hello" field2 "World" #hmset�������ö��ֵ
```
##### ��ȡֵ
```html
 hget key field
```
```html
 HGET runoob field1
```
##### �������еļ�ֵ
  ```html
   hgetall key
  ```
##### ��ȡ���е�����
  ```html
   HKEYS key
  ```
##### ���ذ������Եĸ���
  ```html
   HLEN key
  ```

##### ��ȡ����ֵ
  ```html
   HVALS key  
  ```

### list
* �б��Ԫ������Ϊstring
* ���ղ���˳������
* ���б��ͷ������β�����Ԫ��
* �б����ɴ洢 23^2 - 1 Ԫ�� (4294967295, ÿ���б�ɴ洢40����)
#### ����
##### ����
* ��ͷ����������
```html
 LPUSH key value [value ...]
```
```html
 lpush runoob redis
```

* ��β����������
```html
 RPUSH key value [value ...]
```
```html
 rpush runoob mongo
```

* ��һ��Ԫ�ص�ǰ|�������Ԫ��
```html
 LINSERT key BEFORE|AFTER pivot value
```
* pivot Ϊê�㣬�������ö�Ӧ��key��Ҳ���������±�
* �����ǻ���0���±�
* ���������Ǹ�������ʾƫ�����Ǵ�listβ����ʼ��������-1��ʾ�б�����һ��Ԫ��
```html
 linsert runoob before redis python
```
##### ��ȡ
* �Ƴ����ҷ��� key ��Ӧ�� list �ĵ�һ��Ԫ��
  ```html
   LPOP key
  ```

* �Ƴ������ش��� key �� list �����һ��Ԫ��
  ```html
   RPOP key
  ```

* ���ش洢�� key ���б���ָ����Χ�ڵ�Ԫ��
```html
 LRANGE key start stop
```
 * start �� end ƫ�������ǻ���0���±�
 * ƫ����Ҳ�����Ǹ�������ʾƫ�����Ǵ�listβ����ʼ��������-1��ʾ�б�����һ��Ԫ��
```html
 lrange runoob 0 -1 #��0��-1����ȫ��
```
```html
 1) "python"
 2) "redis"
 3) "mongo"

```
 
### set
* Redis �� Set �� string ���͵����򼯺ϡ�
* ������ͨ����ϣ��ʵ�ֵģ�������ӣ�ɾ�������ҵĸ��Ӷȶ��� O(1) 
* ���������ĳ�Ա��Ϊ 23^2 - 1(4294967295, ÿ�����Ͽɴ洢40���ڸ���Ա)��
#### ����
##### ����ֵ
```html
 sadd key member [member ...]
```
```html
 sadd sname zhangsan
 sadd sname lisi
```
##### ��ȡֵ
* ����key�������е�Ԫ��
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
##### ���ؼ���Ԫ�ظ���
```
 scard key
```
### zset
*  sorted set�����򼯺�
* Ԫ��Ϊstring����
* Ԫ�ؾ���Ψһ�ԣ����ظ�
* ÿ��Ԫ�ض������һ��double���͵�score����ʾȨ�أ�ͨ��Ȩ�ؽ�Ԫ�ش�С��������
* Ԫ�ص�score������ͬ
#### ����    
##### ����ֵ
* ���
```html
 ZADD key score member [score member ...]
```
```html
 zadd myset 3 hello 1 world 5 123 
```

##### ��ȡֵ
* ����ָ����Χ�ڵ�Ԫ��
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

* ����Ԫ�ظ���
  ```html
   ZCARD key
  ```

* ��������key�У�scoreֵ��min��max֮��ĳ�Ա
  ```html
   ZCOUNT key min max
  ```

* ��������key�У���Աmember��scoreֵ
  ```html
   ZSCORE key member  
  ```
