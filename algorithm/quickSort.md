# 快速排序
### 说明
```
 通过一趟排序将要排序的数据分割成独立的两部分，
 其中一部分的所有数据都比另外一部分的所有数据都要小，
 然后再按此方法对这两部分数据分别进行快速排序，
 整个排序过程可以递归进行，以此达到整个数据变成有序序列。
```
### demo
```
 class QuickSort:
    def devide(self, list, start, end):
        # 每次都以最右边的元素作为基准值
        baseNum = list[end]
        # start一旦等于end，就说明左右两个指针合并到了同一位置，可以结束此轮循环
        while start < end:
            # 从左边开始遍历，如果比基准值小，就继续向右走
            while (start < end and list[start] <= baseNum):
                start += 1
            # 上面的while循环结束时，就说明当前的list[start]的值比基准值大，应与基准值进行交换
            if (start < end):
                temp = list[start]
                list[start] = list[end]
                list[end] = temp
                # 交换后，此时的那个被调换的值也同时调到了正确的位置(基准值右边)，因此右边也要同时向前移动一位
                end -= 1
            while (start < end and list[end] >= baseNum):
                # 从右边开始遍历，如果比基准值大，就继续向左走
                end -= 1
                # 上面的while循环结束时，就说明当前的a[end]的值比基准值小，应与基准值进行交换
            if(start < end):
				# //交换
                temp = list[start]
                list[start] = list[end]
                list[end] = temp
                # //交换后，此时的那个被调换的值也同时调到了正确的位置(基准值左边)，因此左边也要同时向后移动一位
                start+=1
        return end

    def sort(self,list,start,end):
        if(start>end):
            # 如果只有一个元素，就不用再排下去了
            return
        else:
            partition=self.devide(list,start,end)
            self.sort(list,start,partition-1)
            self.sort(list,partition+1,end)


if __name__=="__main__":
  mylist=[2,33,12,7,8,888,1,14,12]
  qs=QuickSort()
  qs.sort(mylist,0,len(mylist)-1)
  print(mylist) #[1, 2, 7, 8, 12, 12, 14, 33, 888]
```