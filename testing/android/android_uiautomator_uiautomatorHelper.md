# uiAutomatorHelper
### 概述
* 将编译，将执行包上传到设备，执行的一系列操作帮我们做了。

### 下载
```
 https://github.com/fan2597/UiAutomatorHelper
```
* 下载后是一个.java文件

### 使用
1. 导入进我们项目中
   * 将下载好的UiAutomatorHelper类直接放在项目的包下（粘贴进来也行）
2. 测试类中添加main方法，并配置相应参数
   ```
        public static void main(String [] args ){
            String jarName="AutoRunner"; //我们将要生成的jar包名字；
            String testClass= "testPackage.TestClass";  //测试的包名.类名(类下可以有很多方法)；
            String testName="clickTimer"; // 类名下要运行测试的那个方法名；
            String androidId="1";//这个是我们android list时看到的安卓id，我的是1；
            new UiAutomatorHelper(jarName, testClass, testName, androidId);//注意顺序
        }
   ```
3. 运行
   *  右击文件-Run As-Java Application；