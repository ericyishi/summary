# IE的条件注释
* 在IE浏览器才能解析
* 只有满足条件，才会执行里面的语句
* 从IE10开始，IE浏览器已经不再支持条件注释

### 常见语法
1. 识别IE
   ```
    <!--[if IE]>
    <div class="box" id="box"></div>
    <![endif]-->
   ```
2. 识别不同版本的IE浏览器
   ```
    IE6    [if IE 6]
    IE7    [if IE 7]
    IE8    [if IE 8]
    IE9    [if IE 9]
   ```

   ```
    <!--[if IE 6]>
    <div class="box" id="box"></div>
    <![endif]-->
   ```
   * 只有IE6才能解析上面的内容
3. 识别范围IE
   ```
    gt        　大于(greater than)
    gte     　　大于等于(greater than or equal)
    lt          小于(less than)
    lte         小于等于(less than or equal)
   ```
   ```
    <!--[if lte IE 8]>
    <div class="box" id="box"></div>
    <![endif]-->
   ```
4. 识别非IE
   * 实际上识别的是IE10+浏览器和其他非IE浏览器
   ```
    <!--[if !IE]>
    <div class="box" id="box"></div>
    <![endif]-->
   ```