# JSON-SERVER
### 概述
* 通过根据后端接口字段，建立一个REST风格的API接口，进而实现mock数据实现前端的独立开发
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