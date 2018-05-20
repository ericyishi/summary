# HTML5
### 概述
1. HTML5一开始并不是W3C制定的，而是由其他组织，随着被市场接受，W3C将其作为标准推广。
### 特点
#### 1. 降低复杂性
* HTML5
    ```
     <!DOCTYPE html>
    ```
* HTML4
    ```
     <!DOCTYPE html PUBLIC "-//W3C/DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
    ```
#### 2. 标签语义化
* 在HTML5出现之前，我们一般采用DIV+CSS布局我们的页面。但是这样的布局方式不仅使我们的文档结构不够清晰，而且不利于搜索引擎爬虫对我们页面的爬取。为了解决上述缺点，HTML5新增了很多新的语义化标签。
    ```
     <body>
       <header>...</header>
       <nav>...</nav>
       <article>
          <section>
            ...
         </section>
       </article>
       <aside>...</aside>
       <footer>...</footer>
     </body>
    ```

#### 3. 移动端的支持
* 该meta标签的作用是让当前viewport的宽度等于设备的宽度，同时不允许用户手动缩放。当然maximum-scale=1.0, user-scalable=0不是必需的，是否允许用户手动播放根据网站的需求来定，但把width设为width-device基本是必须的，这样能保证不会出现横向滚动条。
    ```
     <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    ```

#### 4. 平稳退化
* 浏览器在遇到不识别的type值时，会将type的值解释为text
    ```
    <input type="number"/>
    <input type="search"/>
    <input type="range"/>
    ```
#### 5. 优化元素特性
* 在html4中，即使两个块级元素元素有相同的链接地址，也必须分开写，因为内联元素不能包含块级元素
    ```
     <h2><a href="/path/to/resource">Headline text</a></h2>
     <p><a href="/path/to/resource">Paragraph text.</a></p>
    ```
* 而在html5中，由于使用了内容模型，<a>元素也可以包含块级元素
    ```
     <a href="/path/to/resource">
         <h2>Headline text</h2>
         <p>Paragraph text.</p>
     </a>
    ```