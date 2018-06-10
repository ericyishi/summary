# JSON-SERVER
### 概述
* 通过根据后端接口字段，建立一个REST风格的API接口，进而实现mock数据实现前端的独立开发
* json-server支持CORS和JSONP跨域请求，支持GET, POST, PUT, PATCH 和 DELETE 方法，也提供了一系列的参数查询方法。
### 安装
```
 npm install json-server -g
```
* 安装完执行json-server -h，若安装成功则显示选项
### 使用
1. 项目中新建一个test.json文件
   ```
     {
       "issues": [
         {
           "id": 101,
           "text": "something is not right"
         },
         {
           "id": 102,
           "text": "crash on login"
         }
       ],
       "total": {
         "data": {
           "exchange_count": "10",
           "share_count": "23",
           "patent_count": "7",
           "article_count": "37",
           "exchangeRecords": []
         },
         "success": true
       }
     }


   ```
2. 运行服务
   ```
    json-server --watch test.json --port 9090
   ```
    * --port 9090 指定端口，默认为3000
3. 访问：http://localhost:9090/
   * 可以看到对应的资源，issues和total
   
### 常用参数
* 分页【关键字：_page】
  * 应用：http://localhost:9090/posts?_page=1
* 排序【关键字：_sort,_order】  
  * _sort后面为要分类的键名
  * http://localhost:9090/posts?_sort=author
* 限定【关键字：_start,_end,_limit】  
  * 类似于js里面的slice函数。slice(_start,_end),从数据里面取出数据。数据不包括_end。
  * _limit可以和_start配合，表示从_start位置开始_limit条数据被取出来。
  * http://localhost:9090/posts?_start=1&_limit=3
* 条件【_gte：大于或等于，_lte：小于或等于，_ne：不等于，[key]_like：模糊搜索】  
  * 应用：http://localhost:3000/posts?author_like=author
* 全局搜索【关键字：q】
  * q为数据中全局搜索传入的参数
  * 应用：http://localhost:3000/posts?q=json   