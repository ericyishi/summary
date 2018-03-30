# 定时器
### 概述
 * window下面的的方法window.setInterval(),window.setTimeout()
 * window.setTimeout()只循环执行
 * 只执行一次

### 定义方法【setInterval、setInterval定义方式一致】

 * 1.使用回调函数方式
 ```
   setInterval(function(){},毫秒数)
 ```
 * 2.调用函数方式
 ```
   setInterval(函数名,毫秒数[,参数])
 ```
 ```
  使用传参的方式：
   function myStartFunction() {
       myVar = setTimeout(alertFunc, 2000, "Runoob", "Google");
   }

   function alertFunc(param1, param2) {
       document.getElementById("demo").innerHTML += "Hello ";

       document.getElementById("demo2").innerHTML = "传递给 alertFunc() 的参数: <br>"
       + param1 + "<br>" + param2 + "<br>";
   }
 ```

 * **注意，函数名后面没有()**
 ```
  setTimeout(alertFunc, 2000)
 ```


### 清除定时器
 * clearTimeout(id_of_settimeout)
 * clearInterval(id_of_setInterval)

### 使用setTimeout实现setInterval
```
  function func(){
    console.log("hahaha");
    setTimeout(func,1000);
  }

  setTimeout(func,1000)
```
