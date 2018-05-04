# 调用JavaScript
* 有些时候，我们要控制一些模块，但是webdriver并没有提供相应的操作，所以我们可以使用JS来控制
* 例如操作滚动条

### 使用JS
1. 操作滚动条的高度
  ```
   js="window.scrollTo(0,100)"
   # 将垂直滚动条调到100px的位置
   driver.execute_script(js)
  ```
  * 通过js就很好的操纵了浏览器的滚动条

2. textarea文本框
  * 使用send_keys()同样不能写入内容
    ```
     text="要输入textarea的内容"
     js="var ele=document.getElementByID('mytextarea');ele.value=%s;"%text
     driver.execute_script(js)

    ```
    * 通过js的方式就可以向里面输入内容了