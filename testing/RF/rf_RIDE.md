# RIDE
* robot IDE，编写 Robot Framework 的标准编辑器)，只支持python2的环境
### 创建测试项目
* File--New Project
* 测试项目可以目录或文件存储
* 格式可以用TXT， Robot或TSV，HTML格式
  * 建议选择目录和TXT，这样便于管理
  
### 创建测试套件
* 把一组相关的测试称为一个测试套件（test suite）  
* 右击“项目名”--new suite
* 测试套件可以选择是文件还是目录,建议使用文件

### 创建测试用例
* 右击“套件名”--new testcase

### 引入第三方库Library
* RIDE中经验证要在suite一层导入才有用，写在Project层是没有用的
* 导入库名注意大小写，例如：Selnium2Library，写错了是红色的字体颜色。

### 添加资源Resource
* 资源提供定制公用关键词的能力
* 如果resource使用第三方库，同样需要使用Library导入第三方库
* 通常是在resource下面新增自定义关键字“New User Keyword”

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
    
  * 
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




