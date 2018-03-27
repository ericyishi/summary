# 标准盒模型（W3C盒模型）
### 标准盒模型（W3C盒模型）
* box-sizing:content-box【默认】
![image](https://github.com/ericyishi/img-folder/blob/master/summary/contentBox.png)
* 最终元素的总宽度计算公式是这样的：
 ```
   总元素的宽度=宽度+左填充+右填充+左边框+右边框+左边距+右边距
 ```

* 元素的总高度最终计算公式是这样的：
 ```
 总元素的高度=高度+顶部填充+底部填充+上边框+下边框+上边距+下边距
 ```

* width: 指得是内容的宽度;
* height：指得是内容的高度;
### 怪异盒模型（IE盒模型）
* box-sizing:border-box;
![image](https://github.com/ericyishi/img-folder/blob/master/summary/borderBox.png)
![image](https://github.com/ericyishi/img-folder/blob/master/summary/IEBox.png)
* width: 指得是内容的宽度+padding+border;
* height：指得是内容的高度+padding+border;


### 怪异盒模型触发条件
* box-sizing:border-box
* 一般没有DTD定义，浏览器会自动促发quirks模式，但是刚才测试了，发现，ie10及其他标准浏览器，都不会促发怪异模式，IE9，IE8，IE7，IE6会促发，
