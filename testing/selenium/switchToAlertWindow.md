# 弹出框的处理
### 弹框分类
1. alert 警告框（只有一个确定按钮）
2. confirm 提示框（具有确定、取消两个按钮）
3. prompt 输入框（的、以及确定、取消两个按钮）

### 获取弹框的办法
* 上面三种弹框都使用同一个方法:driver.switch_to_alert()
* 较高的版本更推荐使用属性的方式获取
```
 alert=driver.switch_to.alert
```

* 获取到弹窗对象以后，就能对上面做操作了
  * text 获取文本 上面三个弹窗都有效
    ```
	 alert.text
	```
  * accept() 点击确定按钮，对上面三种类型都有效
  * dismiss() 点击取消按钮，对上面confirm、prompt类型有效
  * send_keys("内容") 发送内容，针对prompt类型有效

### 其他类型
* 除了上面alert弹框外，还有别的类型
* 有的弹出框是div层，这种跟平常定位方法一样
* 有的弹出框是嵌套的iframe层，这种切换iframe就可以了
* 有的是嵌入的一个窗口
  * 1.通过打印获取全部的窗口，发现居然打印的是两个handle,也就是说，这个表面上看起来是一个窗口，实际上内嵌了另外一个窗口了。 
        ```   
          # 打印所有的handle
          all_handles = driver.window_handles
          print(all_handles)
           
          # 切换到新的handle上
          driver.switch_to.window(all_handles[1])
          # 后面就直接定位
        ``` 
