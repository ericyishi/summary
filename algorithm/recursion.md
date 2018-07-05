# �ݹ�
### ����
* ���һ���������ڲ���������������������ǵݹ麯��

### һ��д��
* fact(n)���Ա�ʾΪn*fact(n-1),����Ϊ1��ʱ����Ҫ��������
```
 def fact(n):
    if n==1:
	  return 1
	return n*fact(n-1)  
```
```
 def sum_cycle(n):
    '''
    1 to n,The sum function
    '''
    sum = 0
    for i in range(1,n + 1): #rangeȡֵ��Χ�����ǿ�����
        sum *= i
    return sum
```
* ��������д������ʵ���˹��ܣ����ǵ���һ��д����ֵ��Ļ����ǻ�ջ�����(����ֵΪ1000��ʱ��)
* ����������ͨ��ջ��stack���������ݽṹʵ�ֵģ�ÿ������һ���������ã�ջ�ͻ��һ��ջ֡��ÿ���������أ�ջ�ͻ��һ��ջ֡������ջ�Ĵ�С�������޵ģ����ԣ��ݹ���õĴ������࣬�ᵼ��ջ�����
```
 RuntimeError: maximum recursion depth exceeded
```
### �Ż�д��
* ����ݹ����ջ����ķ�����ͨ��β�ݹ��Ż�����ʵ��β�ݹ��ѭ����Ч����һ���ģ����ԣ���ѭ��������һ�������β�ݹ麯��Ҳ�ǿ��Եġ�
* β�ݹ���ָ���ں������ص�ʱ�򣬵������������ң�return��䲻�ܰ������ʽ�����������������߽������Ϳ��԰�β�ݹ����Ż���ʹ�ݹ鱾�����۵��ö��ٴΣ���ֻռ��һ��ջ֡���������ջ����������
```
 def fact(n):
    return fact_iter(n, 1)

 def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)
```
* return fact_iter(num - 1, num * product)�����صݹ麯������num - 1��num * product�ں�������ǰ�ͻᱻ���㣬��Ӱ�캯������

### Ӧ�ã�쳲����к���
1. ��ͨд����
```
 # �ݹ�
def Fib(n):
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return Fib(n - 1) + Fib(n - 2)
```	

2. �Ż�д����ʹ��yield��
```
 def Fib_Yield(n):
    a, b = 0, 1
    while n > 0:
        yield b
        a, b = b, a + b
        n -= 1


def Fib(n):
    # return [f for i, f in enumerate(Fib_Yield(n))]
    return list(Fib_Yield(n))
	
print(Fib(10))	
```