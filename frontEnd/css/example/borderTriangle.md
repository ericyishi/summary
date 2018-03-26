# 纯css制作三角形和梯形
 * 利用border来实现
```
      #box{
        width:100px;
        height:100px;
        background:yellow;
        border-top: 20px solid red;
        border-right:20px solid black;
        border-bottom:20px solid green;
        border-left:20px solid blue;
      }
```

* 观察上图可以发现，border表现为梯形。当减小box的宽高时，中间背景会越变越小；

* 当这一值降到0时，border就变成了四个三角形。

* 那么如果只要一个三角形，那么实际上就是另外三边给隐藏了。
  * 比如想实现上三角形，就将border-left，border-top，border-right设置为transparent即可。或者只把相关的左右两边设为透明即可，上面根本不用去管。

       ```
        #triangle-up {
            width: 0;
            height: 0;
            overflow:hidden;/*用于解决兼容性问题*/
            border-left: 50px solid transparent;
            border-right: 50px solid transparent;
            border-bottom:50px solid red;
        }
       ```

[demo](borderTriangle.html)