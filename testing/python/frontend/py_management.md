# վ�����
* վ���Ϊ�����ݷ������͡��������ʡ�������
* �����ݷ������Ĳ��ָ�����ӡ��޸ġ�ɾ�����ݣ������ظ������ӣ�Django����ݶ����ģ������ȫ�Զ������ɹ���ģ��

### ��������Ա
* ����һ������Ա�û�
  ```html
   python manage.py createsuperuser #����ʾ�����û��������䡢����
  ```
  ```html
   abc/abc@123.com/abc
  ```
* ������������ͨ����127.0.0.1:8000/admin�����ʣ��������洴�����û�����������ɵ�¼
* �������վ�㣬Ĭ�Ͽ��Զ�groups��users���й���

### ��¼�������
1. ������������
  ```html
   python manage.py runserver 
  ```
2. �������Աҳ�棬����ղŴ������û��������뼴�ɵ�¼����������
  ```html
   http://127.0.0.1:8000/admin/
  ```
   * �������վ�㣬Ĭ�Ͽ��Զ�groups��users���й���  
   
### �����ػ�
* ��Ŀ��settings.py�ļ����޸�
* �޸ĺ�����һ�·��񣬾�����Ч
  ```html
   LANGUAGE_CODE = 'zh-Hans' # ��Ϊ����

   TIME_ZONE = 'Asia/Shanghai' # ʱ����Ϊ�й��Ϻ�
  ``` 
### ��̨��������ģ��
* �����ǽ�ȥ��̨��û�����Ǵ���������ģ�ͣ�����Ҫע���һ��
* ��Ӧ��(booktest)/admin.py�ļ���ע��ģ��
  ```html
   from django.contrib import admin
   from .models import *
   admin.site.register(BookInfo)
   admin.site.register(HeroInfo)
 
  ```    

### ���ƺ�̨����
* Django�ṩ��admin.ModelAdmin��
* ֱ����admin.py�ļ��У�ͨ������ModelAdmin�����࣬������ģ����Admin�������ʾ��ʽ
  ```html
   class DecorationAdmin(admin.ModelAdmin):
    ...
  
   admin.site.register(ע����, DecorationAdmin) # ǰ��Ϊģ���࣬����Ϊһ��Ч��װ����
  ```
#### �ṩ�Ŀ��޸�ҳ������
##### �б�ҳ����
* list_display����ʾ�ֶΣ����Ե����ͷ��������
  * list_display = ['pk', 'btitle', 'bpub_date']
    ```html
      class BookInfoAdmin(admin.ModelAdmin):
         list_display=['id','btitle','bpub_date'] # �ں�̨ҳ���Ͼͻ���ʾid��btitle, bpub_date�����ֶ�
     
      admin.site.register(BookInfo,BookInfoAdmin)
    ```
* list_filter�������ֶΣ����˿��������Ҳ࣬�����ڷ���
  * list_filter = ['btitle']
* search_fields�������ֶ��������������������ϲ�
  * search_fields = ['btitle']
* list_per_page����ҳ����ҳ���������²�
  * list_per_page = 10
##### ��ӡ��޸�ҳ����
* fields�����Ե��Ⱥ�˳��
  * fields = ['bpub_date', 'btitle']
* fieldsets�����Է�����ʾ��������btitle��bpub_date�ֱ���Ϊһ�������ʾ
  * fieldsets = [
    ('basic',{'fields': ['btitle']}),
    ('more', {'fields': ['bpub_date']}),
    ]  

#### ��������
* ����֪��Book��Hero�Ĺ�ϵ��1�Զ࣬�����������ã����ǿ�����Hero�����Ӷ�Ӧ��Book��Ϣ���⣬������������Book�����Ӷ��Hero��Ϣ
* ��admin.py�н������ã���������
  1. ���������������Ϣ
     ```html
      class MoreHero(admin.StackedInline):   # ָ�����ڲ���ӵ���ʾ��ʽStackedInline
      model = HeroInfo  # ָ����������
      extra = 2  # ָ������
     ```
     * ����������Ƕ��ʾadmin.StackedInline�ķ�ʽ������һ�ֱ��չʾadmin.TabularInline
  2. �������װ�����Ͻ�����ϵ
     ```html
      class BookInfoAdmin(admin.ModelAdmin):  
        inlines = [MoreHero]
     ```
  3. ע���������װ����
     ```
      admin.site.register(BookInfo,BookInfoAdmin)
     ```   