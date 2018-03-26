# emmet
* Emmet是一款编辑器插件，支持多种编辑器支持。在前端开发中，Emmet 使用缩写语法快速编写 HTML、CSS 以及实现其他的功能，极大的提高前端开发效率。
* 现代开发工具（webstorm、atom）中已经集成了，所以可以直接使用相关语法。
* 语法输入完成后，按“Tab”扩展
#### 常用命令
 * 生成HTML5文档类型：
    ```
        html：5或者！
    ```
 * 添加内容:
    ```
        div{hello}
        生成的内容：<div>hello</div>
    ```
 *  生成n个无意义的的内容：
    ```
       lorem个数n
       例如：lorem7
       生成的内容为：Lorem ipsum dolor sit amet, consectetur adipisicing.
    ```
 * 生成序号【使用$】：
    ```
      div{$}*5
      生成的内容：
      <div>1</div>
      <div>2</div>
      <div>3</div>
      <div>4</div>
      <div>5</div>
      div.item$*5
      生成的内容：
      <div class="item1"></div>
      <div class="item2"></div>
      <div class="item3"></div>
      <div class="item4"></div>
      <div class="item5"></div>
    ```

[更多语法参看官网文档](https://docs.emmet.io/cheat-sheet/)

