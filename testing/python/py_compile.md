# python 编译
### 概念
* Python和Java/C#一样，也是一门基于虚拟机的语言，是一种先编译后解释的语言
### 运行过程
1. 当python程序运行时，编译的结果则是保存在位于内存中的PyCodeObject中，当Python程序运行结束时，Python解释器则将PyCodeObject写回到pyc文件中。
2. 当python程序第二次运行时，首先程序会在硬盘中寻找pyc文件，如果找到，会与源文件进行时间判断，如果没有变化，则直接载入，否则就重复上面的过程。
3. 所以我们应该这样来定位PyCodeObject和pyc文件，我们说pyc文件其实是PyCodeObject的一种持久化保存方式。
### PyCodeObject与pyc文件
* PyCodeObject则是Python编译器真正编译成的结果
* pyc文件其实是PyCodeObject的一种持久化保存方式。