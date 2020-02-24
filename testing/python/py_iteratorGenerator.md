# ��������������

### ������
 #### ��������ĸ���
 * ��python��������У�ֻҪ�������˿��Է���һ����������__iter__���������߶����˿���֧���±�������__getitem__��������ô������һ���ɵ�������
 ```html
  dir([])#���ܿ����б�����__iter__����
 ```
 * ���������������forѭ������
 
 #### ����ж�һ�������Ƿ�Ϊ��������
 * ����1��isinstance(����,Iterable)
   ```html
    #-*- coding: utf-8 -*-
    from collections import Iterable #��Ҫ����collections��
    class A:
        pass
    print(isinstance([],Iterable))#True
    print(isinstance(A,Iterable)) #False
   ```
 * ����2��hasattr+ __getitem__
   ```html
    print(hasattr([],'__getitem__')) #True
    print(hasattr([],'__iter__')) #True
   ```
 #### ����ͨ�����Ϊ�ɵ�������
 * ����__getitem__����
   ```html
      #-*- coding: utf-8 -*-
      from collections import Iterable
      class A:
          def __init__(self,people):
              self.people=people
          def __getitem__(self, item): #item�ǽ�����������ά��������ֵ����forѭ���У������ʹ�0��ʼ����
              return self.people[item]
      
      a=A(['p1','p2','p3'])
      # for i in a.people:
      #     print i
      for i in a:
          print i
   ```
 #### ����������
 * ��ɵ���������������ͬ�ĸ���
 * �������������ͬʱʵ����__next__��__iter__�����Ķ���
 * ����__iter__�������ص���������
 * __next__�������Ϸ��ص�������һ��ֵ��ֱ��������û�и����Ԫ��ʱ���׳�StopIteration�쳣����ֹ����
 * Ҳû�й̶��ĳ��ȣ�����len()Ҳ��������
 * ������������������û�ж����ˣ�ֻ�ܵ���һ��
   ```html
    for i in a_iter: # a_iter��һ���ɵ�������
        print(i)
    for i in a_iter: # ���ѭ����û��ֵ���
        print(i) 
   ```
 * Ϊʲô���˵������󣬻�Ҫ�е�������
   * �������ǹ���ģʽ����Լ�ڴ�ռ䡣��Ҳ��ʹ�õ�������ԭ�����Կ���һ�����������޶��Ԫ�ض������ڴ����
   ```html
    #-*- coding: utf-8 -*-

    from itertools import count
    counter =count(start=10)#��10��ʼȡ��������
    print(dir(counter))
    print(next(counter))
    print(next(counter))
   ```
 #### ����ж��Ƿ��ǵ�����
   ```html
    from collections import Iterator
    from itertools import count
    counter =count(start=10)#��10��ʼȡ��������
    
    print(isinstance(counter,Iterator))#True

   ```  
 #### ǿ��ת��Ϊ������
   * iter()����
   ```html
    a = [1, 2, 3]
    print(type(a)) #<type 'list'>
    a_iter = iter(a)  # ��a����ɵ��������Ϊ����������
    print(type(a_iter))#<type 'listiterator'>
    print(next(a_iter)) #1
    print(next(a_iter)) #2
    print(next(a_iter)) #3
    print(next(a_iter)) #����StopIteration
    
   ```
### ������
 #### ����
 * ��������һ������ĵ�����
 * �������ţ�����Ҫ�������һ��д__iter__()��__next__()������
 * ֻ��ʹ��yield�ؼ��֣�ֻҪһ������ʹ����һ������yield�ؼ��֣���������ͻ���һ��������
 * ʹ��"next(������ʵ��)"��"������ʵ��.send(None)"��Ԥ���� 
 * ʹ��forѭ��ÿ��ѭ��ʵ�ʾ��ǵ��õ�next()�����forѭ�������д���StopIteration�쳣
 
 #### yield�ؼ���
 * �����ڴ���������yield�᷵�ؽ��
 * ������ǰ�����ĺ���������״̬���ȴ���һ�ε��ã�**�´ε��ô���һ�η���yield����ʼִ�к�������**����Ҳ����return������
   ```html
    def demo():
    print('hello')
    yield 5
    print('world')
    c=demo() #��û��ֱ��ִ��
    print(next(c))#ʹ��next�Ż���룬��ִ�е�yield֮ǰ�����
    print(next(c))#�Ӵ�ӡ'world'��ʼ������StopIteration�쳣����
   ```
 #### ��������
 * send()����
   * ������next()һ������������
   * ����send�����ڵ���������ʱ������ͬʱ���������������ݵ����������ڲ���next���С�
   ```html
    #-*- coding: utf-8 -*-
    def demo():
        print('hello')
        t=yield 5 #t�����ڽ���send�����ֵ�������Ǻ���yield���ص�5
        print('world')
        print(t) #123
    
    c=demo() #��û��ֱ��ִ��
    print(next(c))#ʹ��next�Ż���룬��ִ�е�yield֮ǰ�����
    c.send("123")
   ```
   * ��һ��ʹ��send()����ʱ�򣬱���Ҫ����һ��None������ֱ�Ӵ���
 #### ����������
 1. �����ں�����ʹ��yield  
 2. ͨ��Ԫ���������
    ```html
     a=(i for i in range(10))
    ```