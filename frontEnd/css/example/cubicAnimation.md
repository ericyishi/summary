# 使用css3Transform属性以及animation动画
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .side{
            width:300px;
            height:300px;
        }
        .side1{
            background: lightcoral;
            height:150px;
            transform: skewX(-45deg);
            position: absolute;
            left:800px;
            top:-300px;
            animation: moveSideOne 2s forwards;
        }
        .side2{
            background: lightseagreen;
            position: absolute;
            left: -300px;
            top: 0;
            animation:moveSideTwo 2s forwards;
        }
        .side3{
            background: lightslategray;
            transform: skewY(-45deg);
            width: 150px;
            position: absolute;
            left: 100px;
            top: -300px;
            animation: moveSideThree 2s forwards;
        }
        .line{
            width:300px;
            height:300px;
        }
        .line1{
            border-left:dashed 1px whitesmoke;
            border-bottom:dashed 1px whitesmoke;
            z-index:2;
            position: absolute;
            left: 475px;
            top: 200px;
        }

        .line2{
            height:150px;
            transform: skewX(-45deg);
            border-left:dashed 1px whitesmoke;
            z-index:2;
            position: absolute;
            left: 400px;
            top: 500px;
        }

        @keyframes moveSideOne {
            to{
                left:400px;
                top:200px;
            }
        }
        @keyframes moveSideTwo {
            to{

                transform:rotate(3600deg);
                left: 326px;
                top: 350px;
            }
        }
        @keyframes moveSideThree {
            to{
                left: 626px;
                top: 274px;
            }
        }

    </style>
</head>
<body>
<div class="side side1"></div>
<div class="side side2"></div>
<div class="side side3"></div>
<div class="line line1"></div>
<div class="line line2"></div>
</body>
</html>
```
