# 单位
### px
* px像素（Pixel）。相对长度单位。像素px是相对于显示器屏幕分辨率而言的。
### rem
* rem是CSS3新增的一个相对单位（root em，根em）。是相对于html标签的font-size属性值来计算的
* 建议把html字体大小设为font-size:100px;
* **<font style="color:red">注意：</font>有的地方设置为font-size:62.5%,希望将字体设为10px,方便计算。但是这样写是错误的，因为chrome浏览器默认最小字体大小为12px**

```
    html{
      font-size:100px;
    }
    div{
      width:0.1rem;
      height:0.1rem;
    }
```
### em
* em是相对长度单位。是相对于父元素的font-size属性值来计算的