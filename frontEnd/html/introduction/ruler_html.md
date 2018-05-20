# HTML规范
### <!DOCTYPE> 声明
* html文件的第一行，声明帮助浏览器何种方式解析网页并正确地显示网页。
* !DOCTYPE> 不是 HTML 标签。它为浏览器提供一项信息（声明），即 HTML 是用什么版本编写的。
```
<!-- HTML5的声明 -->

<!DOCTYPE html>
```

### head部分
##### meta标签
* 元数据（metadata）是关于数据的信息。
* 标签提供关于 HTML 文档的元数据。元数据不会显示在页面上，但是对于机器是可读的。
* meta 元素被用于规定页面的描述、关键词、文档的作者、最后修改时间以及其他元数据。
* 标签始终位于 head 元素中。
1. 设置字符编码
* 必须声明文档的编码charset
* 字符编码必须是在 meta中的**第一行**。推荐使用UTF-8编码
    ```
     <meta charset="utf-8">
    ```
2. 根据页面内容和需求填写适当的keywords和description
   * 目的是为了一些搜索引擎搜索到你的网页
    ```
     <meta name="description" content="内容描述">
     <meta name="keywords" content="关键词">
    ```
##### title标签
* 浏览器会以特殊的方式来使用标题，并且通常把它放置在浏览器窗口的标题栏或状态栏上。
* 当把文档加入用户的链接列表或者收藏夹或书签列表时，标题将成为该文档链接的默认名称。

##### 资源引入
1. 网页图标ico
   ```
    <link rel="shortcut icon" href="path/to/favicon.ico">
   ```
2. 引入css
   ```
    <link rel="stylesheet" href="page.css">
   ```
   * 使用link将css文件引入，并置于head中；使用script将js文件引入，并置于body底部

### body部分
##### 结构优化
1. 尽量遵循 HTML 标准和语义。任何时候都要尽量使用最少的标签并保持最小的复杂度。
2. 结构顺序和视觉顺序基本保持一致，按照从上至下、从左到右的视觉顺序书写HTML结构。【有时为了便于搜索引擎抓取，也会将重要内容在HTML结构顺序上提前】
3. 结构、表现、行为三者分离，避免内联样式
4. 可以在大的模块之间用空行隔开，使模块更清晰

##### 语义化
* 判断网页标签语义化是否良好的一个简单方法：去掉样式，看网页结构是否组织良好有序，是否仍然有很好的可读性
1. 尽可能少地使用无语义标签span和div
2. 在语义不明显，既可以使用p也可以使用div的地方，尽量用p
3. 在既可以使用div也可以使用section的地方，尽量用section
4. 不要使用纯样式标签，如b、u等，而改用CSS设置

##### 命名规范
1. class 必须代表相应模块或部件的内容或功能，不得以样式信息进行命名
   ```
   //错误写法的例子：
    <div class="left"></div>
   ```
2. 避免id与name重名。因为IE7-浏览器会混淆元素的 id 和 name 属性， document.getElementById 可能获得不期望的元素。

##### 标签
1. 标签名全部小写，虽然html标签不区分大小写。

##### 注释
* 用于标注html页面结构
* 允许只有开始标注
  ```
       <!-- 导航 -->
       <ul class="m-nav">
           <li><a href="#">NAV1</a></li>
           <li><a href="#">NAV2</a></li>
           <!-- 更多导航项 -->
       </ul>
       <!-- /导航 -->
  ```

##### 标签属性
1. 属性和值全部小写
2. 属性值必须用双引号包围
3. 自定义属性建议以 xxx- 为前缀，推荐使用 data-
   ```
    <ul>
    <li data-animal-type="鸟类">喜鹊</li>
    <li data-animal-type="鱼类">金枪鱼</li>
    <li data-animal-type="蜘蛛">蝇虎</li>
    </ul>
   ```
4. 可以省略style标签和script标签的type属性

##### 属性顺序!
```
 id
 class
 name
 data-xxx
 src, for, type, href
 title, alt
 aria-xxx, role
```

##### 元素标签的注意事项
* 图片img标签
   1. 禁止 img 的 src 取值为空，否则会导致部分浏览器重新加载一次当前页面
   2. 为图片添加 alt 属性，提高图片加载失败时的用户体验
   3. 避免为 img 添加不必要的 title 属性，多余的 title 影响看图体验
   4. 为图片添加 width 和 height 属性，以避免页面抖动！！【一定要设置】
   5. 有实际意义的图片采用 img 标签实现，装饰性的图片采用 CSS 背景图实现
* 表单元素
   1. 有文本标题的控件使用 label 标签将其与其标题相关联。最好将控件置于 label 内，以减少不必要的 id
       ```
        <label><input type="checkbox" name="confirm" value="on"> 我已确认上述条款</label>
       ```
   2. 使用 button 元素时必须指明 type 属性值。因为button 元素的默认 type 为 submit，如果被置于 form 元素中，点击后将导致表单提交
       ```
        <button type="button">取消</button>
       ```
* 视频video和音频audio
   1. 在支持 HTML5 的浏览器中优先使用 audio 和 video 标签来定义音视频元素，并使用退化到插件的方式来对多浏览器进行支持
       ```
        <audio controls>
            <source src="audio.mp3" type="audio/mpeg">
            <source src="audio.ogg" type="audio/ogg">
            <object width="100" height="50" data="audio.mp3">
                <embed width="100" height="50" src="audio.swf">
            </object>
        </audio>

        <video width="100" height="50" controls>
            <source src="video.mp4" type="video/mp4">
            <source src="video.ogg" type="video/ogg">
            <object width="100" height="50" data="video.mp4">
                <embed width="100" height="50" src="video.swf">
            </object>
        </video>
       ```
       * 例中使用了 3中不同的音视频格式。HTML 5 <video> 元素会尝试播放以 mp3、ogg 格式中的一种来播放视频。如果均失败，则回退到 <embed> 元素。
       * audio元素同理。



