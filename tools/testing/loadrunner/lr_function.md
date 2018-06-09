# 常用方法
* lr_eval_string("{param}") 从参数中提取对应的值，将变量转换成字符串
* lr_output_message("str"); 输出字符串
  * lr_output_message("用户名：%s",lr_eval_string("{param}"));
* lr_error_message("str");输入错误的信息
* 字符串、数字互转
    * atoi(lr_eval_string("{param}")) 将LR参数{param}转换为数字
    * lr_save_int(要转化的字符串,"变量名"); 将字符串转化为数字并保存在变量中
* web_reg_save_param：关联函数，一定要写在请求之前
  ```
   Insert--new step--web_reg_save_param
  ```
  * 这种方式可以左右字符串截取，自动生成
  * 如果对于没有找到的元素，希望不报错，自动运行，需要将参数NotFound改成warning
    ```
         web_reg_save_param("pageBar",
            "LB=/",
            "RB=&nbsp; &nbsp; &nbsp;Go",
            "NotFound=warning",
            LAST);
    ```
    * **注意**:默认是NotFound=Error，报错后会终止代码运行的


* 参数数组操作
  * 要整个页面去查找，而不是找到就返回
    * 需要设置成"Ord=ALL"
    ```
     //获取帖子id
	      web_reg_save_param("tid",
		  "LB=<a href=\"read.php?tid=",
		  "RB=\" id=\"",
		  "Ord=ALL",
		  LAST);
    ```

  * 对于不止一个值，返回的是一个数组，有以下方式进行操作：
    1. 随机取值
        * 从参数数组param_arry中随机取一个值，**注意param_arry不需要加{}**
      ```
       lr_paramarr_random("param_arry")
      ```
    2. 获取长度
        * 获取参数数组param_arry的长度，并保存到C语言的变量size里
      ```
       int size;
       size = lr_paramarr_len("param_arry")
      ```
    3. 获取指定值
       * 获取参数数组param_arry中第1个值，并保存到C语言的变量value里
      ```
       int value;
       value = lr_paramarr_idx("param_arry",1)
      ```
* web_reg_find：文本检查点函数，一定要写在请求之前
  ```
   	web_reg_find("SaveCount=pages_count",
		"Text=Pages",
		LAST);
  ```
  * Text 是要查找的内容
  * SaveCount 是对应的出现的次数，可以用于后续的判断
    ```
         web_reg_find("SaveCount=pages_count",
            "Text=Pages",
            LAST);

         web_url("模块",
		  "URL=http://localhost/phpwind/thread.php?fid={myfid}",
		  "TargetFrame=_blank",
		  "Resource=0",
		  "RecContentType=text/html",
		  "Referer=http://localhost/phpwind/",
		  "Snapshot=t5.inf",
		  "Mode=HTML",
		  EXTRARES,
		  "Url=images/close.gif", "Referer=http://localhost/phpwind/thread.php?fid={myfid}", ENDITEM,
		  LAST);

		  if (atoi(lr_eval_string("{pages_count}")) > 0){    //判断如果pages_count字符串出现次数大于0

           lr_output_message("帖子数大于20，出现了分页.");
           }
           else{ //如果出现次数小于等于0

         lr_output_message("帖子数小于20条"); //在日志中输出Log on failed


        }
    ```

* 取随机数
  ```
   rand()%100;
  ```
  * 表示获得一个100以内的随机数，其结果在[0-99]中
