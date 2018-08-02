# 操作textarea文本框
  * 使用send_keys()同样不能写入内容，所以要使用js
    ```
     text="要输入textarea的内容"
     js="var ele=document.getElementByID('mytextarea');ele.value=%s;"%text
     driver.execute_script(js)

    ```
    