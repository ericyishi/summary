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
* setattr:��̬���һ������������
* delattr:��̬ɾ��һ������������

