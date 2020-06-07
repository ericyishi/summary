# 加载驱动

### 注意事项
* Selenium3不再像selenium2默认支持firefox浏览器，所以同样需要加载驱动。

### 加载方式
1. 指定路径
```
 driver=webdriver.Firefox(executable_path='c:\\geckodriver')
```
* 需要下载，指定驱动路径即可
2. 添加环境变量
* 除了上面显示通过executable_path指明方式以外，还可以新建一个放驱动文件的文件夹(D:\\project\\driver),将不同的驱动添加至环境变量中去，会自动到环境变量中设定的路径中寻找驱动。
* 实际项目中我们也可以放在python安装目录下，因为python的这个目录已经加入到环境变量中了

