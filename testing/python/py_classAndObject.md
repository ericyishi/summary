# ��Ͷ���
### ����
* ����һȺ������ͬ��������Ϊ��������ܳ�
* ���������ʵ��

### �鿴����ķ���
    ```
     dir([])#�鿴�б������Ժͷ���
    
    ```
### ������
* ͨ��class�ؼ���������һ����
    ```
    class Stu��
        a=3 #������
    
        # __init__ ��һ����ʼ����ʵ��������ʵ��������һ����������self
        # ͨ���������������
        def __init__(self,name,age):
            self.name=name
            self.age=age
        def study():
            print("learning") 
        @classmethod
        def classMethod(cls):
            print("class method")       
            print("������",cls.a)       
        @staticmethod
        def staticdemo():
            print('����һ����̬����')   
        
    ```
### �����ķ�������
1. __init__(self):��ʼ������
  * ����Ҫ��ʾ���ã���ʵ������ʱ�����python�Զ�����
  * ��ʼ������Ҳ���Ǳ���ģ�һ��������Ҫ����������Ի��߼̳и���ʱ��Ҫ����__init__����
  * ���û�ж���÷�������Ĭ�ϵ��ø���(�ռ�����ʱobject)��__init__����
  
2. ʵ������
  * ���һ�����������һ��������self����ʵ������
  * ʵ������ֻ��ͨ������ʵ�������е���
  * ʵ�������ڵ���ʱ����Ҫ����self����������ʽ��ʵ��������÷���self����
  
3. �෽��
  * �෽������ֱ�����������е��ã��෽��Ҳ����ͨ��ʵ�����е���
  * �෽���ڶ���ʱ������@classmethodװ��������װ��
  * �����෽���ĵ�һ������������cls
  * �෽�����ܷ���ʵ������(self.xxx)�Լ�ʵ��������ֻ�ܷ��������ԡ�ͨ������init��ʼ��ǰ�桿
      ```
       #ֱ�ӵ���
       Stu.classMethod()
       Stu.a
      ```
  * ����ʵ�����Ե����෽��������ֵ
      ```
       s=Stu()
       s.classMethod()
       s.a
      ```  
4. ��̬����
 * ֻ��ͨ��@staticmethodװ����������װ�β���ʹ��
 * ��̬�������ܷ���ʵ�����Ժ�������
 * ����ͨ������ֱ�ӵ��ã��Լ�ʵ��������������
      ```
       Stu.staticdemo()
       s=Stu()
       s.staticdemo()
      ```
### ���Ե�����
* ʵ�����ԣ���ʵ��������з��ʣ�����ʵ���������ʡ�������__init__�����н��г�ʼ����ֵ
* �����ԣ�ͨ��������ʵ�����ʣ�Ҳ������ʵ�������н��з���
 