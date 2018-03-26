# 适用于整数，用于判断这个数的位数
```
  var count=0;
  while(parseInt(num)>0){//一定要使用parseInt!关键所在
      num/=10;
      count++;
  }
  console.log(count);
```