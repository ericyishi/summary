# eclipse
### 常用快捷键
* **ctrl+F11** 运行
* **ctrl+shift+f 或者右键--source--format** 代码格式化：【与搜狗输入法冲突】
* **ctrl+D** 删除当前行【webstorm是复制当前行】
* **shift+回车** 跳转到下行行首
* **ctrl+/** 单行注释
* **ctrl+shift+/** 多行注释
* **ctrl+shift+\\** 取消多行注释
* **ctrl+alt+上下箭头** 复制当前代码【与window旋转屏幕有冲突】
* **alt+上下箭头** 移动当前代码
* **ctrl+shift+o** 导包快捷键 【在缺少包的的行使用】
* **ctrl+1** 提示错误建议
* **ctrl+2** 改名
* **Alt+/** 内容自动补全
    ```
    ①补充方法
    输入syso然后按快捷键alt+/就可以自动补全了
    输入main+alt+/快速补全main方法
    ②引入系统的类
    输入sc，alt+/,选择Scanner
    这时自动补全，并自动导入包import java.util.Scanner
    ③循环遍历
    输入for，alt+/,选择iterate
    自动生成：
    for (int i = 0; i < args.length; i++) {

    		}
    ```
* **ctrl+O** 调出类中所有的方法

* **shift+alt+l** 类自动补全
```
new CarWrapper(qq);
按下快捷键后，补全的结果：
CarWrapper carWrapper = new CarWrapper(qq);
```

* **ctrl+T** 安装ctrl鼠标移动到类名上，按T，会出现所选中类的继承树
### 常用设置
* **代码行显示** 在代码区域的左边空白区域，右键 -- Show Line Numbers
* **还原默认显示模式** Window -- Reset Prespective


### 导入jar
1. 在根文件夹下创建lib文件夹，用于同一管理所有的jar文件
2. 将所有外部的jar放入这个文件夹下
3. 右键点击jar文件，点击Build Path，选择Add to Build Path，此时查看项目根文件夹下的.classpath文件，发现新加入的jar包路径被配置到了该文件中。说明可以使用jar包中所有类了。


### 切换为Package Explorer窗口
1. 在顶部菜单中找到Window——Show View——Others，
2. 在对话框窗口中找到java一项，并点击打开java下的项目
3. 在java项目下找到Package Explorer，即包浏览器。然后选择OK按钮确认选择 


### “Implicit super constructor Object() is undefined for default constructor. Must define an 
explicit constructor”的解决
* 没导入java的JRE库
* 步骤
1. 在工程上右键选择属性->Java Build Path的Libraries->Add Library
2. 选择JRE System Library->点击Next->
3. 选择Execution environment并选择版本或workspace default jre->点击Finish。


### 打war包
* war特点是，放在在tomcat/webapps目录下 只要tomcat启动 war会自动解压
* 操作：
  1. 鼠标移至项目，右键鼠标，选择“Export”
  2. 搜索war，点击“next”
  3. 在destination下选择输出路径
  4. 点击“finish”