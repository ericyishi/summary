# ����֪ʶ��
### ����̬�ļ�
  * �����ڵ�����css��js��ͼƬ��Щ��html�ļ�����Ҫ�����ֲ�����̫����˽���ļ�����̬�ļ���������html��ģ��

  ##### ���þ�̬�ļ�
  * ��settings �ļ��ж��徲̬����
  ```html
   STATIC_URL = '/static/' # �߼���static·��
   STATICFILES_DIRS = [
      os.path.join(BASE_DIR, 'static'), # ��������һ��static�ļ���
  ]
  ```
  * ����Ŀ�£���Ӧ��ͬ�����������ļ����Լ�ͼƬstatic/Ӧ����/ͼƬ����static/booktest/a.png
  
  ##### img��ǩ������ 
  * ����һ��Ӳ����
    ```html
     <img src="/static/booktest/a.png"/>
    ```
    * ����Ϊ��127.0.0.1:8000/static/booktest/a.png
    * �����/static���߼�·�� STATIC_URL ��ֵ�������settings�иı䣬��ôģ����ͼƬ·��Ҳ��Ҫ��
  
  * ����������ģ���п���ʹ��static����
    ```html
     { % load static from staticfiles %} #ģ���ļ���һ������
   
     <img src="{ % static "booktest/a.png" %}" alt="My image"/>
    
    ```
    * static ��ֵ������settings��STATIC_URL �ı���ı�
 
### �м��
  * ��һ�����������ײ�Ĳ��ϵͳ
  * �ڲ��ƻ�ԭ���߼�������£����Խ���Django���������Ӧ������̣��޸�Django����������
  * ��django�������̵�˼�룬����MVC����нз����в�ͬ��django�нС��м����
  * �����ӵ�Django�����ļ��е�MIDDLEWARE_CLASSESԪ����
  * ÿ���м�������һ��������Python�࣬���Զ���django�ṩ�Ĺ̶��ķ����е�һ������
    * __init__() :�����κβ�������������Ӧ��һ�������ʱ�����һ�Σ�����ȷ���Ƿ����õ�ǰ�м��
    * process_request(request)��ִ��·��ǰ���ã�����None��HttpResponse����
    * process_view(request, view_func, view_args, view_kwargs)��������ͼ֮ǰ�����ã���ÿ�������ϵ��ã�����None��HttpResponse����
    * process_template_response(request, response)�� ����ģ��ǰ���ã�����ʵ����render��������Ӧ����
    * process_response(request, response)��������Ӧ���������֮ǰ�����ã���ÿ�������ϵ��ã�����HttpResponse���� 
    * process_exception(request,response,exception)����ͼ�����쳣ʱ���ã�����һ��HttpResponse����
  *   
    ```html
    
     �ͻ���--process_request()-->��URL��--process_view()-->��view��--process_template_response()-->��template html��
                                         |                                                           |                          
                                         |                                                           |
                                         |                                                           |                          
                                         |--process_exception()--------------------------->-- process_response() -->�ͻ���

    ```
  * һ�����ӣ��Զ����쳣����
    1. ��Ӧ���£���settings.pyͬ��Ŀ¼�´���myexception.py�ļ���������MyException��ʵ��process_exception����
        ```html
         from django.http import HttpResponse
         class MyException():
             def process_exception(request,response, exception):
                 return HttpResponse(exception.message)
        ```
    2. ����MyExceptionע�ᵽsettings.py�м����
       ```html
         MIDDLEWARE_CLASSES = (
             'test1.myexception.MyException', # Ӧ����.ģ����.����
             ...
         )
       ```    
    3. ������ͼ��������һ���쳣��Ϣ����������Զ�����쳣����
       ```html
        def myExp(request): 
            a1=int('abc') # �������ת���ᱨ���Ӷ������쳣,�Ӷ�ҳ������ʾ�쳣message
            return HttpResponse('abc')
       ```   
### ��ҳ
* Django�ṩ��һЩ��ʵ�ֹ������ݷ�ҳ����Щ��λ��django/core/paginator.py��
##### paginator����
* p=Paginator(�б�,int)�����ط�ҳ���󣬲���Ϊ�б����ݣ�intΪÿҳ���ݵ����� 
  ```html
   list1 = AreaInfo.objects.all()
   p=Paginator(list1,10)  # ÿ10������Ϊһҳ
  ```     
* ����
  * count����������
  * num_pages��ҳ������
  * page_range��ҳ���б���1��ʼ������[1, 2, 3, 4]
* ����   
  * page(num)������ָ��ҳ�����ݵĶ����±���1��ʼ������ṩ��ҳ�벻���ڣ��׳�InvalidPage�쳣
##### page����
* Paginator�����page()��������Page���󣬲���Ҫ�ֶ�����  
  ```html
   p=Paginator(list1,10) 
   currentPage=p.page(1) # ��ȡ��һҳ���ݣ�����һ��������ģ�����������ȡֵ
    
  ```
* ����
  * object_list����ǰҳ�����ж�����б�
  * number����ǰҳ����ţ���1��ʼ
  * paginator����ǰpage������ص�Paginator����
    * �������ܹ���ȡPaginator��������page_range�����ԣ�����ʾ���з�ҳ����
      ```html
       {% for index in page.paginator.page_range %}
       {% if index == page.number %} #ע��==����Ҫ��һ�񣬷���ᱨ��
         {{ index }}
       {% endif %}
         <a href="/herolist/{{index}}/">{{index}}</a> 
       {% endfor %}   
      ```
* ����  
  * has_next()���������һҳ����True
  * has_previous()���������һҳ����True
  * has_other_pages()���������һҳ����һҳ����True
  * next_page_number()��������һҳ��ҳ�룬�����һҳ�����ڣ��׳�InvalidPage�쳣
  * previous_page_number()��������һҳ��ҳ�룬�����һҳ�����ڣ��׳�InvalidPage�쳣
  * len()�����ص�ǰҳ�����ĸ���

   