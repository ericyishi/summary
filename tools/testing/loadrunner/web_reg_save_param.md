# 关联
### 目的
* 让token这类验证方式能够通过。
### 原理
* 使用关联函数去保存，服务器每次响应页面里面回传的token

### 关联的几种方式
1. 自动关联【首推】
    * 虽然不那么准确，还需要手动修改
	* 步骤：
	   1. Vuser--Scan script for Correlations
	   2. 选yes
	   3. 会找出不一样的地方。这个时候找出来的不一定精确，可能会把同一个地方，分成几段。
	   4. 可以先点击确定，再切换“script”视图进行修改
	   
2. 手动关联【自动关联不起作用的时候】
    * 比较灵活
	* 步骤：
	  1. 再录制一个脚本，保存
	  2. 使用对比工具。tools-compare with scripts
	  3. 通过人工方式，排查需要的关联点
	  3. 设置关联函数。insert--new step--web_reg_save_param
	  4. 填写左右边界，确定
	  5. 再将需要插入关联函数的地方进行替换。
	  6. 
3. 边录制边关联
   * 这种方式实际上是要知道在哪里，先把关联点的左右边界给找出来后，再进行录制	
   * 步骤：
     1. Tools--Recording Options--Correlation
	 2. 勾选“Enable correlation during recording”
	 3. 点击“new application”创建一个新的名字，一般就项目名
	 4. 点击“new Rule”创建一个规则，名字自己取
	 5. 设置左边界，右边界。保存
	 6. 然后就可以开始录制脚本了。录制脚本完成后，就自动关联了。