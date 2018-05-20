# 渲染模式
* Doctype规范决定了浏览器将会采用哪种文本模式去渲染html页面。
### 种类
1. 诡异模式（Quirks mode，也有翻译为兼容模式、怪异模式的）
2. 标准模式（Standards mode）
3. 几乎标准模式（Almost standards mode）【这种方式很少提及】

### 触发条件
* 如果文档中没有DOCTYPE将触发文档的怪异模式。怪异模式最明显的影响是会触发怪异盒模型。
* 可通过js获取document.compatMode的值来获取当前浏览器所采用的文本模式，该值一般有两个：
  * BackCompat(代表诡异文本模式)
  * CSS1Compat(代表标准文本模式)
### 标准盒模型 & 怪异盒模型
* 区别主要体现在width上:
  1. 标准盒模型，width=内容宽度
  2. 怪异盒模型，width=内容宽度+padding+border
     * 给该元素加一条样式，可以直接将该元素的盒模型变成怪异盒模型
       ```
        box-sizing：boeder-box
       ```