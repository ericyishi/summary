# 外边界重叠与BFC
###### 现象：只有普通文档流中块框的垂直边界才会发生边界叠加【父子之间，兄弟之间】。行内框、浮动框或绝对定位框之间的边界不会叠加。
###### 现实意义：外边距的重叠只产生在普通流文档的上下外边距之间，这个看起来有点奇怪的规则，其实有其现实意义。设想，当我们上下排列一系列规则的块级元素（如段落P）时，那么块元素之间因为外边距重叠的存在，段落之间就不会产生双倍的距离。
###### 解决：
* 外层元素padding代替
* 内层元素透明边框 border:1px solid transparent;
* 内层元素绝对定位 postion:absolute:
* 外层元素 overflow:hidden;
* 内层元素 加float:left;或display:inline-block;
* 内层元素padding:1px;

![image](https://github.com/ericyishi/img-folder/blob/master/summary/BFC.png)