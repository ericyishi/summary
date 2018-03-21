# 实现1px边框的九宫格
### 考察点：
1. 是否重置默认样式
2. 如何实现1像素（ margin-left: -1px;margin-top:-1px;）
3. box-sizing的应用以及兼容性写法（-webkit-）
4. 保持九宫格在原来的位置 (  div:nth-child(3n+1){margin-left: 0;})
5. hover上去能完整显示效果（要设置z-index）

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        *{
            margin: 0;
            padding:0;
        }

        section{
            width:300px;
            height:300px;
            margin: 10px auto;
        }

        div{
            width:100px;
            height:100px;
            border:solid 1px grey;
            float:left;
            text-align: center;
            line-height:100px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin-left: -1px;
            margin-top:-1px;
            position: relative;
        }
        div:nth-child(3n+1){
            margin-left: 0;
        }
        div:hover{
            border:solid 1px red;
             z-index:2;
        }

    </style>
</head>
<body>
<section>
    <div>1</div>
    <div>2</div>
    <div>3</div>
    <div>4</div>
    <div>5</div>
    <div>6</div>
    <div>7</div>
    <div>8</div>
    <div>9</div>
</section>
</body>
</html>
```