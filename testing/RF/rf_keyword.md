# �ؼ���
### Evaluate
* evaluate������ֱ������python�ű�������������Libraryû�и����ṩ����Ҫ�ķ���ʱ��ֱ����python�ű���ʵ������Ҫ�ķ�����
  ```html
   # ��ʽ��
     ���� evaluate python���� �������
     ${nowTime}    evaluate     time.strftime("%Y/%m%d %H:%M:%S",time.localtime(time.time()))    time
  ```
  * �����Ϳ�������python��ȡ��Ҫ��ʱ���ʽ
  
### log
* ��ӡ
* log��������scalar�������������dict������Ҫ�ѷ��ű��$
* log many��**�������List��dict����**  

### Run Keywords
* ������������
  ```
   Run Keywords log 123 AND 456
  ```
### ѭ��:FOR
* ��FOR���ؼ���ǰ����Ҫ����һ����:����д�ɡ�:FOR����������Python���﷨��ͬ��  
  ```html
   :FOR	${i}	IN 	1	2	3
    \	Log	${i}			
  ```
  * ֵΪ1��2��3
  ```html
   :FOR	${i}	IN RANGE	1	10	2
    \	Log	${i}			
  ```
  * ֵΪ1��3��5��7��9
 
### Evaluate
* ����ֱ������python
* 3��������
  * ���ʽ
  * �����ģ�飬Ĭ��ΪNone
  * �����ռ䣬Ĭ��ΪNone
```html
 ${random}    Evaluate    random.randint(0,sys.maxint)    random,sys
 Log    ${random} 
```    
* ע�⣺Ҳ�����������һ������������㣬����Ҫ��������
```html
 Log    Evaluate    len('${a}')
```