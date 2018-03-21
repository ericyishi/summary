# 两栏布局的几种方式

###### 设置公共样式
```
        html,body {
            padding: 0;
            margin: 0;
            overflow-x: hidden;//不出现水平滚动条
        }

        section {
            margin-bottom: 10px;
        }

        div {
            height: 100px;
        }

        .d1 {
            background: red;
        }

        .d2 {
            background: blue;
        }
```
### 1.float方式
* 固定的一边设置宽度并浮动，另一边设置宽度为100%且margin控制显示区域


```
css样式：

       #f1 .d1 {
            width: 300px;
            float: left;
        }

        #f1 .d2 {
            width: 100%;
            margin-left: 300px;
        }
```

```
html：

<section id="f1">
    <div class="d1"></div>
    <div class="d2">方法1、float</div>
</section>
```

### 2.table方式
* 外层容器设置为display:table,让容器变为&lt;table&gt;一样，并设置宽度为100%
* 让内层容器设置display:table-cell,目的是功能变为&lt;td&gt;一样的
* 固定宽度的一侧，设置width
```
css样式：

    #f2 {
            display: table;
            width: 100%;
        }

        #f2>div {
            display: table-cell;

        }

        #f2 .d1 {
            width: 300px;
        }
```

```
html：

<section id="f2">
    <div class="d1"></div>
    <div class="d2">方法2、table</div>
</section>
```


### 绝对定位absolute
* 外层容器使用position: relative;
* 让左右容器都使用绝对定位
```
css样式：

        #f3 {
                position: relative;
                height:100px; //绝对定位会导致父容器没有高度，以至于#f4，会躲在f3下面。所以高度必须要设置或者使用overflow:hidden;
            }

            #f3 .d1 {
                position: absolute;
                left: 0;
                width: 300px;
            }

            #f3 .d2 {
                position: absolute;
                right: 0;
                left: 300px;//通过left、right同时使用巧妙地设置了容器的宽度
            }
```

```
html：

<section id="f3">
    <div class="d1"></div>
    <div class="d2">方法3、absolute</div>
</section>
```

### flex方式
* 外层容器使用display:flex;
* 分别对内层容器设置flex属性值

```
css样式：

    #f4 {
            display: flex;
        }

        #f4 .d1 {
            flex: 0 0 300px;//不扩展，不收缩，宽度300px
            width: 300px; //兼容性写法
        }

        #f4 .d2 {
            flex: 1; //让所有弹性盒模型对象的子元素都有相同的长度
        }
```

```
html：

<section id="f4">
    <div class="d1"></div>
    <div class="d2">方法4、flex</div>
</section>
```

### grid方式

```
css样式:

    #f5{
            display: grid;
            grid-template-columns: 300px auto;
            grid-template-rows: 100px;
        }
```
```
html:

<section id="f5">
    <div class="d1"></div>
    <div class="d2">方法5、 grid</div>
</section>
```