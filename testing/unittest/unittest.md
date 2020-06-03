# unittest单元测试框架
*  unittest单元测试框架不仅可以适用于单元测试，还可以适用WEB自动化测试用例的开发与执行，该测试框架可组织执行测试用例，并且提供了丰富的断言方法，判断测试用例是否通过，最终生成测试结果
* 是python自带的一个单元测试模块
* 注意使用pycharm时候，如果代码是写在if \_\_name\_\_=="\_\_main\_\_"里面需要是通过命令来运行该文件

### 使用
```
 import unittest
```

### unittest模块下的属性
#### TestCase类
* 测试用例类，我们做单元测试时编写的测试用例就是继承TestCase类来实现具体的测试用例 
1. unittest.TestCase 所有测试用例类继承的基类
   ```
    import unittest
    class UserCase(unittest.TestCase):
    
        def testAddUser(self):
            print("add a user")
    
        def testDelUser(self):
            print("delete a user")

   ```
    * 每一个继承TestCase类的子类里面实现的具体的方法（默认以test开头的方法）都是一条用例
##### 断言
* TestCase类提供了一系列的断言，即结果比对的函数
    * assertEqual(a,b,[msg='测试失败时打印的信息']):断言a和b是否相等，相等则测试用例通过。

    * assertNotEqual(a,b,[msg='测试失败时打印的信息']):断言a和b是否相等，不相等则测试用例通过。

    * assertTrue(x，[msg='测试失败时打印的信息'])：断言x是否True，是True则测试用例通过。

    * assertFalse(x,[msg='测试失败时打印的信息'])：断言x是否False，是False则测试用例通过。

    * assertIs(a,b,[msg='测试失败时打印的信息']):断言a是否是b，是则测试用例通过。

    * assertNotIs(a,b,[msg='测试失败时打印的信息']):断言a是否是b，不是则测试用例通过。

    * assertIsNone(x,[msg='测试失败时打印的信息'])：断言x是否None，是None则测试用例通过。

    * assertIsNotNone(x,[msg='测试失败时打印的信息'])：断言x是否None，不是None则测试用例通过。

    * assertIn(a,b,[msg='测试失败时打印的信息'])：断言a是否在b中，在b中则测试用例通过。

    * assertNotIn(a,b,[msg='测试失败时打印的信息'])：断言a是否在b中，不在b中则测试用例通过。

    * assertIsInstance(a,b,[msg='测试失败时打印的信息'])：断言a是是b的一个实例，是则测试用例通过。

    * assertNotIsInstance(a,b,[msg='测试失败时打印的信息'])：断言a是是b的一个实例，不是则测试用例通过。
##### 装饰器
* unittest.skip() 装饰器，跳过用例
   * skip装饰器一共有四个
    1. @unittest.skip(reason) 无条件跳过用例，reason是说明原因
       ```
        @unittest.skip("暂时不测")
        def test_minus(self):
          self.assertEqual(self.cal.minus(1, 2), 5, 'test minus1 failed')
          self.assertEqual(self.cal.minus(3, 2), 1, 'test minus2 failed')
          print("test_minus pass")
       ```
       * 这样设置后，test_minus这个方法就会跳过

    2. @unittest.skipIf(condition, reason) condition为true的时候跳过
    3. @unittest.skipUnless(condition, reason) condition为False的时候跳过
       ```
        # 如果系统是linux则不执行该测试用例
        @unittest.skipUnless(sys.platform.startwith("linux"), "requires windows")
        def test_sample(self):
          pass
        
       ```
    4. @unittest.expectedFailure 无论执行结果是否失败，统一标记为失败
    
#### TestLoader类
* 用于把testcase加载到testsuite里面
* unittest自定义套件
   * .discover方法，可以自动根据规则加载测试用例至套件中
   * 当测试用例达到一定数量后，就需要考虑分文件分目录地划分用例，此时使用discover就能满足这个需求
     * discover(start_dir, pattern='test*.py',top_level_dir=None)
       1. 参数1：匹配查找路径
       2. 参数2：匹配规则,默认pattern='test*.py'
       3. 参数3：顶级路径，可以不用修改
     ```
        loader=unittest.TestLoader()
        test_dir =r'F:\PythonProject\test1'
        mysuite=loader.discover(test_dir)
        # 将F:\PythonProject\test1路径下的所有以test开头的py文件加入至套件mysuite中
     ```
#### TestSuite类
* 多个独立的测试用例（test case）或者多个独立的测试套件（test suite，可以理解为子套件）可以构成一个测试套件
* 如果希望按指定顺序执行，那么就要使用TestSuite.addTest

##### 建测试套件的方法
* 这几种方法最终都脱离不了通过TestSuite去创建测试集
1. 通过unittest.TestSuite()类直接构建，或者通过TestSuite实例的addTests、addTest方法构建
   ```buildoutcfg
    #使用unittest.TestSuite()类直接构建，或者通过TestSuite实例的addTests、addTest方法构建
    import unittest
    class UserCase(unittest.TestCase):
    
        def testAddUser(self):
            print("add a user")
    
        def testDelUser(self):
            print("delete a user")
    
    if __name__ == '__main__':
        # 直接传参创建
        suite = unittest.TestSuite(map(UserCase,['testAddUser','testDelUser']))
       
        # addTests方法创建
        suite2 = unittest.TestSuite()
        suite2.addTests(map(UserCase,['testAddUser','testDelUser']))
        # 也可以写成suite2.addTests(UserCase('testAddUser'),UserCase('testDelUser'))
        
        # 使用addTest方法，一个个创建
        suite3 = unittest.TestSuite()
        suite3.addTest(UserCase('testAddUser'))
        suite3.addTest(UserCase('testDelUser'))
        runner = unittest.TextTestRunner()
        runner.run(suite)
   ```
    * 执行顺序是按照添加的顺序执行的,unittest.main()则是按照ASCII码的顺序来执行以test开头的case
    
2. 通过unittest.TestLoader类的discover、loadTestsFromTestCase、loadTestsFromModule、loadTestsFromName、loadTestsFromNames这五个方法去构建
   ```buildoutcfg
     
    import unittest
    class UserCase(unittest.TestCase):
    
        def testAddUser(self):
            print("add a user")
    
        def testDelUser(self):
            print("delete a user")
    
    if __name__ == '__main__':
        module = __import__(__name__)
        suite = unittest.TestLoader().discover('.','unittest_user.py') #unittest_user.py
        suite2 = unittest.TestLoader().loadTestsFromTestCase(UserCase)
        suite3 = unittest.TestLoader().loadTestsFromModule(module)
        #loadTestsFromName、loadTestsFromNames暂时不举例了，参数类型较多，不便举例，可以自行阅读其代码
    
   ```
   ```buildoutcfg
      testcases1=unittest.TestLoader().loadTestsFromTestCase(测试用例类名)
      testcases2=unittest.TestLoader().loadTestsFromTestCase(测试用例类名)
      suite=unittest.TextSuite([testcases1,testcases2])
      unittest.TextTestRunner(verbosity=2).run(suite)
     
     # TestLoader类：测试用例加载器，返回一个测试用例集合
     # loadTestsFromTestCase类：根据给定的测试类，取其中的所有以test开头的测试方法，并返回一个测试集合。
     # TextSuite类：组装测试用例的实例，支持添加和删除用例，最后将传递给texttestrunner进行测试执行。
     # TextTestRunner类：测试用例执行类，其中Text表示以文本形式输出测试结果。
   ```

3. 通过unittest.makeSuite()、unittest.findTestCases()这两个方法去构建
   ```buildoutcfg
     import unittest
     class UserCase(unittest.TestCase):
     
         def testAddUser(self):
             print("add a user")
     
         def testDelUser(self):
             print("delete a user")
     
     if __name__ == '__main__':
         module = __import__(__name__)
         suite = unittest.makeSuite(UserCase,prefix='test')
         suite2 = unittest.findTestCases(module,prefix='test')
     
   ```

### TextTestRunner类
* 主要是用来执行测试用例的,其中的run(test)会执行TestSuite/TestCase中的run(result)方法
  ```buildoutcfg
   import unittest
   class UserCase(unittest.TestCase):
   
       def testAddUser(self):
           print("add a user11")
   
       def testDelUser(self):
           print("delete a user")
   
   if __name__ == '__main__':
       runner = unittest.TextTestRunner()
       suite = unittest.TestSuite(map(UserCase,['testAddUser','testDelUser']))
       case = UserCase('testAddUser')
   
       runner.run(suite)
       runner.run(case)
  ```
#### verbosity 参数
* 在unittest.main()或者unittest.TextTestRunner()中加 verbosity 参数可以控制输出的错误报告的详细程度
* 默认是 1，结果仅以点(.)表示执行成功的用例数
* 如果设为 0，则不输出每一用例的执行结果，即没有上面的结果中的第1行；
* 如果设为 2，则输出详细的执行结果   
  ```buildoutcfg
    unittest.main(verbosity=2)
  ```

#### 输出报告
1. 控制台内容输入到文本
* 输出测试报告text到文件
  ```buildoutcfg
    #创建一个文件，以写的方式打开
    fs = open("test_result.txt", "w")
    runner = unittest.TextTestRunner(fs)
    runner.run(s)
  ```
2. 美化报告
* 生成HTMLTextRunner报告
##### 使用步骤：
  1. 下载地址
  ```
   http://tungwaiyip.info/software/HTMLTestRunner.html
  ```
  * 这个是原版，但是很久没有更新了，只支持python2
  * python3的修改版网上可以找
  2. 保存路径
  ```
   放在python的lib文件夹下
  ```
  * 也可以放在项目文件下，导包进入即可
  3. 检验
  ```
   #python shell环境下
   >import HTMLTestRunner
  ```
  * 如果没有报错，则说明添加成功
  
  4. 使用。在需要运行的测试用例，添加
  * 首先需要将HTMLTestRunner导入进来
  ```
      import HTMLTestRunner
      import unittest
      from TestCalc import TestCalc
      
      if __name__ == '__main__':
      suite = unittest.TestSuite()
      tests = [TestCalc("test_add"), TestCalc("test_minus")]
      suite.addTests(tests) # 加入需要运行的测试用例
      with open('testresult.html', 'wb') as f:
      
          runner = HTMLTestRunner.HTMLTestRunner(
          stream=f,
          title='jisuanqi',
          description='jisuanqi'
          )
          runner.run(suite)  # 运行测试用例
  ```
  * 运行后，就会在当前文件夹下生成了一个testresult.html文件
  * 运行流程：
    1. 通过以open()方法以二进制写模式打开当前的目录下的testresult.html文件，如果没有，则动态创建。
    2. 接着调用HTMLTestRunner下的HTMLTestRunner类。
       * stream指定测试报告文件
       * title用于定义测试报告的标题
       * description用于定义测试报告的副标题
    3. 通过HTMLTestRunner的run方法来运行测试套件中所有组装的测试用例。
    4. 使用with的方式可以不必再手动close()
  ##### 优化
  1. HTMLTestRunner可以直接读取doc string类型的注释，所有我们可以给测试类或方法添加即可让报告中显示更具有语义化
  2. 将每次运行后的测试报告加上当前时间，避免被覆盖
     ```
      test_dir="./report"
      currentTime=time.strftime("%Y-%m-%d %H-%M-%S")
      filename=test_dir+'/'+currentTime+'result.html'
  
     ```
  ##### 查找最新的测试报告
  ```
  import os
  # 查找的路径
  result_dir=r'./report/'
  # 获取路径下的所有文件
  lists=os.listdir(result_dir)
  # 重新按时间对目录下的文件进行排序
  # #sort按key的关键字进行升序排序，lambda的入参fn为lists列表的元素，获取文件的最后修改时间，所以最终以文件时间从小到大排序
  lists.sort(key=lambda fn:os.path.getmtime(result_dir+"\\"+fn))
  print('最近文件名：'+lists[-1])
  file=os.path.join(result_dir,lists[-1])
  print('最近文件路径：',file)
  ```
  * 使用了一个lambda函数，相当于
  ```
  def key(fn):
      return os.path.getmtime(test_dir+'\\'+fn)
  ```

#### 特殊的方法
1. setUp():用于测试用例执行前的**初始化**工作，每条测试用例都会执行一次。
   * 如测试用例中需要访问数据库，可以在setUp中建立数据库连接并进行初始化
   * 如测试用例需要登录web，可以先实例化浏览器
   * 每执行一个测试用例，就会输出运行一次初始化方法
2. tearDown() 用于测试用例执行之后的善后工作。析构方法
   * 如关闭数据库连接。关闭浏览器
   * 每执行一个测试用例，就会运行一次析构方法
   * teardown的过程很重要，因为要为下一个testcase留下一个干净的环境
3. setUpClass() 所有测试方法执行前运行一次
   * 必须使用@classmehtod装饰器进行装饰
   * setUp()函数前执行
   * 整个测试过程只执行一次
   ```
    @classmehtod
    setUpClass(cls):
     print("-----setUpClass---")
   ```  
4. tearDownClass() 所有测试方法之后运行一次
   * 必须使用@classmehtod装饰器进行装饰
   * tearDown()函数后执行
   * 整个测试过程只执行一次   
   ```buildoutcfg
    import unittest
    class Example(unittest.TestCase):
        @classmethod
        def setUpClass(cls):
            print("setUpClass")
    
        def setUp(self):
            print("setUp")
    
        def test1(self):
            print("test1")
    
        def test2(self):
            print("test2")
    
        def tearDown(self):
            print("tearDown")
    
        @classmethod
        def tearDownClass(cls):
            print("tearDownClass")
    if __name__=="__main__":
        unittest.main()
   ```
   ```buildoutcfg
    setUpClass
    setUp
    test1
    tearDown
    .setUp
    test2
    tearDown
    .tearDownClass

   ```
   
   




### PYCHARM运行
1. 如果想当前的脚本上所有的用例一起执行，只需把鼠标放到if __name__ == "__main__":这句话的后面或者下方就行了，右键 run 'Unittests in xxx'
2. 想运行某个测试用例，鼠标放到该测试用例区域右键，就会显示：Run 'Unittest xxx'


### parameterized参数化
* 因为unittest没有数据驱动，所以这个也得单独安装parameterized
```html
     @parameterized.expand([
        ("user_null", '', "123", "请输入帐号"),
        ("pawd_null", "user", '', "请输入密码"),
        ("login_error", "error", "error", "帐号或密码错误"),
        ("login_success", "admin", "admin123456", "admin你好"),
    ])
    def test_login(self, name, username, password, assert_text):
        self.user_login(username, password)
        if name == "login_success":
            sleep(2)
            tips = self.driver.find_element_by_id("user").text
            self.assertEqual(tips, assert_text)
        else:
            tips = self.driver.find_element_by_id("tips").text
            self.assertEqual(tips, assert_text)
```
