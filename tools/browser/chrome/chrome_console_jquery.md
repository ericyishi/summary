# 使用js在页面head中加入cdn的jquery的代码
### 完整代码
```
 var importJs=document.createElement('script'); 
 importJs.setAttribute("type","text/javascript");
 importJs.setAttribute("src", 'https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js');
 document.getElementsByTagName("head")[0].appendChild(importJs); 
```



### 代码分析：
```
 var importJs=document.createElement('script')  //在页面新建一个script标签
 
 importJs.setAttribute("type","text/javascript")  //给script标签增加type属性
 
 importJs.setAttribute("src", 'https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js') //给script标签增加src属性， url地址为cdn公共库里的
 
 document.getElementsByTagName("head")[0].appendChild(importJs)  //把importJs标签添加在页面
```
