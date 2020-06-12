# װ������հ�

### װ����

 #### ����
 * ��һ��������Ϊ������������ض����ܵĺ�����
 * @��ͷ��������������ǰ��
 * װ����=�߽׺���+Ƕ�׺���
   ```html
    import time
    def A():
        time.sleep(3)
        print("AAA")
    
    def mytimer(func):
        def B():
            start_time = time.time()
            func()
            end_time = time.time()
            print("����ʱ��", end_time - start_time)
        return B
    
    a=mytimer(A)
    a()
   ``` 
   * ������ʹ��python�Դ����﷨�Ǽ�д��
 
 #### ����ԭ����Ҫͬʱ���㡿
 * װ���������޸ı�װ����������Դ�롾ʹ�ø߽׺��������պ�������Ϊ�βΡ�
 * װ��������Ӱ�챻װ�κ���ԭ���ĵ��÷�ʽ��ʹ�ø߽׺���������ֵ�а�����������
   ```html
    #-*- coding: utf-8 -*-
    import time
    def A():
        time.sleep(3)
        print("AAA")
    
    def B(func):
        start_time=time.time()
        print(start_time)
        func()
        end_time=time.time()
        print(end_time)
        print("����ʱ��",end_time-start_time)
    B(A)  #�ı���ԭ��A��ֱ�ӵ��÷�ʽ��������ԭ��2�����Բ���װ����
   ```
 #### �﷨��
   ```html
    import time
    
    
    def mytimer(func):
        print("mytimer1")
        def B():
            print("mytimer1�ڲ�start")
            start_time = time.time()
            func()
            end_time = time.time()
            print("����ʱ��1:%f"%(end_time - start_time))
    
        return B
    
    def mytimer2(func):
        print("mytimer2")
        def B():
            print("mytimer2�ڲ�start")
            start_time = time.time()
            func()
            end_time = time.time()
            print("����ʱ��2��%f"%(end_time - start_time))
    
        return B
    
    if __name__=="__main__":
     @mytimer
     @mytimer2
     def A():
         time.sleep(3)
         print("AAA")
    
    A()
   ```
   ```html
     mytimer2
     mytimer1
     mytimer1�ڲ�start
     mytimer2�ڲ�start
     AAA
     ����ʱ��2��3.001000
     ����ʱ��1:3.001000 
   ```
   * ע�⣬װ��������Ҫд��ǰ�棬�Ƚ��ж���
   * @mytimerʵ�����Ĳ�������A=mytimer(A)��ֵ
   * ���A()ʵ�ʵ��õ���B(),���������װ�εĺ�����������Ҳ�������ﴫ��
 #### ��дװ������˼·
 1. ����һ�����ܺ�������Ϊ�����ĸ߽׺���
 2. �ڸ߽׺����ж���һ��Ƕ�׺������ڸ�Ƕ�׺����У�
    1. ��װ��Ҫ����ӵĹ��ܴ���
    2. ������Ϊ��������ĺ�����
    3. ����Ƕ�׺����ĺ�����
 
 #### ����������
 1. ��װ�εĺ������������߲���
    ```html
     def deco(func):
         def inner(*args,**kwargs):
              func(*args,**kwargs)
         return inner 
    ```
    ```
     import time
     
     def mytimer(func):
         def B(name):
             start_time = time.time()
             func(name)
             end_time = time.time()
             print("����ʱ��", end_time - start_time)
         return B
     
     @mytimer
     def A(name):
         time.sleep(3)
         print("AAA:",name)
     
     A('����')
    ```
    * �������Ż��£���Ϊ���ǲ�ȷ�������εĺ��������ĸ��������Կ��Կɱ����������
      ```html
        import time
        
        def mytimer(func):
            def B(*args,**kwargs):
                start_time = time.time()
                func(*args,**kwargs)
                end_time = time.time()
                print("runtime is", end_time - start_time)
            return B
        
        @mytimer
        def A(name):
            time.sleep(3)
            print("AAA:",name)
        
        @mytimer
        def C(age,name):
            time.sleep(1)
            print("CCC:",age,name)
        A('zhangsan')
        C(11,'wangxiao')
      ```
2. װ�������������
   * ��Ҫ�¼���һ��Ƕ�׺��������ҽ��ձ�װ�κ�������Ϊ������ͬʱ��Ҫ�����������
   ```html
     def deco(param):#param Ϊװ��������Ĳ���
         def outer(func):
             def inner(*args,**kwargs):
               func(*args,**kwargs)
             return inner 
         return outer
   
   ```
   ```html
     import time

     def mytimer(timer_type):
         print(timer_type)
         def outer(func): # ���װ����������ϲ������ּ���һ��
              def B(*args,**kwargs):
                  start_time = time.time()
                  func(*args,**kwargs)
                  end_time = time.time()
                  print("runtime is", end_time - start_time)
                  print(timer_type)
              return B
         return outer
     @mytimer(timer_type='min') #�÷�����ʱ,A=mytimer(timer_type='min')(foo)
     def A(name):
         time.sleep(3)
         print("AAA:",name)
     
     A('zhangsan')
   ``` 
3. ��װ��������������ֵ
   * ���ڲ�ִ�еĽ�������������ٷ��ظò�������
   ```html
     def deco(param):
         def outer(func):
           def inner(*args,**kwargs):
               res=func(*args,**kwargs)
               return res
           return inner    
         return outer()
   ```
   ```html
    import time

    def mytimer(timer_type):
        # print(timer_type)
        def outer(func): 
             def B(*args,**kwargs):
                 start_time = time.time()
                 res=func(*args,**kwargs)#��Ҫͨ��������������
                 # print res
                 end_time = time.time()
                 # print(timer_type)
                 print("runtime is", end_time - start_time)
                 return res # Ȼ���ٷ��س���
             return B
        return outer
    @mytimer(timer_type='min') #�÷�����ʱ,A=mytimer(timer_type='min')(foo)
    def A(name):
        time.sleep(3)
        # print("AAA:",name)
        return name
    
    print(A('zhangsan'))
   ```
### ���װ����ִ��˳��
* �ں�������׶Σ�ִ��˳���Ǵ����������װ������ʼ�����ڶ����ִ��
* �ں���ִ�н׶Σ�ִ��˳��������ڣ�һ���ִ��
* https://blog.csdn.net/u013411246/article/details/80571462

### �հ�
 #### �հ�����
 * ����������һ��������һ��˽�б���֮�䴴��������ϵ���ڸ����ĺ�������ε��õĹ����У�����Щ˽�б����ܹ����ֳ־���
   ```html
    _list = []

    for i in range(3):
        def func(i):
            def f_closure(a): #a���ܴ����ֵ1����iÿ��״̬������������
                return i + a
    
            return f_closure
    
    
        _list.append(func(i))
    
    for f in _list:
        print(f(1)) #1 2 3
    
   ```
   ```html
    _list = []
    for i in range(3):
        def func(a):
            return i+a
        _list.append(func)
    for f in _list:
        print(f(1)) # 3 3 3 
   ```
  
 #### �հ�����
 * ����Ҫ�к�����Ƕ�ף���㺯�����뷵���ڲ㺯������㺯���൱�ڸ��ڲ㺯���ṩһ����װ���������л���
 * �ڲ㺯��һ��Ҫ�õ���㺯����������ɲ���
     
### �հ���װ����������
* ��ͬ��
  1. ���Ǻ���Ƕ�ף���Ϊ��㺯�����ڲ㺯����������㺯��Ҫ�����ڲ㺯��
  2. ����ʵ�ֵ��߼�����
  3. ���߾�����ʵ�ֶ���Ĺ��ܵ�Ŀ��
* ��ͬ��
  * װ������
    1. ��㺯����Ϊװ����
    2. װ��������㺯����Ҫ���ṩ��װ�κ���������
    3. װ��������㺯����һ��Ҫ�ṩ����
    4. װ������Ŀ�ģ�Ϊ��װ�����ṩ����Ĺ���
    5. ��ʽ�Ͽ����հ�Ϊװ�������Ӽ�
  * �հ���
    1. ��㺯����Ϊ�հ�
    2. �հ�����㺯����Ҫ��Ϊ���ṩ���ɱ���
    3. �հ�����㺯�������ṩ���ɱ���������հ�û������
    4. �հ���Ŀ����Ϊ�˱��溯�����л����;ֲ�����    