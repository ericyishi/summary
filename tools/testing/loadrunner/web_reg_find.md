# 检查点
### 作用
* LR是不会对业务逻辑进行判断的，只要返回页面为200都认为是正确的
* 检查点：验证是否是正确的业务

### 检查点启用
```
 Vuser--Run-time settings--preferences--在checks下，勾选“Enable image and text check”
```

### 插入检查点的三种方式
1. 录制脚本的时候插入
2. 可视Tree视图中插入
    1. 点击树视图Tree
	2. 找到对应有检查点的页面
	3. 选中检查文本，右键“Add a text check(web_reg_find)”
	4. 弹出检查点设置的文本框，进行设置
3. 手动，利用函数助手插入
    1. Insert菜单
	2. 点击Add Step项
	3. 选择Services
	4. 里面找到web_reg_find,点击“ok”
	5. 弹出检查点设置的文本框，进行设置