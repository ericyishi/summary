# randomģ��
### ����
* randomģ�����һЩ������ķ�����
### ʹ��
```
import random
dir(random) # ���ܿ������ģ���������ķ���
```
### ���÷���
1. random()
* ����**һ��**0��1֮������������������0��������1��Ҳ����[0.0, 1.0)
```
 random.random()
```
2. randint()
* ���ɷ�Χ�ڵ�**һ��**���������߶��Ǳ�����
```
random.randint(1,10) # ����1��10������1��10����һ�������������int�ͣ� 
```
3. choice(seq)
* �����������ѡȡһ��Ԫ�ء�seq��Ҫ��һ�����У�����list��Ԫ�顢�ַ�����
```
random.choice(seq)
 
random.choice([1, 2, 3, 5, 8, 13]) #list
 
random.choice('hello') #�ַ���
 
random.choice(['hello', 'world']) #�ַ�����ɵ�list
 
random.choice((1, 2, 3)) #Ԫ��
```
4. sample(seq,n)
* �����������ѡȡn��Ԫ��,������**�б�**
* sample���ı�ԭ������
```
 random.sample((1, 2, 3),2) #[3,1]
 random.sample('abcdefghijklmnopqrstuvwxyz',2) #['x','f']
 
```
5. random.shuffle(x)
* ������x�е�Ԫ��˳����ҡ�
* shuffleֱ�Ӹı�ԭ�е����С�
* ��֧���ַ�����Ԫ��
```
 a=[1,2,3,4,5]
 random.shuffle(a) # û�з���ֵ�����Բ�����print(random.shuffle(a))�������ӡ����
 print(a)
```