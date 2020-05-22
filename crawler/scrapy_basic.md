# Scrapy新建项目与使用

### 新建项目
```
 scrapy startproject 项目名
 scrapy startproject mySpider
```
* 新建项目后，文件结构如下
  ```
   项目名文件夹mySpider
    |
    |----scrapy.cfg【项目的配置文件】
    |
    |----mySpider文件夹【项目的Python模块，将会从这里引用代码】
       |
       |---spiders文件夹【存储爬虫代码目录】
       |---__init__.py
       |---items.py【项目的目标文件】
       |---middlewares.py
       |---pipelines.py【项目的管道文件】
       |---settings.py【项目的设置文件】
  ```
### 修改设置
* settings.py
1. 修改robot协议
   ```
     ROBOTSTXT_OBEY = False
     # 或者直接注释该行
   ```
2. 设置默认header信息
   ```
     DEFAULT_REQUEST_HEADERS = {
       'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
       'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
     }
   ```
### 确定爬取的数据(mySpider/items.py)
* 我们打算抓取：http://www.itcast.cn/channel/teache.shtml 网站里的所有讲师的姓名、职称和个人信息
  1. 打开mySpider目录下的items.py
  2. Item 定义结构化数据字段，用来保存爬取到的数据，有点像Python中的dict，但是提供了一些额外的保护减少错误
  3. 可以通过创建一个 scrapy.Item 类， 并且定义类型为 scrapy.Field的类属性来定义一个Item（可以理解成类似于ORM的映射关系）
  4. 接下来，创建一个ItcastItem 类，和构建item模型（model）
  ```
   import scrapy

   class ItcastItem(scrapy.Item):
       name = scrapy.Field()
       title = scrapy.Field()
       info = scrapy.Field()
  ```
### 制作爬虫 （spiders/itcastSpider.py）
* 爬虫功能要分两步：
  1. 爬数据
     * 在当前目录下输入命令，将在mySpider/spider目录下创建一个名为itcast的爬虫，并指定爬取域的范围
       ```
        scrapy genspider 爬虫名 待爬取网站域名
        scrapy genspider itcast itcast.cn
       ```
       * 就会在spiders文件夹下面创建一个itcast.py的爬虫
         ```
          # -*- coding: utf-8 -*-
          import scrapy

          class ItcastSpider(scrapy.Spider): #要建立一个Spider， 你必须用scrapy.Spider类创建一个子类
              name = 'itcast' # 这个爬虫的识别名称，必须是唯一的，在不同的爬虫必须定义不同的名字
              allowed_domains = ['itcast.cn'] #是搜索的域名范围，也就是爬虫的约束区域
              start_urls = ['http://itcast.cn/'] #爬取的URL元祖/列表。爬虫从这里开始抓取数据，所以，第一次下载的数据将会从这些urls开始。其他子URL将会从这些起始URL中继承性生成。

              def parse(self, response): # 解析的方法，每个初始URL完成下载后将被调用，调用的时候传入从每一个URL传回的Response对象来作为唯一参数
                  pass
         ```
         * start_urls为起始爬取url，可以根据实际情况更改
         * parse() 名字固定不可改，作用为：
           1. 负责解析返回的网页数据(response.body)，提取结构化数据(生成item)
              ```
                def parse(self, response):
                  # self.logger.info('Parse function called on %s', response.body)
                  with open('teacher.html','wb') as f:
                      f.write(response.body)
              ```
           2. 生成需要下一页的URL请求。


  2. 取数据
     * 爬取整个网页完毕，接下来的就是的取过程了，首先观察页面源码,查看我们要提取的结构
       ```
        <div class="li_txt">
          <h3>  xxx  </h3>
          <h4> xxxxx </h4>
          <p> xxxxxxxx </p>
       ```
     * 在parse里面继续处理，提取的数据（scrapy提供了response.xpath、以及response.css方法）存储在items的实例中
     * 我们之前在mySpider/items.py 里定义了一个ItcastItem类。 这里引入进来
       ```
        from mySpider.items import ItcastItem
       ```
     * 对返回的数据进一步处理
       ```
        # self.logger.info('Parse function called on %s', response.body)
            # filename = "teacher.html"
            # with open(filename, 'wb') as f:
            #     f.write(response.body)

            # 存放老师信息的集合
            items = []

            for each in response.xpath("//div[@class='li_txt']"):
                # 将我们得到的数据封装到一个 `ItcastItem` 对象
                item = ItcastItem()
                # extract()方法返回的都是unicode字符串
                name = each.xpath("h3/text()").extract()
                title = each.xpath("h4/text()").extract()
                info = each.xpath("p/text()").extract()

                # xpath返回的是包含一个元素的列表
                # 转码为中文
                item['name'] = name[0].encode("utf-8").decode("utf-8")
                item['title'] = title[0].encode("utf-8").decode("utf-8")
                item['info'] = info[0].encode("utf-8").decode("utf-8")

                items.append(item)

            # 直接返回最后数据
            return items
       ```
       * extract()方法将xpath返回的select对象转化为unicode字符串

* 通常不会整个数据返回，而是拿到一条数据就交pipeline进行处理
  ```
              for each in response.xpath("//div[@class='li_txt']"):
                # 将我们得到的数据封装到一个 `ItcastItem` 对象
                item = ItcastItem()
                # extract()方法返回的都是unicode字符串
                name = each.xpath("h3/text()").extract()
                title = each.xpath("h4/text()").extract()
                info = each.xpath("p/text()").extract()

                # xpath返回的是包含一个元素的列表
                # 转码为中文
                item['name'] = name[0].encode("utf-8").decode("utf-8")
                item['title'] = title[0].encode("utf-8").decode("utf-8")
                item['info'] = info[0].encode("utf-8").decode("utf-8")



            # 使用yield好处，每执行到一个 yield 语句就会中断，并返回一个迭代值，下次执行时从 yield 的下一个语句继续执行
               yield items

  ```
### 运行
```
 scrapy crawl 爬虫名
 scrapy crawl itcast
```

### 输出
* scrapy保存信息的最简单的方法主要有四种，-o 输出指定格式的文件
* 是保存上面return的内容
```
  # json格式，默认为Unicode编码
  scrapy crawl itcast -o teachers.json

  # json lines格式，默认为Unicode编码
  scrapy crawl itcast -o teachers.jsonl

  # csv 逗号表达式，可用Excel打开
  scrapy crawl itcast -o teachers.csv

  # xml格式
  scrapy crawl itcast -o teachers.xml
```