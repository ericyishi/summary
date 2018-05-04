# 上传文件
* 上传文件大致分为两大类，一类就是input标签的，一类是插件方式
### input标签
 ```
  <input type="file"/>
 ```
 * 这种方式直接找到这个input元素，然后使用send_keys()将路径发送进来即可
### 插件方式
 * 基于使用ajax、js、flash等技术
 * 这种方式不太好获取，那么我们需要安装工具AutoIt（不推荐，因为python不可控这个exe文件的运行情况）
   * autoIt使用原理
     1. 先使用autoIt去抓取需要的上传的按钮，
     2. 编写autoIt脚本
     3. 将上传操作转化为exe文件
     4. 再在py文件中去调用打开这个exe文件
    [参考外联](https://www.cnblogs.com/fnng/p/4188162.html)