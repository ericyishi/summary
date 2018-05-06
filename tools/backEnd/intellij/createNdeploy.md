# 创建web项目与部署
### 步骤
1. 创建web项目
   * 点击左上角的File--> new --> Project
   * 之后会弹出一个选择框，选择Java Enterprise
      * Application Server 选择你服务器软件的路径，比如tomcat
      * 勾选Web Application
      * 勾选create web xml
      * 点击Next
   *  第一项是你的工程名字，第二个是你的工程路径，选择好之后点击finish
2. 创建classes文件夹和lib文件夹
   * 点击WEF-INF  ,右键，NEW-->Directory  创建两个文件夹，classes 和 lib  这个名字不要改哦
3. 关联两个文件夹
   * 完成后再点击File ,选择Project Structure
   * 点击Modules ,选择Paths,选中Use module compile output path ,把路径改成刚刚创建的classes文件夹
   * ok后再点旁边的Dependencies,点击"+"号，选择1 JARs or directories
   * 选择你刚刚创建的lib文件夹，OK
   * 选第3个，jar Directory。 一路OK 到底！
4. 配置服务器
   * 回到主界面后，点击Run ，选择Edit Configurations
   * 看server下tomcat已经有啦，点击旁边的Deployment选项卡
   * Application context可以填也可以不填(一般这里填项目名：“/项目名”)，保存
5. 验证
   * 项目中点击index.jsp。随便写一段话
   * 点击界面右上角的三角形运行
   * 运行成功，直接浏览器打开页面：http://localhost:8080/，并看到刚在index.jsp文件中写入的内容
[参看图文版](https://blog.csdn.net/u012149181/article/details/79245174)
