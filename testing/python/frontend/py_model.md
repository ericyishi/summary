# ģ��

### ��������
1. �������⻷��
2. ��װdjango
3. ������Ŀ
4. ����Ӧ��
5. ��models.py�ж���ģ����
   1. ��models.py�ж���ģ���࣬Ҫ��̳���models.Model
   2. ��Ӧ�ü���settings.py�ļ���installed_app��
   3. ����Ǩ���ļ�
   4. ִ��Ǩ�����ɱ�
   5. ʹ��ģ�������crud����
6. ������ͼ
7. ����url
8. ����ģ��

### ����ģ��
* ��ģ���ж������ԣ������ɱ��е��ֶ�
* django�������Ե�����ȷ��������Ϣ��
    * ��ǰѡ������ݿ�֧���ֶε�����
    * ��Ⱦ�����ʱʹ�õ�Ĭ��html�ؼ�
    * �ڹ���վ������޶ȵ���֤
* django��Ϊ�������Զ������������У�ÿ��ģ��ֻ����һ�������У����ʹ��ѡ������ĳ����Ϊ�����к���django����������Ĭ�ϵ�������
* ������������
    * ������python�ı����ؼ���
    * ����django�Ĳ�ѯ��ʽ��������ʹ���������»���

### ��������
* ��������ʱ����Ҫ�ֶ�����
* �ֶ����ͱ�������django.db.models.fieldsĿ¼�£�Ϊ�˷���ʹ�ã������뵽django.db.models��
* ʹ�÷�ʽ
    * ����from django.db import models
    * ͨ��models.Field�����ֶ����͵Ķ��󣬸�ֵ������
* **������Ҫ���ݶ����߼�ɾ������������ɾ����ʵ�ַ����Ƕ���isDelete���ԣ�����ΪBooleanField��Ĭ��ֵΪFalse**

### �ֶ�����
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

### �ֶ�ѡ��
* ͨ���ֶ�ѡ�����ʵ�ֶ��ֶε�Լ��
* ���ֶζ���ʱͨ���ؼ��ֲ���ָ��
* null�����ΪTrue��Django ����ֵ��NULL �洢�����ݿ��У�Ĭ��ֵ�� False
* blank�����ΪTrue������ֶ�����Ϊ�հף�Ĭ��ֵ�� False
  * �Աȣ�null�����ݿⷶ��ĸ��blank�Ǳ���֤֤�����
* db_column���ֶε����ƣ����δָ������ʹ�����Ե�����
* db_index����ֵΪ True, ���ڱ��л�Ϊ���ֶδ�������
* default��Ĭ��ֵ
* primary_key����Ϊ True, ����ֶλ��Ϊģ�͵������ֶ�
* unique�����Ϊ True, ����ֶ��ڱ��б�����Ψһֵ

### ģ��֮��Ĺ�ϵ
* ��ϵ�����Ͱ�����
  * ForeignKey��һ�Զ࣬���ֶζ����ڶ�Ķ���
  * ManyToManyField����Զ࣬���ֶζ�����������
  * OneToOneField��һ��һ�����ֶζ���������һ����
* ����ά���ݹ�Ĺ�����ϵ��ʹ��'self'ָ����������Թ�����
* ��һ���ʶࣺ����.ģ����Сд_set
  ```html
   bookinfo.heroinfo_set
  ```

* ��һ����һ������.ģ����Сд
  ```html
   heroinfo.bookinfo
  ```

* ����id������.����_id
  ```html
   heroinfo.book_id
  ```
### Ԫѡ��
* ��ģ�����ж����ٶ���һ����Meta����������Ԫ��Ϣ 
* Ԫ��Ϣ�ܶ�������ݣ�
  1. db_table������Ǩ�ƺ�����ݱ����ƣ��Ƽ�ʹ��Сд��ĸ�����ݱ��Ĭ������Ϊ������Ŀ��_ģ�������ĸ�ʽ
     ```html
      class BookInfo(models.Model):
         btitle=models.CharField(max_length=20),
         bpub_date=models.DateTimeField(db_column='pub_date'),
         bread=models.IntegerField(default=0),
         bcommet=models.IntegerField(null=False),
         isDelete=models.BooleanField(default=False)
            class Meta:
                db_table='bookinfo'
     ``` 
  2. ordering�������Ĭ�������ֶΣ���ȡ������б�ʱʹ�ã��������Թ��ɵ��б�
     * ������������ݿ�Ŀ���
     * �ַ���ǰ��-��ʾ���򣬲���-��ʾ����'-id'
     ```html
      class BookInfo(models.Model):
         class Meta():
             ordering = ['id']  # id��������
     ```   
### ������
* objects���ǹ�����Manager���͵�ʵ���������������ݿ���н���
* ��������Django��ģ�ͽ������ݿ�Ĳ�ѯ�����Ľӿ�
* DjangoӦ�õ�ÿ��ģ�Ͷ�ӵ��**����һ��������**
  * ���ǳ���view��ȥʹ��
    ```html
     bookList=BookInfo.objects.all()
    ```  
  * ������ģ����ʱû��ָ������������Django��Ϊģ�����ṩһ����Ϊobjects�Ĺ�����

* Ҳ���Զ��������
  ```html
   class BookInfo(models.Model):
      books = models.Manager() #�Զ�����һ����books�Ķ���
  ```  
  * ��Ϊģ����ָ����������django����Ϊģ����������Ϊobjects��Ĭ�Ϲ�����
  * �Զ����������**��;**��Ҫ�������������
    1. �޸Ĺ��������ص�ԭʼ��ѯ������дget_queryset()����
       ```html
         class BookInfoManager(models.Manager): # ����дһ����
          def get_queryset(self):
               return super(BookInfoManager, self).get_queryset().filter(isDelete=False) # filter��ָ��ȡ��������������
         class BookInfo(models.Model):
          books = models.Manager() # ����Ĭ�ϵ�
          books2 = BookInfoManager() # �����������������Ĺ���������
       ```
       ```html
        BookInfo.books.all() # ��������
        BookInfo.books2.all() # ������Զ��������������˺������
       ```
    2. �������������Ӷ���ķ����������桰���������еķ�ʽ��

### ��������
* _init_�����Ѿ��ڻ���models.Model��ʹ�ã����Զ���ģ�����޷�ʹ������������ʽ������
* ����һ������һ���෽�������ܶ�����ͨ������ԭ������Ϊ��ʱû��ʵ������
  ```html
    class BookInfo(models.Model):
    btitle=models.CharField(max_length=20,default='')
    bpub_date=models.DateTimeField(db_column='pub_date',default='')
    bread=models.IntegerField(default=0)
    bcomment=models.IntegerField(default=0)
    isDelete=models.BooleanField(default=False)
    class Meta:
        db_table='bookinfo'
        ordering = ['bcomment']
    # ����������ʹ��__init__��������Ϊ�̳е�models.Model�����Ѿ�����
    @classmethod
    def create(cls,btitle,bpub_date,bread=0):
        b=BookInfo()
        b.btitle=btitle
        b.bpub_date=bpub_date
        b.bread=bread
        b.bcomment=0
        b.isDelete=False
        return b
  ```
  * ��֤
  ```html
   # ����ģ����
   from booktest.models import BookInfo
   # ����ʱ���
   from datetime import *
   # ����
   book=BookInfo.create("hello",datetime(1980,10,11),0);
   # ���棬����save()�����������ݿ⽻���������󱣴浽���ݿ���
   book.save()
  ```
* ���������Զ���Ĺ����������ӡ��Ƽ��ķ�����
  * ���ַ����������ֶ�����.save()������
  ```html
   class BookInfoManager(models.Manager): 
     def create(self,btitle,bpub_date,bread=0):
        b=BookInfo()
        b.btitle=btitle
        b.bpub_date=bpub_date
        b.bread=bread
        b.bcomment=0
        b.isDelete=False
        return b
   class BookInfo(models.Model):  
      book2= BookInfoManager() 
  ```
  * ����  
  ```html
   # ����ģ����
   from booktest.models import BookInfo
   # ����ʱ���
   from datetime import *
   # ���ù������ж���ķ���
   b=BookInfo.book2.create("world",datetime(1987,10,11),0)  
   
  ```
### ģ�Ͳ�ѯ
* ��ѯ����ʾ�����ݿ��л�ȡ�Ķ��󼯺�
* ��ѯ�����Ժ��������һ������������
* ���������������Ĳ������Ʋ�ѯ�Ľ��
* ��Sql�ĽǶȣ���ѯ����select���ȼۣ���������where��limit�Ӿ�  
#### ��ѯ��
* �ڹ������ϵ��ù����������᷵�ز�ѯ��
* ��ѯ������������ɸѡ�󷵻��µĲ�ѯ������˿���д��**��ʽ����**
  ```html
    filter(��1=ֵ1,��2=ֵ2)
    �ȼ���
    filter(��1=ֵ1).filter(��2=ֵ2)
  ```
* **����ִ��**��������ѯ����������κ����ݿ�ķ��ʣ�ֱ����������ʱ���Ż�������ݿ�
  * ���������ݿ������ݵ��龰�����������л�����if����
* ���ز�ѯ���ķ�������Ϊ������
  * all()
    * Ҳ�����±���������������Ƭ�����ǲ�֧�ָ���
    ```html
     BookInfo.objects.all()[0]
     BookInfo.objects.all()[0:5]
     BookInfo.objects.all()[0:5:2]
    ```
  * filter()
  * exclude()
  * order_by()
  * values()��һ�����󹹳�һ���ֵ䣬Ȼ�󹹳�һ���б��� 
  * ���������ص���ֵ�ķ���
    * get()�����ص������������Ķ���
      * ���δ�ҵ�������"ģ����.DoesNotExist"�쳣
      * ������������أ�������"ģ����.MultipleObjectsReturned"�쳣
  * count()�����ص�ǰ��ѯ����������
  * first()�����ص�һ������
  * last()���������һ������
  * exists()���жϲ�ѯ�����Ƿ������ݣ�������򷵻�True  

#### ����ִ��--��ѯ���Ļ���
* ���½��Ĳ�ѯ���У�����Ϊ�գ��״ζԲ�ѯ����ֵʱ���ᷢ�����ݿ��ѯ��django�Ὣ��ѯ�Ľ�����ڲ�ѯ���Ļ����У�����������Ľ�����������Բ�ѯ����ֵ�����û���Ľ��
  ```html
   querylist=Entry.objects.all() # �൱����ֻ��һ��sql���浽querylist
   print([e.title for e in querylist]) # �����ݿ��ѯ����
   print([e.title for e in querylist])  # ���ʱ��ػ�����querylist
  ```
* ����ִ�л���������
  1. 
  ```html
   print([e.title for e in Entry.objects.all()])
   print([e.title for e in Entry.objects.all()]) # ���ζ������ݿ������ѯ����
 
  ```  
  2. ���ּ����ݼ�����
  ```html
   querylist=Entry.objects.all()
   for i in querylist[0:10]# ��ѯ���ݿ⣬����ǰʮ�����ݻ���
   for i in querylist[0:10]# ��β�ѯ�Ƕ��Ļ���
   for i in querylist[11:20]# ��β�ѯ���ݿ⣬�����Ỻ��11~19��������
   querylist2=Entry.objects.all()
   for i in querylist # ������ȫ������
   for i in querylist[0:10] # ��ȡ����
   for i in querylist[11:20] # ��ȡ����
 
  ```
### �ֶβ�ѯ
* ʵ��sql��where������䣬��Ϊ����filter()��exclude()��get()�Ĳ���
* �﷨��**��������__�Ƚ������=ֵ**
  * ��ʾ�����»��ߣ�������������ƣ��Ҳ��ǱȽ�����
* ����**���**��ʹ�á�������_id����ʾ�����ԭʼֵ
  ```html
   class HeroInfo(models.Model):
    ...
    book=models.ForeignKey(BookInfo)
  ```
  ```html
    hero # ΪHeroInfo�Ķ���
    hero.book_id # z�������ܷ��ʵ���Ӧbook��id
  ```
* ת�壺like�����ʹ����%�룬ƥ�������е�%�룬�ڹ�������ֱ��д�����磺filter(title__contains="%")=>where title like '%\%%'����ʾ���ұ����а���%  

#### �Ƚ����������
* exact����ʾ�еȣ���Сд���У����û��д�� �Ƚ������������ʾΪexact
```
 filter(isDelete=False)
 # ��ͬ��
 filter(isDelete__exact=False)
```
* contains���Ƿ��������Сд����
```
 exclude(btitle__contains='��')
```
* startswith��endswith����value��ͷ���β����Сд����
* exclude(btitle__endswith='��')
* isnull��isnotnull���Ƿ�Ϊnull
```
 filter(btitle__isnull=False)
```
* ��ǰ��Ӹ�i��ʾ�����ִ�Сд����iexact��icontains��istarswith��iendswith
* in���Ƿ�����ڷ�Χ��
```html
 filter(pk__in=[1, 2, 3, 4, 5])
```
* gt��gte��lt��lte�����ڡ����ڵ��ڡ�С�ڡ�С�ڵ���
```
 filter(id__gt=3)
```

* year��month��day��week_day��hour��minute��second�������ڼ����͵����Խ�������
```html
 filter(bpub_date__year=1980)
 filter(bpub_date__gt=date(1980, 12, 31))
```

* �������ϵ�Ĳ�ѯ������join��ѯ
  * �﷨��**ģ������ <������> <�Ƚ�>**
  * ע������û��__<�Ƚ�>���֣���ʾ���ڣ����ͬinner join
  * �ɷ���ʹ�ã����ڹ���������ģ���ж�����ʹ��
    ```
     BookInfo.objects.all().filter(heroinfo__hcontent__contains='��')
    ```
* ��ѯ�Ŀ�ݷ�ʽ��pk��pk��ʾprimary key��Ĭ�ϵ�������id
  ``` 
   BookInfo.objects.all().filter(pk__lt=3)
  ```
### F����
* ������������ֵ�ıȽ�
  ```html
   list.filter(bread__gte=F('bcommet') * 2)
  ```
### Q����
* �����߼���
  ```html
   list.filter(Q(pk_ _lt=6) | Q(bcommet_ _gt=10))
  ```
  * �߼���ֱ����ʽ��ѯ����
  ```html
   list.filter(pk_ _lt=6).filter(bcommet_ _gt=10)
  ```
  
  