# DDT框架
* python 的unittest 没有自带数据驱动功能。
* 所以如果使用unittest，同时又想使用数据驱动，那么就可以使用DDT【Data-Driven Tests】来完成。
  ```
    pip install ddt
  ```
### 装饰方法
1. dd.ddt：
   * 装饰类，也就是继承自TestCase的类。

2. ddt.data：
   * 装饰测试方法。参数是一系列的值。

3. ddt.file_data：
   * 装饰测试方法。参数是文件名。文件可以是json 或者 yaml类型。
   * 注意，如果文件以”.yml”或者”.yaml”结尾，ddt会作为yaml类型处理，其他所有文件都会作为json文件处理。
   * 如果文件中是列表，每个列表的值会作为测试用例参数，同时作为测试用例方法名后缀显示。
   * 如果文件中是字典，字典的key会作为测试用例方法的后缀显示，字典的值会作为测试用例参数。
   
4. ddt.unpack：
   * 传递的是复杂的数据结构时使用。比如使用元组或者列表，添加unpack之后，ddt会自动把元组或者列表对应到多个参数上。字典也可以这样处理。
### 使用
* ①在头部导入ddt
* ②次在测试类前声明使用ddt（@ddt.ddt）
* ③第三步，在测试方法前，使用@ddt.data和@unpack进行修饰。而测试数据，在data中进行填加

### 调用
1. 传入一个参数
   ```
    import unittest  
    from ddt import ddt,data,unpack  
     
    @ddt  
    class MyTestCase1(unittest.TestCase):  
        @data(1,2,3)  
        def test_normal(self,value):  
            print(value)  
            self.assertEqual(value,2)  
    if __name__=='__main__':  
         unittest.main()  
   ```
2. 传入元组、字典、列表等复杂结构数据，@data 标签结合 @unpack使用
   ```
    import unittest  
    from ddt import ddt,data,unpack  
     
    @ddt  
    class MyTestCase2(unittest.TestCase):  
        @data((1,2),(2,3))  
        @unpack  
        def test_tuple(self,value1,value2):  
            print(value1,value2)  
            self.assertEqual(value2,value1+1)  
        @data([1,2],[2,3])  
        @unpack  
        def test_list(self,value1,value2):  
            print(value1,value2)  
            self.assertEqual(value2,value1+1)  
        @data({'value1':1,'value2':2},{'value1':1,'value2':2})  
        @unpack  
        def test_dict(self,value1,value2):  
            print(value1,value2)  
            self.assertEqual(value2,value1+1)  
      
    if __name__=='__main__':  
        unittest.main()  
   ```
3. 以文件作为数据传递@file_data
   ```
    import unittest  
    from ddt import ddt,data,unpack,file_data  
     
    @ddt  
    class MyTestCase3(unittest.TestCase):  
        @file_data('E:\\a.json')  
        def test_file(self,value):  
            print(value)  
      
    if __name__=='__main__':  
        unittest.main()  
   ```
   