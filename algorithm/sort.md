# 排序
### 冒泡排序【从小到大】
* 核心思想：相邻两个数进行比较，第一波比较后，最大的数在最后。（每比较完之后，后面的数就减少一个比较 ）
* 要点：外层控制循环次数，内层两数之间进行比较。
* 下面代码是从小到大，如果要从大到小，只需要将判断条件改为：arr[j] < arr[j + 1]
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/bubbleSort.png)
```
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

```
2,4,7,21,32,44,55
```

### 选择排序【从小到大】
* 核心思想：选择排序，让数组中的每一个数，依次与后面的数进行比较，如果前面的数大于后面的数，就进行位置的交换。
* 下面代码是从小到大，如果要从大到小，只需要将判断条件改为：arr[j] < arr[j + 1]
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/selectSort.png)
```
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

```
2,4,7,21,32,44,55
```

