# ����Ӧ��
* ������Ŀ��������Ҫ����Ӧ��
* һ����Ŀ���Դ������Ӧ��
* ����Ӧ�õ�λ�ã���Ҫ��manage.py�ļ�������
  ```html
    python manage.py startapp Ӧ����
    python manage.py startapp booktest
  ```
  * ������ͻ�����Ŀ����һ��Ӧ�������ļ��С�����Ŀ�ļ����Լ�manage.py�ļ�ͬ������������������Ľṹ
    ```
     _____
      |
      ------booktest��Ӧ������
         |
         -------migrations��һ���ļ��С�
         |
         -------__init__.py
         |
         -------admin.py
         |
         -------models.py
         |
         -------tests.py
         |
         -------views.py
    ```
    
### ����ģ�͵Ĳ���
1. ����ģ����
2. ע��Ӧ��
3. ����Ǩ���ļ�����ִ�����ɱ�
 
### ����ģ����
* ��Ӧ�������и�models.py�ļ���������Ա�д�����Լ���ģ�͵Ĵ���
* ����ļ���Ĭ���Ѿ�������modelsģ�飺from django.db import models
* ��һ�����ݱ�����һ��ģ������֮��Ӧ  
* ģ����̳���models.Model��
  ```html
    class BookInfo(models.Model):
       pass 
  ```
  * **ע��**:�������Ҫ�̳�django��models.Model����ΪҪʹ��django��model��������д���Ǹ���ͨ�࣬û�������ݿ⽨��ӳ�������
* ģ������ֶ����ͣ���Ҫʹ��django�ģ��ο�������ֶ�����    
  ```html
   from django.db import models

    # Create your models here.
    class BookInfo(models.Model):
        btitle=models.CharField(max_length=20)
        bpub_date=models.DateTimeField()
        def __str__(self):
             return self.btitle
        
    class HeroInfo(models.Model):
        hname=models.CharField(max_length=10)
        hgender=models.BooleanField()
        hcontent=models.CharField(max_length=1000)
        hbook=models.ForeignKey(BookInfo) # ͨ�����������BookInfo����Ĺ�ϵ
  ```
  * ģ���ഴ���ú�django���Զ��������Ǵ�����ṹ�������ݿ���������Ҳ����ӳ���ϵ�ģ����������Լ�д����id
  * ����django������дһ��sql��䣬ֱ�Ӱ�����model�ṹ�����ɽ�����ϵ�ˡ�
  * ���������ʱ������ö����str����
### ע��Ӧ��
* ��Ҫ����Ŀ�ļ����µ�settings.py�ļ�����Ӧ����booktest���뵽installed_apps��
  ```html
   INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'booktest'
   )
  ``` 
  
### Ǩ������
* �����ģ���������Ǩ���ļ�����ִ��Ǩ���ļ��������ݿ��д�����
* ���裺
  1. ����Ǩ���ļ�
     ```html
      python manage.py makemigrations
     ```
     * ���гɹ��󣬻���������䣬����migrations�������0001_initial.py�ļ�
        ```html
        Migrations for 'booktest':
           0001_initial.py:
            - Create model BookInfo
            - Create model HeroInfo
        ```
  2. ִ��Ǩ�ƣ����ɱ�������Ӧ�����ݿ�����ִ��sql��䡿
     ```html
      python manage.py migrate
     ```
     * ���гɹ��󣬻���������䣺
       ```html
        Operations to perform:
          Synchronize unmigrated apps: messages, staticfiles
          Apply all migrations: booktest, admin, auth, sessions, contenttypes
        Synchronizing apps without migrations:
          Creating tables...
            Running deferred SQL...
          Installing custom SQL...
        Running migrations:
          Rendering model states... DONE
          Applying contenttypes.0001_initial... OK
          Applying auth.0001_initial... OK
          Applying admin.0001_initial... OK
          Applying contenttypes.0002_remove_content_type_name... OK
          Applying auth.0002_alter_permission_name_max_length... OK
          Applying auth.0003_alter_user_email_max_length... OK
          Applying auth.0004_alter_user_username_opts... OK
          Applying auth.0005_alter_user_last_login_null... OK
          Applying auth.0006_require_contenttypes_0002... OK
          Applying booktest.0001_initial... OK
          Applying sessions.0001_initial... OK
       ```
  
### �ֶ�����
```
 class DemoA(models.Model):
   title=models.CharField(max_length=20)
   ...
```
* AutoField��һ������ʵ��ID�Զ�������IntegerField��ͨ����ָ��
  * �����ָ����һ�������ֶν��Զ���ӵ�ģ����
* BooleanField��true/false �ֶΣ����ֶε�Ĭ�ϱ�������CheckboxInput
* NullBooleanField��֧��null��true��false����ֵ
* CharField(max_length=�ַ�����)���ַ�����Ĭ�ϵı���ʽ�� TextInput
* TextField�����ı��ֶΣ�һ�㳬��4000ʹ�ã�Ĭ�ϵı��ؼ���Textarea
* IntegerField������
* DecimalField(max_digits=None, decimal_places=None)��ʹ��python��Decimalʵ����ʾ��ʮ���Ƹ�����
    * DecimalField.max_digits��λ������
    * DecimalField.decimal_places��С����������λ��
* FloatField����Python��floatʵ������ʾ�ĸ�����
* DateField[auto_now=False, auto_now_add=False])��ʹ��Python��datetime.dateʵ����ʾ������
    * ����DateField.auto_now��ÿ�α������ʱ���Զ����ø��ֶ�Ϊ��ǰʱ�䣬����"���һ���޸�"��ʱ�����������ʹ�õ�ǰ���ڣ�Ĭ��Ϊfalse
    * ����DateField.auto_now_add���������һ�α�����ʱ�Զ����õ�ǰʱ�䣬���ڴ�����ʱ�����������ʹ�õ�ǰ���ڣ�Ĭ��Ϊfalse
    * ���ֶ�Ĭ�϶�Ӧ�ı��ؼ���һ��TextInput. �ڹ���Ավ�������һ��JavaScriptд�������ؼ�����һ����Today"�Ŀ�ݰ�ť��������һ�������invalid_date������Ϣ��
    * auto_now_add, auto_now, and default ��Щ�������໥�ų�ģ�����֮����κ���Ͻ��ᷢ������Ľ��
* TimeField��ʹ��Python��datetime.timeʵ����ʾ��ʱ�䣬����ͬDateField
* DateTimeField��ʹ��Python��datetime.datetimeʵ����ʾ�����ں�ʱ�䣬����ͬDateField
* FileField��һ���ϴ��ļ����ֶ�
* ImageField���̳���FileField���������Ժͷ����������ϴ��Ķ������У�飬ȷ�����Ǹ���Ч��image    

### ����
1. ����Python shellȥ��֤�����Ƿ񴴽��ɹ�
   * ע�⣺������Ҫʹ�������������,����������ƽʱ����̨����python����
   ```html
     python manage.py shell
   ```
2. �����
   ```html
    from booktest.models import *
    from datetime import datetime
 
   ```  
3. ��ѯ����
* �½�ͼ����Ϣ
   ```html
    In [2]: b=BookInfo()

    In [3]: b.btitle='abc'

    In [4]: from datetime import datetime

    In [5]: b.bpub_date=datetime(year=1990,month=1,day=10)

    In [6]: b.save()
   ```    
4. ��ѯ���е�ͼ����Ϣ
   ```html
    BookInfo.objects.all()
   ``` 
   * ������һ�������������Ҫ����ֵ����Ҫ��ģ���ļ������һ������
     ```html
        def __str__(self):
             return self.btitle
     ```  
     * ע��������ӷ���������Ǩ�ƣ���ΪǨ�Ƶ������ݽṹ������ķ���ֻ�Ƕ����ݽ��в�����ֻ�����½���python shell���ܹ���Ч
       ```html
         from booktest.models import *
         BookInfo.objects.all()  # ����ֵ��[<BookInfo: abc>]
       ```
* ��ѯָ����ͼ����Ϣ
  ```html
   b=BookInfo.objects.get(pk=1) # <BookInfo: abc>
   b=BookInfo.objects.get(btitle='abc') # <BookInfo: abc>
  ``` 
  * pk��primary key��������д
* ��������Լ�ֵ
  ```html
   b
   b.btitle
   b.bpub_date
  ```    
* �޸�ֵ
  ```html
   b.btitle='zhangsan'
   b.save()
 
  ```  
  * b.save()�Ż���޸ĺ��ֵͬ�������ݿ�����ȥ������ر�shell���´�����ԭ����ֵ
  
* ɾ��ʵ������
  ```html
   b.delete()
  ```
* ����ʵ������
  ```html
   b2=BookInfo()
  ```  
  