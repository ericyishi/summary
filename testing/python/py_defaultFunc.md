# 内置函数
### 数学运算
1. max()/min()
   * 参数都为数值型，直接对数值中求取最大值/最小值
   * 参数(iterable, key, default)
     * 求迭代器的最大值，其中iterable 为迭代器
     * max会for i in … 遍历一遍这个迭代器，然后将迭代器的每一个返回值当做参数传给key=func 中的func(一般用lambda表达式定义)
     * 然后将func的执行结果传给key，然后以key为标准进行大小的判断。
     ```
      # demo1
      d1 = {'name': 'egon', 'price': 100}
      d2 = {'name': 'rdw', 'price': 666}
      d3 = {'name': 'zat', 'price': 1}
      l1 = [d1, d2, d3]
      a = max(l1, key=lambda x: x['name'])
      print(a)
      b = max(l1, key=lambda x: x['price'])
      print(b)

     ```
     ```
      a的返回值：{'name': 'zat', 'price': 1}

      b的返回值: {'name': 'rdw', 'price': 666}
     ```
     ```
      # demo2
      # 求得最大值，并返回对应的键
      # max(dict,key=dict.get)
     ```