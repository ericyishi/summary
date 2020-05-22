# 管道
* 当Item在Spider中被收集之后，它将会被传递到Item Pipeline

### 用途
* 验证爬取的数据(检查item包含某些字段，比如说name字段)
* 查重(并丢弃)
* 将爬取结果保存到文件或者数据库中
### 使用
#### 1. 注册
* 在setting文件里注册
  ```
   ITEM_PIPELINES = {
     'mySpider.pipelines.ItcastPipeline': 300,
    }
  ```
  * 这些数字定义在0-1000范围内（0-1000随意设置，数值越低，组件的优先级越高）
#### 2. 定义
* 在pipeline文件中定义
  ```
   import something

    class SomethingPipeline(object):
        def __init__(self):
            # 可选实现，做参数初始化等
            # doing something

        def process_item(self, item, spider):
            # item (Item 对象) – 被爬取的item
            # spider (Spider 对象) – 爬取该item的spider
            # 这个方法必须实现，每个item pipeline组件都需要调用该方法，
            # 这个方法必须返回一个 Item 对象，被丢弃的item将不会被之后的pipeline组件所处理。
            return item

        def open_spider(self, spider):
            # spider (Spider 对象) – 被开启的spider
            # 可选实现，当spider被开启时，这个方法被调用。

        def close_spider(self, spider):
            # spider (Spider 对象) – 被关闭的spider
            # 可选实现，当spider被关闭时，这个方法被调用
  ```
  * process_item必不可少，需要return item

### 实例
* 之前的例子，对每条item转换为json格式，存储在json文件中
* SPIDER文件itcast.py
  ```
   # -*- coding: utf-8 -*-
  import json

  from mySpider.items import ItcastItem
  import scrapy


  class ItcastSpider(scrapy.Spider):
      name = 'itcast'
      allowed_domains = ['itcast.cn']
      start_urls = ['http://www.itcast.cn/channel/teacher.shtml']

      def parse(self, response):


              for each in response.xpath("//div[@class='li_txt']"):

                  # 将我们得到的数据封装到一个 `ItcastItem` 对象
                  item = ItcastItem()
                  # extract()方法返回的都是unicode字符串

                  name = each.xpath("h3/text()").extract()
                  title = each.xpath("h4/text()").extract()
                  info = each.xpath("p/text()").extract()

                  # xpath返回的是包含一个元素的列表


                  item['name'] = name[0]
                  item['title'] = title[0]
                  item['info'] = info[0]

                  yield item

  ```
* pipeline
  ```
    class ItcastPipeline:
    def __init__(self):
        self.filename=open("teacher.json","wb")

    def process_item(self, item, spider):
        jsontext=json.dumps(dict(item), ensure_ascii=False) + "\n"
        self.filename.write(jsontext.encode("utf-8"))
        return item

    def close_spider(self,spider):
        self.filename.close()
  ```
* 运行：srapy crawl itcast后就会将转码后的数据数据一条一条写入json文件中