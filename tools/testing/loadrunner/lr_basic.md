# loadrunner
### 概述
1. Loadrunner默认使用c语言
2. 最好的环境是win7（32位）+Loadrunner11最好使用IE9，其他版本录制脚本时候会有问题
3. VUGen，不支持64位
### 工作原理
1. 使用VuGen虚拟用户生成器，产生不同的用户
2. 通过Controller控制器对生成的用户进行控制，对目标网站进行访问
3. 使用Analysis去搜集相应数据
### 如何模拟许多用户行为进行压力测试
1. 通过浏览器录制脚本模拟用户
2. 增强脚本产生多个用户和数据
3. 通过controller控制压力
4. 监控压力过程并收集数据
5. 根据数据分析结果输出报告

### 常用配置
1. 启用后，回放可以实时查看
   ```
    Tools--General Options-Display，勾选[Show run-time viewer during re]
   ```
2. 使用web_url和web_submit_data【不要使用web_link和web_submit_form】来发送GET和POST请求
   ```
    Tools--Recoding Options--Recording--HTML-based script--HTML Advanced--A script containing explicit URLs only(e.g. Web_url,Web_submit_data)
   ```
3. 让LR编译支持UTF8
   ```
    Tools-Recording Options-HTTP Properties-Advanced-Support charset，选择[UTF-8]
   ```
   * LR运行时支持中文【一定要设置，不然会出现莫名其妙的错误】
   ```
    Vuser--Run-time Setting--Internet Protocal--Prefrences--Options
    General--Convert from/to UTF-8--yes
    General--ContentCheck values in UTF-8--yes
   ```

4. 查看运行结果摘要
   ```
    View-Test Results
   ```
5. 设置参数列表
   ```
    Vuser--Parameter Lists
   ```
6. 关闭日志
   ```
    Vuser--Run-time Setting--Log--Enable logging
   ```
### 常用快捷键
* 注释 CTRL+ALT+C
* 取消注释 CTRL+ALT+U


