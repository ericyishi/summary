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
     ```html
      class BookInfo(models.Model):
         class Meta():
             ordering = ['id']
     ```   
  3. 