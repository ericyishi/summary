@IF EXIST "D:\nodejs\node.exe" (
  "D:\nodejs\node.exe"  "C:\Users\ricky\AppData\Roaming\npm\node_modules\appium\build\lib\main.js" --port 4723 --chromedriver-executable C:\nodejs\node_modules\appium\node_modules\appium-chromedriver\chromedriver\win\chromedriver.exe --session-override --log-timestamp --local-timezone --log-level info --log C:\appium.log  --command-timeout 3600 %*
) ELSE (
  @SETLOCAL
  @SET PATHEXT=%PATHEXT:;.JS;=;%
  node  "C:\Users\ricky\AppData\Roaming\npm\node_modules\appium\build\lib\main.js"%*
)