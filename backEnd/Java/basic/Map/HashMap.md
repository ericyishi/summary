# HashMap
### 特点
* 是一个最常用的Map,它根据键的HashCode值存储数据。
* Map中的集合，元素是成对存在的(理解为夫妻)。每个元素由键与值两部分组成。
* 根据键可以直接获取它的值，具有很快的访问速度。
* HashMap最多只允许一条记录的键为Null;
* 允许多条记录的值为 Null;
* HashMap不支持线程的同步，即任一时刻可以有多个线程同时写HashMap;可能会导致数据的不一致。如果需要同步，可以用 Collections的synchronizedMap方法使HashMap具有同步的能力。
