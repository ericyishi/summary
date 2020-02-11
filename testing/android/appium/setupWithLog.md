# 启动增加配置项
* 例如需要一个log输出
  1. 使用下面appium.cmd就能启动，同时输出日志到c盘根目录下
      * appium.cmd
		```
		 @IF EXIST "D:\nodejs\node.exe" (
			"D:\nodejs\node.exe"  "C:\Users\ricky\AppData\Roaming\npm\node_modules\appium\build\lib\main.js" --port 4723 --chromedriver-executable C:\nodejs\node_modules\appium\node_modules\appium-chromedriver\chromedriver\win\chromedriver.exe --session-override --log-timestamp --local-timezone --log-level info --log C:\appium.log  --command-timeout 3600 %*
		) ELSE (
		  @SETLOCAL
		  @SET PATHEXT=%PATHEXT:;.JS;=;%
		  node  "C:\Users\ricky\AppData\Roaming\npm\node_modules\appium\build\lib\main.js"%*
		)
		 
		```
		* 需要自己更改下路径文件。使用node 到...\node_modules\appium\build\lib\main.js就能启动appium service服务，只是在后面跟了一些参数