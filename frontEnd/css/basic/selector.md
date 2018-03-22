# 选择器类型
### 1.通配符选择器（*）
* 星号*代表通配选择器，可以与任何元素匹配
```
    *{
        margin:0;
        padding:0;
    }
```
### 2.ID选择器（#）
**[注意]在实际中，浏览器并不会检查ID的唯一性，设置多个ID，可以为这些具有相同ID的元素应用相同样式，但在编写DOM脚本时只能识别该id的第一个元素。**
```
    #box1{
       width:300px;
    }
```
### 3.类选择器（.）
 * 用于选择一类的选择器
 * 与元素结合
 ```
   /*类名为small的p元素*/
    p.small{
        background:blue;
    }
 ```

* 多类选择器
```
 /*类名为既为.small也为.round的元素*/
  .small.round{
    border:solid 1px red;
  }
```

### 4.元素选择器【标签选择器】
```
    body{
      margin:0;
      padding:0;
    }
    div{margin:0 auto;}
```
### 5.属性选择器
 * 元素名[属性名=“属性值”]{...}
 ```
 html:

  <span nihao="wohenhao">good</span>

 css:

  span[nihao="wohenhao"]{
  color:red;
  }
 ```
 * 字符串匹配的属性选择符(^ $ *三种，分别对应开始、结尾、包含)
 ```
 html：
  <div class="first">第一个 div 元素。</div>
  <div class="second">第二个 div 元素。</div>
  <div class="test">第三个 div 元素。</div>
  <div class="est">第四个 div 元素。</div>
  <div class="bosses">第五个 div 元素。</div>
  <p class="test">这是段落中的文本。</p>

 ```
  1. ^开头的:"第四个 div 元素"变黄
```
    div[class^="es"]
    {
    background:#ffff00;
    }

```

 2. $结尾："第五个 div 元素"变黄
 ```
     div[class$="es"]
     {
     background:#ffff00;
     }

 ```

3. *包含元素：三、四、五元素变黄
 ```
     div[class*="es"]
     {
     background:#ffff00;
     }

 ```

### 6.伪类和伪元素选择器


1. 种类：
* E:first-child 匹配元素E的第一个子元素
* E:link 匹配所有未被点击的链接
* E:visited 匹配所有已被点击的链接
* E:active 匹配所有已经按下，但未释放
* E:hover 匹配鼠标悬停其上的E元素
* E:focus 匹配获得当前焦点的E元素
* E:enabled 匹配表单中可用元素
* E:disable 匹配表单中不可用元素
* E:checked 匹配表单中被选中的radio或checkbox元素
* E::selection 匹配用户当前选中的元素
* E:root 匹配文档的根元素，对于HTML，就是HTML元素
```
     :root
        {
          background:#ff0000;
        }
```
* E:nth-child(n) 匹配其父元素下的第n个子元素，且为E元素
* E:nth-of-type(n) 匹配父元素下面第n个E元素
2. nth-child与nth-of-child区别
```
<section>
    <div>我是一个普通的div标签</div>
    <p>我是第1个p标签</p>
    <p>我是第2个p标签</p>  <!-- 希望这个变红 -->
</section>
```

```
p:nth-child(2) { color: red; }
````
上面选择是：我是第1个p标签


```
p:nth-of-type(2) { color: red; }
```
上面选择是：我是第2个p标签

3. 选择器效率
   1. 从右到左解析；
   2. 最右边被称为关键选择器：

   

### 7.分组选择器
```
    div1,div2{
    width:30px;
    }
```
### 8.组合选择器
 * 子类选择器
```
    div>p{
    color:red;}
```
 * 后代选择器
```
  div span{
  color:blue;}
```
 * 兄弟选择器（+，~）
 ```
     <ul>
         <li class="l1">List item 1</li>
         <li class="l2">List item 2</li>
         <li class="l3">List item 3</li>
         <li class="l4">List item 4</li>
      </ul>
 ```
   1. +选择器：选择紧接在另一个元素后的元素
      * 会选择List item 2、3、4，背景色变黄
        ```
          li+li{
            background:yellow;
          }

        ```
      * 指会选择List item 3，背景色变黄
        ```
        .l2 +li{
            color:red;
        }
        ```

   2. ~选择器：查找某一个指定元素的后面的所有兄弟结点。
      * 会选择List item 3、4，背景色变黄
        ```
        .l2 ~li{
            color:red;
        }
        ```




