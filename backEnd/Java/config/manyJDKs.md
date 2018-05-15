# Windows对JDK默认版本切换问题
* 不同项目之间切换jdk
### 1.8 转1.7
* 步骤：
  1. 将C:\Windows\System32目录下的java.exe、javaw.exe、javaws.exe三个可执行文件 删除即可。
  2. 打开控制面板，以“大图标”或“小图标”方式查看，然后打开JAVA,打开JAVA控制面板，打开“JAVA”选项卡，运行时环境设置，把1.8的的勾去掉即可。
  3. 将环境变量中Path中的“C:\ProgramData\Oracle\Java\javapath”删除
  4. JAVA_HOME路径换成1.7的
  4. 修改注册表，regedit
  5. 找到HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft，修改Java Development Kit的CurrentVersion默认值为1.7
  6. 修改Java Runtime Environment的CurrentVersion默认版本为1.7
  6. 重开一个cmd，输入java -version验证

### 1.7 转1.8
* 步骤：
  1. 将JAVA_HOME路径换成1.8的
  2. 同时将bin文件下的java.exe、javaw.exe、javaws.exe三个文件，拷贝到C:\Windows\System32以及C:\ProgramData\Oracle\Java\javapath路径下
  3. 将C:\ProgramData\Oracle\Java\javapath，增加至path中
  4. 修改注册表，找到HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft，修改Java Development Kit的CurrentVersion默认值为1.7
  5. 修改Java Runtime Environment的CurrentVersion默认版本为1.7
  6. 重开一个cmd，输入java -version验证