# sticky footer
* 如果页面内容不够长的时候，页脚块粘贴在视窗底部；如果内容足够长时，页脚块会被内容向下推送;
* 常用于移动端
### 1.负margin布局方式(兼容性最好)
* 这种负margin的布局方式，是兼容性最佳的布局方案，各大浏览器均可完美兼容，适合各种场景，但使用这种方式的前提是必须要知道footer元素的高度，且结构相对较复杂。

```
    <div class="detail">
        <div class="detail-wrapper clearfix">
            <div class="detail-main">
            </div>
        </div>
        <div class="detail-close">
            <i class="close-icon">X</i>
        </div>
    </div>
```

```
  <style>
          .clearfix { /*解决浏览器兼容性问题*/
              overflow: auto;
              _height: 1%;
          }

          .detail {
              position: fixed;
              z-index: 100;
              top: 0;
              left: 0;
              width: 100%;
              height: 100%;
              overflow: auto;
              background-color: rgba(7, 17, 27, 0.8);
          }

          .detail-wrapper{
              min-height: 100%;/*保证最小高度等于视口的*/
          }

           .detail-main{
               margin-top: 64px;/*需要把关闭的图标的空隙留出来*/
               padding-bottom: 64px;
           }
          .detail-close{
              position: relative;
              width:32px;
              height:32px;
              margin:-64px auto 0 auto;/*距离底边的位置留出来*/
              clear:both;
              font-size:32px;
          }
      </style>
```
[源码](stickyFooterMargin.html)
### 2.flex方式
* 需要考虑兼容性
```
    <div class="detail">
            <div class="detail-main">
            </div>

        <div class="detail-close">
            <i class="close-icon">X</i>
        </div>
    </div>
```

```
       *{
            margin:0;
            padding:0;

        }
         .detail{
             width: 100%;
             height: 100%;
             background-color: rgba(7, 17, 27, 0.8);
             display: flex;
             flex-flow: column;
             min-height: 100vh;
         }
        .detail-main{
            flex: 1;
        }
        .detail-close{
            flex:0;
            width:32px;
            height:32px;
            margin:0 auto;
        }
```

[源码](stickyFooterFlex.html)