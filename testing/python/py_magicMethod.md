# ħ������
### ����
1. ħ����������ָ˫�»��Q��ͷ�ͽ�β�ķ���
2. ͨ�����෽������Ҫ�������ã����ض��ķ�������Ϊ��������__init__����
3. ��;��ͨ��ʹ��ħ���������������Ϊ��ʵ�ֶ���ĸ߼�����
4. �鿴һ�����еķ�����dir(����)����dir([])�鿴�б�

### __repr__()
* ���ƶ���print��ʾ����
  ```html
       #-*- coding: utf-8 -*-
    class A:
        def __init__(self,name):
            self.name=name
        def __repr__(self):
            return 'Student[name='+self.name+"]" #�����������һ���ʽ������[attr1=value,attr2=value]
    
    a=A("zhang")
    print(a) 
    print(a.__repr__()) # ���д�ӡ������һ���ġ�û����д__repr__֮ǰ��ʾ�����ڴ��ַ<__main__.A object at 0x0086F070>����д����ʾStudent[name=zhang]
  ```
## __del__()
* �����������������ٶ���ʱ������Դռ�õ��������������
* Python ͨ������ __init__() �������쵱ǰ���ʵ�������󣬶�����Ҫѧ�� __del__() �������������ú� __init__() �෴������������ʵ��������
* ���������£�Python �����߲���Ҫ�ֶ������������գ���Ϊ Python ���Զ����������ջ��ƣ�����ὲ�������Զ�������Ҫʹ�õ�ʵ������������١�
* �������������ݿ⣬��ȡ�ļ��ĺ�Ĺرղ���
```html
    #-*- coding: utf-8 -*-
    class B:
        def __init__(self,name):
            self.name=name
            self.f=open('1.txt')
        def __del__(self):
            self.f.close()
    b=B('lee')
```
```html
     class CLanguage:
        def __init__(self):
            print("���� __init__() �����������")
        def __del__(self):
            print("����__del__() ���ٶ����ͷ���ռ�")
    clangs = CLanguage()
    #����һ������clangs�����ʵ������
    c1 = clangs #c1����������clang
    del clangs
    print("***********")
```
* �������Ľ����
* ���Կ���������������������������������� cl�����ø�ʵ������ʱ�������ֶ����� __del__() �������÷���Ҳ��������ִ�С���� Python ���������ջ��Ƶ�ʵ���йء�

```html
     ���� __init__() �����������
    ***********
    ����__del__() ���ٶ����ͷ���ռ�
```
  * �������棺
    ```html
     Python �����Զ����ü�������� ARC���ķ�ʽʵ���������ջ��ơ�
     �÷����ĺ���˼���ǣ�ÿ�� Python ���󶼻�����һ������������ʼ Python ʵ������ļ�����ֵ��Ϊ 0������б������ø�ʵ���������������ֵ��� 1���������ƣ�
     ��֮��ÿ��һ������ȡ���Ը�ʵ����������ã���������� 1��
    ���һ�� Python ����ĵļ�����ֵΪ 0�������û�б������ø� Python ���󣬼�֤����������Ҫ������ʱ Python �ͻ��Զ����� __del__() ����������ա�
     
     ����������е� clangs Ϊ����
     ʵ���Ϲ��� clangs ʵ������Ĺ��̷�Ϊ 2 ����
     ��ʹ�� CLanguage() ���ø����е� __init__() ���������һ������Ķ��󣨽����Ϊ C��������Ϊ 0������������ clangs ���������Ϊ����ʵ����������ã� C �ļ�����ֵ + 1����
     �ڴ˻����ϣ�����һ�� c1 �������� clangs����ʵ�൱������ CLanguage()����ʱ C �ļ������� +1 ������ʱ�������del clangs��䣬ֻ�ᵼ�� C �ļ������� 1��ֵ��Ϊ 1������Ϊ C �ļ�����ֵ��Ϊ 0����� C ���ᱻ���٣�����ִ�� __del__() ��������
    ```
* ���������д����� __del__() ����������Ϊ�� object ���ࣩ���������ʽ���ø���� __del__() �������������ܱ�֤�ڻ����������ʱ����ռ�õ���Դ�����ܰ����̳��Ը���Ĳ�����Դ���ܱ������ͷš�
```html
    class CLanguage:
        def __del__(self):
            print("���ø��� __del__() ����")
    class cl(CLanguage):
        def __del__(self):
            print("�������� __del__() ����")
            super().__del__() #����д��CLanguage.__del__(self) #һ���Ǹ����ʵ�����ã�һ����ͨ������ֱ�ӵ��ã�Ч����һ����
    c = cl()
    del c
```
### __new__()
* ���𴴽����ʵ��
* ע��__init__�����Ǵ���ʵ�������ʼ������������__new__ ��ִ��__init__

### __dir__()
* �鿴����ķ�������������
* ����һ��dir()��һ������������__dir__()�������䷵��ֵ�������򣬲�����һ���б�
```html
    #-*- coding: utf-8 -*-
    class A:
        def __init__(self,name,age):
            self.name=name
            self.__age=age
    
    a=A('rick',18)
    print(a.__dir__())
    print(len(a.__dir__()))#28
    print(dir(a))
    print(len(dir(a)))#28
    print(len(dir(A)))#26
    print(dir(A))
```
* ����һ����ֻ������ͬ
* ע��dir������������������򲻰���ʵ�����ԣ���dir(A)��û��name��age

## __dict__
* ��������**��**ʱ���洢����ʵ�������ı��������磺�����ԣ�����ķ���
* ��������**ʵ������**ʱ���洢�ö������е�������������ֵ
* ��;��һ�����ڶ�̬��ȡ�����ö��������
```html
 #-*- coding: utf-8 -*-
 class A:
     def __init__(self,name,age):
         self.name=name
         self.__age=age
 
 a=A('rick',18)
 print(a.__dict__) #{'name': 'rick', '_A__age': 18}
 print(A.__dict__) # {'__module__': '__main__', '__init__': <function A.__init__ at 0x0039CED0>, '__dict__': <attribute '__dict__' of 'A' objects>, '__weakref__': <attribute '__weakref__' of 'A' objects>, '__doc__': None}
 print(a.__dict__['name'])#��a.nameЧ��һ��
 # ����������
 a.__dict__['name']='jack'
 print(a.name)
 # ��������
 a.__dict__['gender']='male' #���ǽ��Ե�ǰʵ�����ӣ�����Ա��ʵ�����Ӹ�����
```
### ������
1. __getattribute__(self,xxxx):���ʶ����������ԣ����㲻���ڣ�ʱ���Զ�����
   * �ٸ�����
        ```html
             #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
              def __getattribute__(self, item):
                  print("�����ʵ�����Ϊ%s"%(item))
          
          stu=Student('zhangsan',18)
          stu.name #ִ�к�����������ʵ�����Ϊname
          stu.gender #ִ�к�����������ʵ�����Ϊgender
          print(stu.name)#��ʱ��ȡ��������ֵ�ˣ�ԭ������д��__getattribute__��������û�з���ֵ��ɵ�
        ```
        * �޸ĵĺ������
        ```html
              #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
          
              def __getattribute__(self, item):
                  print("�����ʵ�����Ϊ%s"%(item))
                  return super().__getattribute__(item) # ���ø���������������ȡ
          
          stu=Student('zhangsan',18)
          stu.name #ִ�к�����������ʵ�����Ϊname
        ```
        * ���ڷ���û�ж�������ԣ��ǻᱨ���ģ����Բ����쳣�����д���
        ```html
          #-*- coding: utf-8 -*-
          class Student:
              def __init__(self,name,age):
                  self.name=name
                  self.age=age
          
              def __getattribute__(self, item):
          
                  try:
                      print("������%s����" % (item))
                      return super().__getattribute__(item)
                  except AttributeError as e:
                      print(e)
                      print('{}Ϊδ�������ԣ�����'.format(item))
          
          
          stu=Student('zhangsan',18)
          stu.gender #ִ�к�����������ʵ�����Ϊgender�����Ჶ���쳣���д���
        ```
    
    
        
2. __getattr__(self,xxxx):����**δ���������**ʱ������
  * ��__getattribute__û�н��в����쳣AttributeError�������ͻ����__getattr__������Ͳ��������
  ```html
     #-*- coding:utf-8 -*-
    class A:
        def __init__(self,name):
            self.name=name
    
        def __getattr__(self, item):
            print("δ������������%s������"%(item))
    
    a=A("zhangsan")
    a.age #δ��������age������ 
  ```
3. __setattr__(self,xxxx,value):����xxx���Ը�ֵʱ���ͻ���ø÷���
   * ��__init__�³�ʼ��ʱ��Ҳ�����

   ```html
    # -*- coding:utf-8 -*-
    class A:
        def __init__(self,name):
            self.name=name
    
        def __setattr__(self, key, value):
            print("����{}����ֵΪ{}".format(key,value))
    
    a=A("zhangsan")
    a.name="lisi"
    # ����name����ֵΪzhangsan
    # ����name����ֵΪlisi
   ``` 
   * ���������޸�����ʱ����Ҫ����һ�����򣬾Ϳ��������ﶨ��  
   ```html
        # -*- coding:utf-8 -*-
    class A:
        def __init__(self, name, age):
            self.name = name
            self.age = age
    
        def __setattr__(self, key, value):
            if key == 'age':
                if value > 18:
                    self.__dict__[key] = value  # ��ֵ������д������д��self.age=value,�����ѭ�������ֵ���__setattr__
                else:
                    raise Exception('������Ҫ����18')
            else:
                self.__dict__[key]=value
    
    a = A("zhangsan", 12)
    print(a.name)
   ```
4. __delattr__(self,xxxx):��ɾ�������xxxx����ʱ������
   * del a.name
   
5. __slots__('attr1','attr2''):�޶���ǰ�����ܰ󶨵����ԣ�������û�ж���������������಻������
   * ע��_gender��û�е����ԣ���Ϊ��slots����д�ˣ����Կ��԰�
   ```html
    #-*- coding: utf-8 -*-
    class Person(object):
    
        # �޶�Person����ֻ�ܰ�_name, _age��_gender����
        __slots__ = ('_name','_age',"_gender")
    
        def __init__(self, name, age):
            self._name = name
            self._age = age
    
        @property
        def name(self):
            return self._name
    
        @property
        def age(self):
            return self._age
    
        @age.setter
        def age(self, age):
            self._age = age
    
        def play(self):
            if self._age <= 16:
                print('%s�����������.' % self._name)
            else:
                print('%s�����涷����.' % self._name)
    
    
    
    person = Person('����', 22)
    person.play()
    print(person.age)
    person._gender='��'
    print(person._gender)
   ```     