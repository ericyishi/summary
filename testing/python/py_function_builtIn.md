# ���ú���
* python���õĺ�������������
#### range()����
#### ����
* ������forѭ��һ��ʹ��
* �����������б�
#### �÷�
```
 range(start,stop,step)
 # stop�ǿ�����
```
1. ���ص��Ƕ���type(range(10)),�õ�<class 'range'>��������ʹ����������list֮�������������Ҫǿת
```
 a=range(3)
 type(a)#<class 'range'>
 lis=list(range(10))
```
2. ��ѭ������ʹ��
```
for i in range(3):
    print(i,end=" ") #0 1 2

```
### map()����
#### ����
* map()�� python ���õĸ߽׺���
* ������һ������ f ��һ�� list����ͨ���Ѻ��� f ���������� list ��ÿ��Ԫ���ϣ��õ�һ���µ�object������
```
def mymap(func,seq):
    mapped_seq=[]
    for item in seq:
        mapped_seq.append(func(item))
    return mapped_seq    

```
*python2�����б�Python3���ص������������Ҫlist���󣬻���Ҫǿ��ת����
```
 # ������ĸ��д
def normalize(name):
    l=name[0].upper()
    l=l+name[1:].lower()
    return l
 
# ����:
L1 = ['adam', 'LISA', 'barT']
L2 = list(map(normalize, L1))
print(L2)


```
### reduce()����
