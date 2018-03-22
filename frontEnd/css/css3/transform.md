# 变形属性transform


### 1.旋转 rotate
 * 别忘了单位deg
 ```
    .box1{
            transform: rotate(90deg);
        }
 ```
* 默认中心点：transform-origin(50%,50%,0);中心点的位置。
  1. 旋转物体是一个矩形，设置transform-origin(100%,0,0)，中心点为矩形右上点；
  2. 旋转物体是一个矩形，设置transform-origin(0,100%,0)，中心点为矩形左下点；
  3. 旋转物体是一个矩形，设置transform-origin(100%,0,0)，中心点为矩形右上点；
  4. 旋转物体是一个矩形，设置transform-origin(100%,100%,0)，中心点为矩形右下点；
* rotateX(deg):沿着x轴旋转
* rotateY(deg):沿着y轴旋转
* rotateZ(deg):沿着Z轴旋转
* rotate(deg):2D,平面上旋转，看着效果跟rotateZ(deg)效果一致

* 默认旋转顺时针，负值为逆时针。

### 2.移动 translate
* translateX(x):沿着x轴移动
* translateY(y):沿着y轴移动
* translateZ(y):沿着Z轴移动

### 3.缩放 scale
* 缩放基数为1
* scale(n);等同于同时设置scaleX(n),scaleY(n);
* 默认基线是上边，如果增长，上边固定，沿着下边进行变化。所以希望下边固定，沿着上边缩放，需要设置transform-origin(100%,100%,0)
### 4.扭曲 skew
* 单位也是deg
* skew(deg)等同于skewX(deg)
* skew(deg,deg)不！等同于分别设置skewX(deg);skewY(deg);

### 5.矩阵 matrix

##### 注意:
1. 如果一个元素上有对应多个属性值，放在一个transfrom里面，空格隔开
```
transform: translate(-100px) scale(0.3) rotate(30deg);
```

2. 配合着transform-origin来改变变形基点。