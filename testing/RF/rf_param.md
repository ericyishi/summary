# 变量与常量
### 变量
* 两者之间可以相互转换
1. Scalar【标量：单值变量】【常用】
   * 使用$符号表示：${a}
   * 常用于赋值字符串、数值等，也可以List类型
   * 常用方法
      1. 变量赋值
		  1. Set赋值
			 
			   |  ${val2} |Set variable|abc|
			   |---|---|---|
			   |  ${val3} |Set variable If |'${val2}'=='abc'| yes|no|
			   * 如果是比较字符串也需要将变量名括号起来
			 
			   |  ${val2} |Set variable|123|
			   |---|---|---|
			   |  ${val3} |Set variable If |${val2}==123| yes|no|
			 
		  2. Get取值
			 
			   |  ${val2} |Get Length|123|
			   |---|---|---|
			   |  ${val3} |Get Time|
			 		
		  3. 命令行参数赋值
		     * 通过Run界面上的Arguments里面加上一行
               ```
			    -v 变量名:变量值
				-v val2:123
			   ```						   
		       * 经试验，如果变量已经赋值，通过变量的方式应该不起作用（存疑）
	  2. 变量的使用
         1. Run Keyword If
		    * 如果判断条件成立，那就执行后面的语句
			
               |  Run Keyword If |'${val2}'=='123'|log|hello|
			   |---|---|---|---|
			   
			   * 如果变量${val2}等于123的时候，那么就执行后面的log打印输出hello的语句，如果不等于则不执行后者
         2. 字符串与变量的拼接
             * 如果想把变量作为一个字符串的一部分，直接写就行。不用使用“+”
			 
               | ${val1}|Set Variable|123|
			   |---|---|---|   
			   |log|0${val1}456|
		 3. 直接使用字符串下标或切片取值
		 
               |${val1}|Set Variable|12345|
			   |---|---|---|
               |log|${val1[2]}|
               | log|${val1[0:2]}|	 
		 4. 参加运算Evaluate
           	* 这里指的是数值型的变量计算【可以加减乘除】
			  * 对于字符串类型的数值，需要强制转换后才有效
			
               |${val1} | Set Variable |88|
			   |---|---|---|
               |${val2}| Evaluate|${val1}/2|
			   | log|${val2}|
		
		       * 结果为44
         	  
2. List 【列表：多值变量】 【不常用】
   * 使用@符号表示：@{b}
   * 可以赋值：字符串、子列表、字典，或者空
   * 常用方法
     1. 变量赋值
	    1. Create List【推荐】
		2. Set Variable【不推荐，主要用于设置Scalar变量】
		   
		   | @{val} | Set Variable | 1 | 2 | 3| 
		   |---|---|---|---|---|
           | @{val2}| Create List| 1 | 2 | 3| 
           | Log Many | @{val}| 
           | Log Many | @{val2}| 
           | Log      | &{val2}| 
		   
           * 注意list需要Log Many输出
           * Log打印时只能整体输出，无法依次打印，且输出符号要换成$	
     2. 变量的使用
	 
	       |@{val2}	|Create List|1|warn|
		   |---|---|---|---|
           |@{val}|	Set Variable |	999	| warn |
           |${kw}|	Set Variable|	log	|
           |Run Keyword	|${kw}	|@{val}	|
		   
		   * 这里使用Run Keyword关键字【传入两个参数，第一个是Scalar，第二是List 】，主要是用于将关键字log作为一个参数传入，后面一个参数可以是可变函数类型
     
	 3. 获取List元素
        1. @{变量名}[index]
           1. 一维
              ```
			    @{userList}[1]
              ```	
           2. 二维
              ```
			   @{listC[1]}[1]
              ```	
               * 注意写法			  
		2. ${变量名[index]}
		   1. 一维
		      ```
		        ${userList[1]}
              ```		   
		   2. 二维
		      ```
			    ${userList[1][1]}
			  ```
3. Dict 【字典对象】【常用】
   * 定义为：&{变量名}
     ```html
      &{icon_DBStyle}    border=//i[@class='icon-frame-style']    line=//i[@class='icon-frame-types']
      ...               color=//i[@class='icon-frame-color']    background=//div[@class='yh-picker-button yh-picker-button-square']
     ```
   * 引用的方式：
     1. &{变量名}\[key\]
     2. ${变量名.key}
         * 这种方式引用使用的时候还得使用"$":${icon_DBStyle.color}
   
### 常量
* 主要是指环境变量、数值变量、特殊字符常量、系统保留变量
  1. 环境变量%
     
	   |  log |%{JAVAHOME}|
	   |---|---|
	   
	 
  2. 数值常量
     * RIDE中所有的字符都被当作字符串，包括变量的值是数值【个人理解不是】
	 * 如果要让其为数值类型，要用数值常量
     
	  |  ${shuzhi} |Set variable|${2.6}|2.6|
	  |---|---|---|---|
    
     
  3. 特殊字符常量
     ```
	  ${/} ${:} ${EMPTY} ${False} ${None}等
	 ```  
   
### 其他变量
1. 变量文件
   * 本质就是一个python文件
2. 命令行变量
   * 在ride里面：argument里面引用。
     1. 单个变量使用-v
     2. 变量文件使用-V
     3. 同时-v和-V，-v优先级高，多个-v，则后面优先级高；多个变量文件中定义了相同的变量，第一个变量文件中变量优先级最高。
     
     