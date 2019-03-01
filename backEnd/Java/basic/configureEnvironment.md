# 环境变量配置
### 常见问题
1. 更换JDK版本后，修改环境变量也无法生效的原因和解决办法？
  * 当使用安装版本的JDK程序时（一般是1.7版本以上），在安装结束后安装程序会自动将java.exe、javaw.exe、javaws.exe三个可执行文件复制到C:\Windows\System32目录，这个目录在WINDOWS环境变量中的优先级高于JAVA_HOME设置的环境变量优先级，故此直接更改JAVA_HOME会无效。
  * 另外，JDK1.8安装版本，还会在C:\ProgramData\Oracle\Java目录中生成一些配置文件，并同时将此目录写到环境变量中的Path中。
   ```
    解决：
    删除C:\Windows\System32目录下的java.exe、javaw.exe、javaws.exe三个文件
    删除环境变量Path中C:\ProgramData\Oracle\Java\javapath的配置
     
   ```