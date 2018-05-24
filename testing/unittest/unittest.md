# unittest单元测试框架
### 使用
```
 import unittest
```

### unittest模块下的属性
1. unittest.TestCase 所有测试用例类继承的基类
   ```
    class TestCalculator(unittest.TestCase)
   ```
2. unittest.main() 使用它可以方便的将一个单元测试模块变为可直接运行的测试脚本
   * main()方法使用TestLoader类来搜索所有包含在该模块中**以“test”命名开头**的测试方法，并自动执行他们。
   * 执行方法的默认顺序是：根据ASCII码的顺序加载测试用例，数字与字母的顺序为：0-9，A-Z，a-z。
   ```
    if __name__=='__main__':
        unittest.main()
   ```
3. unittest.TestSuite() 用来创建测试套件的

4. unittest.TextTextRunner(套件名) 运行套件的类

5. unittest.defaultTestLoader() 自定义套件
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

6 unittest.skip() 装饰器，跳过用例
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
    4. @unittest.expectedFailure 断言的时候跳过

### TestCase类的属性
1. setUp():用于测试用例执行前的**初始化**工作。
   * 如测试用例中需要访问数据库，可以在setUp中建立数据库连接并进行初始化
   * 如测试用例需要登录web，可以先实例化浏览器
   * 每执行一个测试用例，就会输出运行一次初始化方法
2. tearDown() 用于测试用例执行之后的善后工作。析构方法
   * 如关闭数据库连接。关闭浏览器
   * 每执行一个测试用例，就会运行一次析构方法

3. assert*()断言
    * assertEqual(a,b，[msg='测试失败时打印的信息']):断言a和b是否相等，相等则测试用例通过。

    * assertNotEqual(a,b，[msg='测试失败时打印的信息']):断言a和b是否相等，不相等则测试用例通过。

    * assertTrue(x，[msg='测试失败时打印的信息'])：断言x是否True，是True则测试用例通过。

    * assertFalse(x，[msg='测试失败时打印的信息'])：断言x是否False，是False则测试用例通过。

    * assertIs(a,b，[msg='测试失败时打印的信息']):断言a是否是b，是则测试用例通过。

    * assertNotIs(a,b，[msg='测试失败时打印的信息']):断言a是否是b，不是则测试用例通过。

    * assertIsNone(x，[msg='测试失败时打印的信息'])：断言x是否None，是None则测试用例通过。

    * assertIsNotNone(x，[msg='测试失败时打印的信息'])：断言x是否None，不是None则测试用例通过。

    * assertIn(a,b，[msg='测试失败时打印的信息'])：断言a是否在b中，在b中则测试用例通过。

    * assertNotIn(a,b，[msg='测试失败时打印的信息'])：断言a是否在b中，不在b中则测试用例通过。

    * assertIsInstance(a,b，[msg='测试失败时打印的信息'])：断言a是是b的一个实例，是则测试用例通过。

    * assertNotIsInstance(a,b，[msg='测试失败时打印的信息'])：断言a是是b的一个实例，不是则测试用例通过。

4. 定义测试用例，以“test_”开头命名的方法

### TestSuite类的属性
1. addTest() 添加套件
   ```
    mysuit = unittest.TestSuite()
    mysuit.addTest(TestCalculator("test_add"))
   ```
2. run()方法来运行suite所组装的测试用例
   ```
    runner=unittest.TextTestRunner()
    runner.run(mysuit)
   ```
3. addTests() 添加测试用例集合
   ```
    mysuit.addTests(unittest.TestLoader().loadTestsFromTestCase(测试用例类名))
   ```
   * 这种方式可以把所有的测试用例添加进测试集中

### 生成HTMLTextRunner报告
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
3. 使用。在需要运行的测试用例，添加
```
 import HTMLTestRunner
import unittest
from TestCalc import TestCalc

if __name__ == '__main__':
suite = unittest.TestSuite()
tests = [TestCalc("test_add"), TestCalc("test_minus")]
suite.addTests(tests)
with open('testresult.html', 'wb') as f:

    runner = HTMLTestRunner.HTMLTestRunner(
    stream=f,
    title='jisuanqi',
    description='jisuanqi'
    )
    runner.run(suite)
```
* 运行后，就会在当前文件夹下生成了一个testresult.html文件

### 运行
1. 如果想当前的脚本上所有的用例一起执行，只需把鼠标放到if __name__ == "__main__":这句话的后面或者下方就行了，右键 run 'Unittests in xxx'
2. 想运行某个测试用例，鼠标放到该测试用例区域右键，就会显示：Run 'Unittest xxx'