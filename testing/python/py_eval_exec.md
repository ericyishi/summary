# eval()��exec()
* ���Զ�̬���ַ���������python������ִ��
### eval()����
* eval(expression,globals=None,locals=None)
  * expression�ַ����򵥱��ʽ
  * globals������Ϊȫ�ֵ������ռ䣬�ͻ�ʹ��ȫ�ֶ���ı�����ֵ
  * locals��ʹ�ñ��صı�����ֵ
  * ���globals��locals��û�����ã������������ĵı���ֵ
  * ���globals��locals�������ã���ʹ��locals��ֵ��û�е�ֵ��ʹ��globals�����
    ```html
        #-*- coding: utf-8 -*-
        a = 10
        b = 20
        c = 30
        g = {'a': 6, 'b': 8}
        t = {'b': 100, 'c': 10}
        print(eval('a+b+c')) #60
        # print(eval('a+b+c', g)) #�ᱨ����Ϊglobal�����Ҳ���c����ʱ��eval�����������gָ��������ֵ��ˣ�Ҳ���������c=30�����ε��ˣ�eval�ǿ�������
        print(eval('a+b+c', g, t)) #116.aʹ�õ���globals�����
    ```
### exec()����
* exec(obj,globals=None,locals=None)
  ```html
    x=1
    y=exec('x=x+1')
    print(x,y)#2,None
    exec('a=[]\na.append(2)')#\n�ǻ���
    print(a)# [2]
  ```
### ��������
* ��һ��������ͬ��eval���ַ������ʽ��exec�Ƕ�����ַ������ʽ
* ����ֵ��eval�з���ֵ��exec�޷���ֵ
* �������ڡ�eval������ʽ���������ھͽ�����exec������ڸ������������ⲿ����ʹ��

### �����÷�
* ����ת���������ַ���������ת��Ϊ��Ӧ���б��ֵ������
  ```html
    # ע��ʹ��eval��exec���ַ�����д�����в�ͬ
    a = "{'name':'zhangsan','age':18}"
    print(type(a)) # <class 'str'>
    b = eval(a)
    print(type(b)) # <class 'dict'>
    c = "mydic={'name':'zhangsan','age':18}"
    print(type(c)) # <class 'str'>
    exec(c)
    print(type(mydic)) # <class 'dict'>
  ```