# ��װ
### ��װ����
* ��ubuntuΪ��
1. ����ֱ��apt��װ
   ```html
    sudo apt-get install mongodb
   ```
2. ��װ�ú�ȷ��
   ```html
    mongodb -version # �а汾�����Ϊ��װ�ɹ���MongoDB shell version: 2.6.10
   ```
### mongod
* ����ˡ��˿�27017��
```html
 #�������룺mongod
```      
* ���ַ�ʽ������ռ��һ�����񴰿�,Ҳ���������淽ʽ����û�гɹ���
  ```html
   sudo service mongod start
  ```
* �鿴�Ƿ������� pgrep mongod -l #��ӡ��id���̾������
* �����ļ��ڣ� /etc/mongod.conf �������˿���Ϣ
### mongo
* �ͻ���
```html
#�������룺mongo
```
* Ĭ�Ͻ���test���ݿ�
```html
root@ubuntu:~# mongo
MongoDB shell version: 2.6.10
connecting to: test
>

```
* �鿴��ǰ���ݿ���,����:db
```html
> db
test

```
* �鿴���ݿ���Ϣ:db.stats()
```html
> db.stats()
{
        "db" : "test",
        "collections" : 0,
        "objects" : 0,
        "avgObjSize" : 0,
        "dataSize" : 0,
        "storageSize" : 0,
        "numExtents" : 0,
        "indexes" : 0,
        "indexSize" : 0,
        "fileSize" : 0,
        "dataFileVersion" : {

        },
        "ok" : 1
}

```  
* �˳�
```html
 ctrl+c����exit
```  

### GUI����
* robomongo
  * ��ѹ����binĿ¼���и�robomongo�ļ�����������
* windows����Ҳ�и�Robo 3T �Ĺ��߿���ʹ��

