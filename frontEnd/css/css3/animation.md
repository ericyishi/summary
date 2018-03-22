# 动画 animation
* animation是一个复合属性
```
animation: 动画名 持续时间
```

### 八大属性

  1. animation-name 设置对象所应用的动画名称
     * 一个元素可以对应多个动画，只需逗号隔开。默认为none
  2. animation-duration 设置对象动画的持续时间
     * 单位秒s。默认为0；
  3. animation-timing-function 动画播放方式
     * ease(平滑过渡) 默认值
     * linear（匀速）
     * ease-in（加速）
     * ease-out（减速）
     * ease-in-out （先快后慢）
     * cubic-bezier （自定义，贝塞尔曲线）
  4. animation-delay 设置对象动画延迟的时间
     * 单位秒s。默认为0；
  5. animation-iteration-count
     * infinite：无限循环
     * number: 循环的次数
  6. animation-direction
     * normal：正常方向
     * reverse：反方向运行
     * alternate：动画先正常运行再反方向运行，并持续交替运行
     * alternate-reverse：动画先反运行再正方向运行，并持续交替运行
  7. animation-play-state 设置对象动画的状态
     * running。默认为none
     * paused;
     **animation-play-state:paused; 当鼠标经过时动画停止，鼠标移开动画继续执行**
  8.  animation-fill-mode 设置对象动画时间之外的状态
     * none:默认值，不设置对象动画之外的状态
     * forwards:设置后，让动画停留在结束时候的效果【注意单词后面有s】
     * backwards:设置对象状态为动画开始时的状态
     * both:设置对象状态为动画开始或结束时的状态

 * 定义动画
   ```
   @keyframes 动画名{
    from{

    }
    to{

    }
   }
   ```

   ### 注意
   1. from 里面的对应的原始样式，所以我们可以不用设置；
   2. 也可以使用百分比。0%对应“from”，100%对应“to”；
   3. 如果结束时（to）属性值有left、top等那么开始值（from）里面也一定要有，不然会出现跳帧的感觉。


   [立方体动画](../example/cubicAnimation.md)