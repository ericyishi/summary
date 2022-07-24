# GUI编程
### Tkinter
* Tkinter为python的ui工具包，在安装python时候就会自带。
* 注意：python2模块名叫Tkinter，python3中变为tkinter

#### demo1 输入与展示
```html
# coding=utf-8
import tkinter as tk

window = tk.Tk()
# 纯文本
label = tk.Label(window, text='Hello World')
#文本输入框
text = tk.Text(window, height=10)
#是一个“字符串变量”对象，可以与Entry、Label等控件绑定
entry_text=tk.StringVar()
#Entry输入控件；用于显示简单的文本内容
entry = tk.Entry(textvariable=entry_text,width=30)
label2=tk.Label(window, text='结果展示')
label.pack()
text.pack()
entry.pack()
label2.pack()

def getTextInput():
    result = text.get("1.0", "end")
    print(result)
    # 将值展示在entry控件中
    entry_text.set(result)
    # 将值展示在label标签中
    label2.config(text=entry_text.get())

btn = tk.Button(window, height=1, width=10, text="Read", command=getTextInput)
btn.pack()
tk.mainloop()

```