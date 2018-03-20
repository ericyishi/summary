# 元素垂直居中的几种方式

### 1.使用line-height
* 只适用于单行内容，如果当文字内容的长度大于块的宽时，就有内容脱离了块。

### 2.vertical-align
###### 说明：vertical-align:middle的解释是元素的中垂点与父元素的基线加1/2父元素中字母X的高度对齐。由于字符X在em框中并不是垂直居中的，且各个字体的字符X的高低位置不一致。所以，当字体大小较大时，这种差异就更明显。当font-size为0时，相当于把字符X的字体大小设置为0，于是可以实现完全的垂直居中
* [1] 图片
  * 子元素是图片，通过设置父元素的line-height等于height（或者直接只使用line-height），且设置父元素的font-size为0。
 ```
<div class="box" style="line-height: 200px;font-size: 0;">
    <img src="https://www.baidu.com/img/baidu_jgylogo3.gif" style="vertical-align: middle;" alt="">
</div>
 ```


* [2] 普通行内元素
  * 行内元素内有文字，需要单独设置字体大小。

 ```
<div class="box" style="line-height: 200px;font-size: 0;">
    <span style="vertical-align: middle;height:30px;font-size:18px;">哈哈哈</span>
</div>
 ```

### 3.display:table-cell 【针对块级元素】
   * 在 chrome、firefox 及 IE8 以上的浏览器下可以设置块级元素的 display 为 table-cell（设置为表格单元显示），激活 vertical-align属性，但注意 IE6、7 并不支持这个样式, 兼容性比较差。
     display:table-cell;
     vertical-align:middle;

 ```
  <div class="box" style="display:table-cell;vertical-align:middle">
      <div style="">
          <div>1</div>
          <div>2</div>
          <div>3</div>
      </div>
 </div>
 ```

### 4.绝对定位absolute
  * 内容高度不定、固定都适用（absolute+translateY）
```
<div class="box" style="position:relative">
    <div style="position:absolute;top:50%;transform: translateY(-50%)">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```

 * 对于高度固定的
   * 子元素设置 top:0 bottom:0 margin:auto 0
```
<div class="box" style="position:relative">
    <div style="position:absolute;top:0; bottom:0;height:100px;margin:auto 0;">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```


### 5.flex布局
 * [1] 在伸缩容器上侧轴上设置display:flex;align-items: center;
```
<div class="box" style="display:flex;align-items: center;">
    <div style="">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```

* [2] 在伸缩容器上侧轴上设置display:flex;在伸缩项目上设置:margin:auto 0;
```
<div class="box" style="display:flex;">
    <div style="margin:auto 0;">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```

### 6.grid布局
* [1] 在网格容器上布局,使用display:grid;同时设置align-items:center;或者align-content:center;
```
<div class="box" style="display:grid;/*align-items:center;*/align-content:center;">
    <div style="">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```

* [2] 在网格容器上布局,使用display:grid;网格项目中设置align-self:center;或者margin:auto 0;
```
<div class="box" style="display:grid;">
    <div style="/*margin:auto 0;*/align-self:center;">
        <div>1</div>
        <div>2</div>
        <div>3</div>
    </div>
</div>
```