# 排序
* 稳定性也很重要，相同的key值再排序后，也不会改变顺序

### 冒泡排序
* 核心思想：相邻两个数进行比较（1与2,2与3,3与4），第一波比较后，最大的数在最后。（每比较完之后，后面的数就减少一个比较 ）
* 要点：外层控制循环次数，内层两数之间进行比较。
* 下面代码是从小到大，如果要从大到小，只需要将判断条件改为：arr[j] < arr[j + 1]
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/bubbleSort.png)
```
【从小到大】
# js
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
#python
#-*- coding: utf-8 -*-
a=[1, 4, 55, 32, 21, 44, 2];
def sortarr(arr):
    for i in range(0,len(arr)-1):
        for j in range(0,len(arr)-1-i):
            if(arr[j]>arr[j+1]):
                arr[j],arr[j+1]=arr[j+1],arr[j]

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
* 核心思想：在未排序序列中找到最小（大）的，存在序列的起始位置，然后从剩余未排序的，继续寻找最小（大），放在已排序序列的末尾
* 注意循环长度不用-1，冒泡排序因为存在与后一个比较，如果不减1会数组越界
* ![image](https://github.com/ericyishi/img-folder/blob/master/summary/selectSort.png)
```
a=[21,44,4,1,32,55,2]
 def selectarr(arr):
    for i in range(0,len(arr)):
      min_index=i
      for j in range(i+1,len(arr)):
        if arr[j]<arr[min_index]:
           min_index=j
      if min_index!=i:
        arr[i],arr[min_index]= arr[min_index],arr[i]

selectarr(a)
```    


```
1, 2, 4, 21, 32, 44, 55
```

### 插入排序
* 对于未排序的数据，在已排好序列从后往前比较，找到对应位置插入
```
 def insert_sort(alist):
    # 从第二个位置，即下标为1的元素开始向前插入
    for i in range(1, len(alist)):
        # 从第i个元素开始向前比较，如果小于前一个元素，交换位置
        for j in range(i, 0, -1):
            if alist[j] < alist[j-1]:
                alist[j], alist[j-1] = alist[j-1], alist[j]

  alist = [54,26,93,17,77,31,44,55,20]3
  insert_sort(alist)
  print(alist)
```