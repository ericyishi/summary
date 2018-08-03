# 富文本编辑器
### 向文本框里输入内容的几种方式
1. sends_keys("内容")
2. 使用js
```
 self.driver.execute_script("document.getElementByTagName('body')[0].innerHTML='<div>内容</div>'")
 
```
3. 使用win32从剪切板粘贴