# 弹出框的处理
### 弹框分类
1. alert 警告框（只有一个确定按钮）
2. confirm 提示框（具有确定、取消两个按钮）
3. prompt 输入框（的、以及确定、取消两个按钮）

### 获取弹框的办法
* 上面三种弹框都使用同一个方法:driver.switch_to_alert()

* 获取到弹窗以后，就能对上面做操作了
  * text 获取文本 上面三个弹窗都有效
  * accept() 点击确定按钮，对上面三种类型都有效
  * dismiss() 点击取消按钮，对上面confirm、prompt类型有效
  * send_keys("内容") 发送内容，针对prompt类型有效


