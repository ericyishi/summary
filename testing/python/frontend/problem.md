# 错误汇总
1. django提交表单报错"You called this URL via POST, but the URL doesn't end in a slash and you have APPEND_SLASH set. "
   * form表单的action属性值结尾没有加”/”

2. 模型类中写了中文，需要编码
   * 问题：如果在str方法中返回中文，在修改和添加时会报ascii的错误
   * 解决：在str()方法中，将字符串末尾添加“.encode('utf-8')”