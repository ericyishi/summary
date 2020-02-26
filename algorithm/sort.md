# 排序
### 冒泡排序
* 核心思想：相邻两个数进行比较，第一波比较后，最大的数在最后。（每比较完之后，后面的数就减少一个比较 ）
* 要点：外层控制循环次数，内层两数之间进行比较。
* 下面代码是从小到大，如果要从大到小，只需要将判断条件改为：arr[j] < arr[j + 1]
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/bubbleSort.png)
```
【从小到大】
  var examplearr = [1, 4, 55, 32, 21, 44, 2];
  function sortarr(arr) {
  for (var i = 0; i < arr.length - 1; i++) {
   for (var j = 0; j < arr.length - 1 - i; j++) {
    if (arr[j] > arr[j + 1]) {
    var temp = arr[j];
    arr[j] = arr[j + 1];
    arr[j + 1] = temp;
    }
   }
  }
  document.write(arr);
  }

  sortarr(examplearr);
```
```html

#-*- coding: utf-8 -*-
a=[1, 4, 55, 32, 21, 44, 2];
def sortarr(arr):
    for i in range(0,len(arr)-1):
        for j in range(0,len(arr)-1-i):
            if(arr[j]>arr[j+1]):
                temp=arr[j]
                arr[j]=arr[j+1]
                arr[j+1]=temp
    print(arr)

sortarr(a)
```

```
1, 2, 4, 21, 32, 44, 55
```

【冒泡算法的优化】
```
 //循环控制趟数
        var s = 0;
        var s1 = 0;
 
        //为什么 isSort = true，不能写在循环外面
        //因为 交换位置 isSort = false.  isSort的值永远是false 。我们要检测的是某一趟是否交换位置
 
        for (var i = 0; i < array.length - 1; i++) {
            var isSort = true; //假设排序ok
            //控制两两比较的次数       1--6      2--5   4 3 2 1
            for (var j = 0; j < array.length - 1 - i; j++) {
                //两两比较   从小到大排序
 
                //如果交换位置，说明没有排序好，如果不交换位置，说明排序好
                if (array[j] > array[j + 1]) {
                    isSort = false;  //没有排序好呢
                    //交换位置
                    var tmp = array[j];
                    array[j] = array[j + 1];
                    array[j + 1] = tmp;
                }
 
                s++; //记录内循环的次数
            }
            s1++;  //记录外循环的次数
 
            if(isSort) {
                //如果排序好了
                break;
            }
        }
 
        console.log("内循环的次数" + s);
        console.log("外循环的次数" + s1);
        console.log(array);

```

### 选择排序
* 核心思想：选择排序，让数组中的每一个数，依次与后面的数进行比较，如果前面的数大于后面的数，就进行位置的交换。
* 下面代码是从小到大，如果要从大到小，只需要将判断条件改为：arr[j] < arr[j + 1]
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/selectSort.png)
```
【从小到大】
     function selectSort(arr){
           document.write("循环前："+arr+"<br/>");
           for (var i = 0; i < arr.length -1 ; i++) {
               //这个是和第一个数的比较的数
               for (var j = i+1; j < arr.length; j++) {
                   //定义一个临时的变量，用来交换变量
                   var temp ;
                   if(arr[i]>arr[j]){
                       temp =  arr[i];
                       arr[i] = arr[j];
                       arr[j] = temp;
                   }
               }
               console.log(i,arr);

           }
           //打印最后的排序
           document.write(arr);
       }

    selectSort(examplearr);
```
 def selectarr(arr):
    for i in range(0,len(arr)-1):
        for j in range(i+1,len(arr)):
            if(arr[i]>arr[j]):
                temp=arr[j]
                arr[j]=arr[i]
                arr[i]=temp
    print(arr)

selectarr(a)
```    
```

```
1, 2, 4, 21, 32, 44, 55
```

