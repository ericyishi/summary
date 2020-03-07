# ����
### ����
* ͨ��**�ַ�������ʽ**��**����ʱ��̬**�޸ĳ���ı����������Լ����ԵĲ���
* ���ڷ�����������е��޸Ķ�����**�ڴ���**���У������޸Ĵ���
* Ŀ�ģ���Ҫ��ߴ���������ʱ�������

### �漰�ķ���
* hasattr(object,str):����һ���ַ������ж϶�����û��������������ԡ����ز���ֵ
* getattr(object,str):��ȡ���������ֵ�򷽷������á�����Ƿ������򷵻ط�����**����**�������������ֱ�ӷ���ֵ��������Ի򷽷������ڣ����׳��쳣
  * func=getattr(people,sleep)
  * ִ�У�func() # ���ö�Ӧ��sleep����
    ```html
     content=input("������������õķ�����������")
     if hasattr(people,content):
        try:
          func=getattr(people,content)
          func() 
        except TypeError as e: 
           print(getattr(people,content))
    ```
* setattr(object,str,value):��̬���һ������������
  * �������
    ```html
     #-*- coding: utf-8 -*-
       class A:
           def __init__(self,name):
               self.name=name
           def sleep(self):
               print("{}����˯".format(self.name))
       
       
       a=A("zhangsan")
       setattr(a,"age",3) #��������
       print(dir(a)) #check�ķ�ʽ1
       print(getattr(a,'age')) #check�ķ�ʽ2
    ```
  * ��ӷ���
    * setattr(obj,"�¶���ķ�����",obj���һ����������)  
* delattr(obj,str):��̬ɾ��һ�����Ի򷽷���
  ```html
#-*- coding: utf-8 -*-
    def run():
        print("����")
    class A:
        def __init__(self,name):
            self.name=name
        def sleep(self):
            print("{}����˯".format(self.name))
    
    a=A("zhangsan")
    # setattr(a,"age",3) #��������
    # print(dir(a)) #check�ķ�ʽ1
    # print(getattr(a,'age')) #check�ķ�ʽ2
    setattr(a,"a_run",run)
    print(dir(a))
    delattr(a,'a_run')
    print(dir(a))
    delattr(a,'sleep') # ע������ɾ�������ķ����ᱨ��ġ�
    # func()
    print(dir(a))
  ```
  * ɾ�����������ᱨ���ԭ���ǣ�
  
  ```html
    delattr��setattr��ʵ��ֻ����Զ�������ԣ�
    �ոտ�����setattr��̬���õķ���֮�����ܱ�delattrɾ����
    ����Ϊsetattr���һ������ʱ��������������һ�����ԣ�
    �������ָ������ӵĺ����ĵ�ַ�����Ե���������Ե�ʱ��ִ���˷������ѣ�
    ��������������������ӵ���������ϡ�
    ���Ծ���ɾ������ʵ�ʵĶ���ķ�����
    ֻ��ɾ�����Ի򷽷������á�
    ��������֮���԰ѷ���������setattr��delattr��������ʵ���ϲ�����Ҳ
  ```
    
