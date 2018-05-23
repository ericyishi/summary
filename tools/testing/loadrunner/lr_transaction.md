# 事务
### 概念
1. 事务(Transaction)是这样一个点，我们为了衡量某个action的性能，需要在action的开始和结束位置插入这 样一个范围，这就定义了一个transaction。
2. 事务的作用：LoadRunner运行到该事务的开始点时，LoadRunner就会开始计时，直到运行到该事务的结束点，计时结束。这个事务 的运行时间在LoadRunner的运行结果中会有反映。通俗的讲LoadRunner中的事务就是一个计时标识，LoadRunner在运行过程中一旦 发现事务的开始标识，就开始计时，一旦发现事务的结束表示，则计时结束，这个过程中得到的时间即为一个事务时间。
   * 通常事务时间所反映的是一个操作过程的响应时间。
### 事务函数
1. lr_set_transaction_instance_status 用于设置事务的状态
   * 事务的状态包括：LR_PASS、 LR_FAIL 、  LR_AUTO 、  LR_STOP  。可以在脚本中根据条件设置事务的状态，例如，根据检查点返回的结果来设置事务为通过还是失败。
     ```
      if(event == GENERAL_ERROR)
        lr_set_transaction_instance_status(LR_FAIL);
        lr_end_transaction("登陆",LR_AUTO);
     ```
2. lr_fail_trans_with_error
   * 与lr_set_transaction_instance_status 类似，都可以用于设置事务的状态
   * 区别在于lr_fail_trans_with_error除了可以设置的状态，还可以输出错误日志信息。
     ```
      if(status != SUCCESS)
        lr_fail_trans_with_error("an error has occurred:%s",my_get_error_string(status));
        lr_end_transaction("登陆成功",LR_AUTO);
     ```

3. lr_get_transaction_status 用于获取事务的状态
   ```
     if (lr_get_transaction_status() == LR_FAIL)
    {
        //由于web_url请求失败了，所以没有必要继续执行下去，因些设置事务状态为FAIL
        lr_end_transaction("登陆失败",LR_FAIL);
        return;
    }
   ```

4. lr_get_transaction_duration 用于获取事务所消耗的时间
   ```
     Action()
        {
            double trans_time;  //定义变量

            web_url("www.baidu.com",
                "URL=http://www.baidu.com/",
               .....

            lr_start_transaction("访问注册页");  //定义事务开始

            web_link("???",
                "Text=???",
                "Ordinal=2",
                "Snapshot=t15.inf",
             ......

            trans_time=lr_get_transaction_wasted_time("访问注册页");  //获得消耗时间

            if (trans_time) {
                lr_output_message("The duration up to the submit is %f seconds",trans_time);  //打印数输出消耗实时间
            }else{
                lr_output_message("the duration cannot be determined. ");
            }

            lr_end_transaction("访问注册页",LR_AUTO);  //事务结束

            return 0;
        }
   ```