# 爬取文章类型网站数据到本地数据库
### 目标网站
* 以http://blog.jobbole.com/all-posts/为例

### 分析
* 通过列表页中每条概述，进入详情页，进行需要内容爬取。
* 当本页分析完，进入下一页解析，直至最终页。

### 步骤
1. 获取当前列表页的所有概述页
2. 对所有概述页进行遍历，为了进入详情页抓取数据
3. 如果有下一页图标，那么进入列表页的下一页
    ```
      def parse(self, response):
        post_nodes = response.css("#archive .floated-thumb .post-thumb a")
        for post_node in post_nodes:
            # 帖子的url地址
            post_url = post_node.css("::attr(href)").extract_first("")
            # 贴子的封面图的url
            image_url = post_node.css("img::attr(src)").extract_first("")
            # 将控制权交给Scrapy的Request根据帖子的url进行下载
            # 回调函数callback后面跟的是进入页面后，进行处理的函数
            # Request中meta参数的作用是传递信息给下一个函数（这里就是回调parse_detail）
            # urljoin是为了避免链接没有带域名，自动加上域名，如果有则不会拼接
            yield Request(url=parse.urljoin(response.url, post_url), meta={"front_image_url": image_url},
                          callback=self.parse_detail)

        #提取下一页并交给scrapy进行下载
        next_url = response.css(".next.page-numbers::attr(href)").extract_first("")
        if next_url:#如果有下一页那么就递归调用
            yield Request(url=parse.urljoin(response.url, next_url), callback=self.parse)
    ```
4. 详情页的处理方法
    1. item类
        1. 什么是item
           * Scrapy 提供了 Item 类来对数据进行封装，方便将网页解析后获取的数据进行格式化，便于数据的传递与进一步的操作

        2. 特点
           * 直接继承 scrapy 的 Item 类即可
           * 可以定义相应的属性字段来对数据进行存储，其字段类型为 scrapy.Field()。 Scrapy 只提供了 Field() 一种字段类型，可以用来存储任意类型的数据。

        3. 如何使用
           * 定义在items.py中
           * Field()通常两个函数，一个是input_processor(输入时候的对数据进行处理)，一个是output_processor(输出的时候对数据进行处理)
             ```
              # 自定义了一个item，里面定义的就是需要的字段
                class JobBoleArticleItem(scrapy.Item):
                  title=scrapy.Field()
                  create_date=scrapy.Field(
                      input_processor=MapCompose(date_convert)
                  )
                  url=scrapy.Field()
                  url_object_id=scrapy.Field()
                  front_image_url=scrapy.Field(
                      output_processor=MapCompose(return_value)
                  )
                  praise_nums=scrapy.Field(
                      input_processor=MapCompose(get_nums)
                  )
                  comment_nums=scrapy.Field(
                      input_processor=MapCompose(get_nums)
                  )
                  fav_nums=scrapy.Field(
                      input_processor=MapCompose(get_nums)
                  )
                  tags=scrapy.Field()
                  content=scrapy.Field()
             ```

    2. itemLoader
        1. 什么是itemLoader
           * 一种容器，实现直白高效字段提取
           * 它可以接收一个 Item 实例来指定要加载的 Item, 然后指定 response 或者 selector 来确定要解析的内容，最后提供了 add_css()、 add_xpath() 方法来对通过 css 、 xpath 解析赋值，还有 add_value() 方法来单独进行赋值。
        2. 好处
           * 解决直接赋值取值各种css和xpath选择器，充斥整个代码逻辑，没有规则，不利于维护
           * 解决直接赋值对于一个字段的预处理的不明确，以及出现在主逻辑中的写法
        3. 如何使用
           1. 声明一个itemLoader容器
              * 可以使用默认的itemLoader，但是ItemLoader 默认都会返回一个 list，我们要对数据进一步处理所以自定义了一个
              * 定义在items.py文件中
              * 自定义itemloader继承于ItemLoader
              ```
               class ArticleItemLoader(ItemLoader):
                # 输出的时候，统一去数组的第一位
                default_output_processor = TakeFirst()
              ```
               * 在 ItemLoader 类中，提供了 default_output_processor 和 default_input_processor 来对数据的输入与输出进行解析，
               * 如果我们需要只获取解析后的第一个值，可以指定 default_output_processor 为 TakeFirst() 即可，这是 Scrapy 提供的一个解析处理类， 用来获取第一个元素
           2. 接收一个 Item 实例来指定要加载的 Item，这里是JobBoleArticleItem()
           3. 往item实例中添加值
              * 通过 ItemLoader 的 add_css/add_xpath/add_value 来进行赋值。
           3. 加载容器.load_item()
           4. 把item传yield给Scrapy，交给pipelines中再做处理
              * 将Item 实例传递到 pipeline 进行处理了
    ```
       def parse_detail(self, response):
        # 这个页面已经进入每个帖子详情页了
        # 通过response.meta.get方式获取meta传过来的值
        front_image_url = response.meta.get("front_image_url", "")  # 文章封面图
         # 通过item loader加载item
         # 实例化一个容器，接收item实例和response参数
         # 这里自己实例化了一个item叫JobBoleArticalItem（在items中定义的）
         # 也就是把值，装到JobBoleArticalItem中去
        item_loader = ArticleItemLoader(item=JobBoleArticleItem(), response=response)
        item_loader.add_css("title", ".entry-header h1::text")
        item_loader.add_value("url", response.url)
         # 这里是调用自定义的get_md5方法,将此作为id，方便以后查找
        item_loader.add_value("url_object_id", get_md5(response.url))
        item_loader.add_css("create_date", "p.entry-meta-hide-on-mobile::text")
        item_loader.add_value("front_image_url", [front_image_url])
        item_loader.add_css("praise_nums", ".vote-post-up h10::text")
        item_loader.add_css("comment_nums", "a[href='#article-comment'] span::text")
        item_loader.add_css("fav_nums", ".bookmark-btn::text")
        item_loader.add_css("tags", "p.entry-meta-hide-on-mobile a::text")
        item_loader.add_css("content", "div.entry")
        # 加载load_item()
        article_item = item_loader.load_item()
        # yield将这个item返给scrapy,传给pipelines，但是需要在setting中开启
        yield article_item
    ```
5. 存储数据库
   1. 此时item实例传给pipelines中
      1. 什么是pipelines
         * Scrapy 提供了 pipeline 模块来执行保存数据的操作
      2. 如何使用
         * 要使用pipelines还需要在settings.py中解除对应的注释。
           ```
            ITEM_PIPELINES = {
              'ArticalSpider.pipelines.ArticalspiderPipeline': 300,
            }
           ```
           * 前面代表pipeline的名字，后面的数字是执行的优先级，数值越小越高
   2. 我们希望将item中的值都保存在本地数据库中
      1. 本地数据库中创建数据表，以及相应的字段
      2. 下载数据库的模块（pymysql或者mysqlclient都可以）
      3. 编写存储到数据库的pipeline
         ```
          class MysqlTwistedPipline(object):
            def __init__(self, dbpool):
                self.dbpool = dbpool

            # 会在初始化的时候将setting.py文件传进来，这样就可以取里面的所有内容了
            @classmethod
            def from_settings(cls, settings):
                dbparms = dict(
                        host=settings["MYSQL_HOST"],
                        db=settings["MYSQL_DBNAME"],
                        user=settings["MYSQL_USER"],
                        passwd=settings["MYSQL_PASSWORD"],
                        charset='utf8',
                        cursorclass=MySQLdb.cursors.DictCursor,
                        # cursorclass=pymysql.cursors.DictCursor,
                        use_unicode=True,
                )
                dbpool = adbapi.ConnectionPool("MySQLdb", **dbparms)
                # dbpool = adbapi.ConnectionPool("pymysql", **dbparms)

                return cls(dbpool)

            def process_item(self, item, spider):
                # 使用twisted将mysql插入变成异步执行
                query = self.dbpool.runInteraction(self.do_insert, item)
                query.addErrback(self.handle_error, item, spider)  # 处理异常

            def handle_error(self, failure, item, spider):
                # 处理异步插入的异常
                print(failure)

            def do_insert(self, cursor, item):
                # 执行具体的插入

                insert_sql = """
                    insert into posts_spider(title, create_date,url,url_object_id, front_image_url,praise_nums, comment_nums,fav_nums,tags,content)
                    VALUES (%s, %s, %s, %s,%s,  %s, %s,%s, %s, %s)
                """
                print(item["title"])
                print(item["create_date"])
                print(item["url"])
                print(item["url_object_id"])
                print(item["front_image_url"])

                print(item["praise_nums"])
                print(item["comment_nums"])
                print(item["fav_nums"])
                print(item["tags"])
                print(item["content"])
                cursor.execute(insert_sql, (
                item["title"], item["create_date"], item["url"], item["url_object_id"], item["front_image_url"],
                item["praise_nums"], item["comment_nums"], item["fav_nums"], item["tags"],
                item["content"]))

         ```
         * 这里实现了MySQL 存储的异步操作，在 Scrapy 对数据的处理是同步执行的，当爬取数据量很大的时候，会出现插入数据的速度跟不上网页的爬取解析速度，造成阻塞，为了解决这个问题需要将 MySQL 的数据存储异步化。Python 中提供了 Twisted 框架来实现异步操作，该框架提供了一个连接池，通过连接池可以实现数据插入 MySQL 的异步化。
         * 连接数据库的模块使用pymysql和mysqlclient都可以
         * 通过配置文件的方式，传入参数的，而非硬编码
         * 在插入数据操作的时候，一定要注意参数名，以及个数，否则会报错，无法插入到本地数据库的

      4. 定义完成后，别忘了把这个pipeline在setting中注册一下
         ```
            ITEM_PIPELINES = {
              'ArticalSpider.pipelines.MysqlTwistedPipline': 1,
           }
         ```

     ### 成果
      [查看项目](https://github.com/ericyishi/Spider_jobbole)
