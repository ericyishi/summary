
### 1.使用text-align:center;
   * **让元素中的子元素，相对于自身，水平居中。【父元素中设置】**
   * 子元素适用于行内元素。
   * 只针对内容，不适用于容器（里面还嵌套其他内容）。
   * 该样式支持继承

### 2. 使用margin：0 auto;
   * **相对于父元素，自身水平居中【子元素中设置】**
   * 只有对块级元素才适用;
   * 如果要让行内元素也受用，需同时设置display:table

 ```
 <div>
     <span style="display:table;margin: 0 auto;">123</span>
 </div>
 ```

### 3.绝对定位配合其他
   【1】 translate(-50%);
   * IE9以下不支持
```
<div class="box" style="width: 300px;height: 200px;border: solid 1px darkseagreen;position:relative ">
    <span style="position: absolute;left:50%;transform: translate(-50%)">123</span>
</div>
```

   【2】 margin:-50%;
   * 需要在子元素外面加一层包裹层,因为百分比却是相对于包含块的【改变原有结构不建议使用】
   ```
  <div class="box" style="position:relative">
      <div style="position: absolute;left:50%;">
          <span style="margin-left:-50%;">123</span>
      </div>
  </div>
   ```


### 4.flex布局
  * IE10以下不支持
  * 适用于行内元素，块级元素，容器等

  【1】 父元素使用display:flex;justify-content: center;

```
<div class="box" style="display:flex; justify-content: center;">
  <span style="">123</span>
</div>
```

 【2】 父元素使用display:flex;子元素使用margin:0 auto;
 ```
 <div class="box" style="display:flex;">
     <div style="margin:0 auto">
         <p>1</p>
         <p>2</p>
         <p>3</p>
     </div>
 </div>
 ```

### 5.grid布局
  * IE10以下不支持

  【1】父元素使用display:grid;同时父元素使用justify-items:center;或者justify-content:center;
  ```
  <div class="box" style="display:grid;/*justify-content:center;*/justify-items:center;">
      <div style="">
          <p>1</p>
          <p>2</p>
          <p>3</p>
      </div>
  </div>
  ```

  【2】使用grid布局,子元素使用margin:0 auto;或者justify-self:center;
  ```
<div class="box" style="display:grid;">
    <div style="/*justify-self:center;*/margin:0 auto;">
        <p>1</p>
        <p>2</p>
        <p>3</p>
    </div>
</div>
  ```

