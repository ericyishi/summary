# 清除浮动
### 两种方式：
 1. 在要清楚浮动元素下新增块级元素，设置clear属性；
 2. 触发包含块的BFC，使其包含浮动元素。

 * 第一种方式：不常用，因为要新增元素。要么就要设置伪类
 ```
 clear 清除

 　　值: left | right | both | none | inherit

 　　初始值: none

 　　应用于: 块级元素(块级元素指block元素，不包括inline-block元素)

 　　继承性: 无
 ```




* 第二种方式：
**在其父元素！！上添加一个类名为clearfix**
* 下面的方式，是最优的最简洁，兼容性最好。overflow:hidden也能够实现，但是对seo效果不好。
```
    .clearfix{overflow:auto;_height:1%}
或者
    .clearfix{overflow:auto ;_zoom:1;}
```

* 还有一种伪类的方式，依然设置在浮动元素的父元素上面
```
       .clearfix{
          display: inline-block;
        }
        .clearfix:after{
            display:block;
            content:".";
            height:0;
            line-height: 0;
            clear:both;
            visibility: hidden;
        }
```