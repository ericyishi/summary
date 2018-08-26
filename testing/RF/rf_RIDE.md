# RIDE
* robot IDE，编写 Robot Framework 的标准编辑器)，只支持python2的环境
### 创建测试项目
* File--New Project
* 测试项目Type可以目录（**建议使用Directory，否则无法新建suite**）或文件存储
* 格式可以用TXT， Robot或TSV，HTML格式
  * 建议选择Robot，这样便于管理
* setting设置项
  1. Documentation(说明文档)
     * 加粗使用:*内容*
     * 斜体使用下划线：_内容_	 
  
### 创建测试套件【用于存放测试用例】
* 把一组相关的测试称为一个测试套件（test suite）  
* 右击“项目名”--new suite
* 测试套件Type**建议使用文件File**，因为测试用例只能放在File类型下

### 创建测试用例
* 右击“套件名”--new testcase
* setting设置项
  1. Test Timeout:测试用例的超时时间，如果超过就结束该用例的执行
  
### 引入第三方库Library
* RIDE中经验证要在suite一层导入才有用，写在Project层是没有用的
* 导入库名注意大小写，例如：Selnium2Library，写错了是红色的字体颜色。
* Library对话框下的四个项：
  1. Name
  2. Args
  3. Alias
  4. Comment

### 添加资源Resource【用于存放关键字】
* 建议是在project下右击鼠标新建resource，没有被引用的的时候，是灰色状态。
  * 右键“Find Usages”可以关键字在哪些地方被引用了
* 再在suite中resource去引用刚才新建的resource，此时刚才resource文件也由灰色变为有彩色
* 如果resource使用第三方库，同样需要使用Library导入第三方库
* 通常是在resource下面新增自定义关键字“New User Keyword”

### External Resource外部资源
* 指不在project文件夹内的资源文件
* 点击鼠标右键选择“Add Resource”即可添加，这个步骤只是添加并没有引用。引用依然需要在resource上面来引入   

### 关键字
* 关键字支持中文
* 正常引入关键字会显示蓝色，黑色是没有正常引入通常是因为没有导入库，或者resource
* 关键字后面的红色代表需要输入参数
* 常用关键字：
  * Log 就是“print” 输出后面一个框的内容
  * 设置变量Set variable

|  ${a} |Set variable|hello world|
|---|---|---|
|  log |${a} |-|

  ```
   输出结果：hello world
  ```

### 变量与常量
#### 变量
* 两者之间可以相互转换
1. Scalar【单值变量】
   * 使用$符号表示：${a}
   * 字符串、数值等
   * 常用方法
      1. 变量赋值
		  1. Set赋值
			 
			   |  ${val2} |Set variable|abc|
			   |---|---|---|
			   |  ${val3} |Set variable If |'${val2}'=='abc'| yes|no|
			   * 如果是比较字符串也需要将变量名括号起来
			 
			 
			   |  ${val2} |Set variable|123|
			   |---|---|---|
			   |  ${val3} |Set variable If |${val2}==123| yes|no|
			 
		  2. Get取值
			 
			   |  ${val2} |Get Length|123|
			   |---|---|---|
			   |  ${val3} |Get Time|
			 		
		  3. 命令行参数赋值
		     * 通过Run界面上的Arguments里面加上一行
               ```
			    -v 变量名:变量值
				-v val2:123
			   ```						   
		       * 经试验，如果变量已经赋值，通过变量的方式应该不起作用（存疑）
	  2. 变量的使用
         1. Run Keyword If
		    * 如果判断条件成立，那就执行后面的语句
			
               |  Run Keyword If |'${val2}'=='123'|log|hello|
			   |---|---|---|---|
			   
			   * 如果变量${val2}等于123的时候，那么就执行后面的log打印输出hello的语句，如果不等于则不执行后者
         2. 字符串与变量的拼接
             * 如果想把变量作为一个字符串的一部分，直接写就行。不用使用“+”
			 
               | ${val1}|Set Variable|123|
			   |---|---|---|   
			   |log|0${val1}456|
		 3. 直接使用字符串下标或切片取值
               |${val1}|Set Variable|12345|
			   |---|---|---|
               |log|${val1[2]}|
			   |---|---|---|
               | log|${val1[0:2]}|	 
			   
         	  
2. List 【多值变量】 
   * 使用@符号表示：@{b}
   * 对象
3. Dict 【字典对象】
   * 使用&{c}
   * 字典
#### 常量
* 主要是指环境变量、数值变量、特殊字符常量、系统保留变量
  1. 环境变量%
     
	   |  log |%{JAVAHOME}|
	   |---|---|
	   
	 
  2. 数值常量
     * RIDE中所有的字符都被当作字符串，包括变量的值是数值【个人理解不是】
	 * 如果要让其为数值类型，要用数值常量
     
	  |  ${shuzhi} |Set variable|${2.6}|2.6|
	  |---|---|---|---|
    
     
  3. 特殊字符常量
     ```
	  ${/} ${:} ${EMPTY} ${False} ${None}等
	 ```  
   
### 打印
* log：适用于scalar变量
* log many：用于输出List、dict变量
   
### 运行测试用例
* run--Start
* 可以给测试用例加tag，使指定这个tag运行或者不运行

### 测试日志与测试报告
* 测试日志按树形组织，可自动提供错误步骤的屏幕截图
* 测试报告底色绿色代表成功，红色代表失败

### 快捷键
1. F5 搜索关键字
2. ctrl+alt+空格 提示关键字
3. ctrl+鼠标指向关键字 提示该关键字的用法以及参数




