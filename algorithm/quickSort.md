# 快速排序
### 说明
```
 [30,18,89,32,17,5,99]
 拿出数列中第一个数作为x=30基准数，有两个“游标”,一个low从左往右，一个high从右往左
 每走一次就与基准数比大小，low要小于基准往右走，不符合停止；
 high要大于基准往左走，不符合停止；
 low和high都不满足时候，交换位置；
 当low和high重叠，此时位置就是基准数插入的位置；
 同时基础数左右分成两部分，再单独拿出，把第一个作为基准数进行比较。
 low=18，判断比30小，往下走到89>30;再看high=99>30，往左走high=5<30,交换89和5的位置又可以继续往下走
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
```
#PYTHON
   def quick_sort(alist, start, end):
      """快速排序"""

      # 递归的退出条件
      if start >= end:
          return

      # 设定起始元素为要寻找位置的基准元素,此处设置为最左侧元素为基准
      mid = alist[start]

      # low为序列左边的由左向右移动的游标
      low = start

      # high为序列右边的由右向左移动的游标
      high = end

      while low < high:
          # 如果low与high未重合，high指向的元素不比基准元素小，则high向左移动
          while low < high and alist[high] >= mid:
              high -= 1
          # 将high指向的元素放到low的位置上
          alist[low] = alist[high]

          # 如果low与high未重合，low指向的元素比基准元素小，则low向右移动
          while low < high and alist[low] < mid:
              low += 1
          # 将low指向的元素放到high的位置上
          alist[high] = alist[low]

      # 退出循环后，low与high重合，此时所指位置为基准元素的正确位置
      # 将基准元素放到该位置
      alist[low] = mid

      # 对基准元素左边的子序列进行快速排序
      quick_sort(alist, start, low-1)

      # 对基准元素右边的子序列进行快速排序
      quick_sort(alist, low+1, end)


  alist = [54,26,93,17,77,31,44,55,20]
  quick_sort(alist,0,len(alist)-1)
  print(alist)
```