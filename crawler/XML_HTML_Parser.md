# xml html解析器

### lxml解析器
* lxml 是 一个HTML/XML的解析器
* 主要的功能是如何解析和提取 HTML/XML 数据
* 文档：https://lxml.de/index.html
* 安装
  ```
   pip install lxml
  ```
#### 字符串序列化为html格式
* 将一个带标签的字符串变为了一个完整html结构
```
 # lxml_test.py

 # 使用 lxml 的 etree 库
 from lxml import etree

 text = /'/'/'
 <div>
     <ul>
          <li class="item-0"><a href="link1.html">first item</a></li>
          <li class="item-1"><a href="link2.html">second item</a></li>
          <li class="item-inactive"><a href="link3.html">third item</a></li>
          <li class="item-1"><a href="link4.html">fourth item</a></li>
          <li class="item-0"><a href="link5.html">fifth item</a> # 注意，此处缺少一个 </li> 闭合标签
      </ul>
  </div>
 /'/'/'

 #利用etree.HTML，将字符串解析为HTML文档
 html = etree.HTML(text)

 # 按字符串序列化HTML文档
 result = etree.tostring(html)

 print(result)
```
* 输出结果，为标准的html：
```
 <html><body>
 <div>
     <ul>
          <li class="item-0"><a href="link1.html">first item</a></li>
          <li class="item-1"><a href="link2.html">second item</a></li>
          <li class="item-inactive"><a href="link3.html">third item</a></li>
          <li class="item-1"><a href="link4.html">fourth item</a></li>
          <li class="item-0"><a href="link5.html">fifth item</a></li>
 </ul>
  </div>
 </body></html>
```
#### html文件读取
* 除了直接读取字符串，lxml还支持从文件里读取内容。我们新建一个hello.html文件
  ```
   <!-- hello.html -->

    <div>
        <ul>
             <li class="item-0"><a href="link1.html">first item</a></li>
             <li class="item-1"><a href="link2.html">second item</a></li>
             <li class="item-inactive"><a href="link3.html"><span class="bold">third item</span></a></li>
             <li class="item-1"><a href="link4.html">fourth item</a></li>
             <li class="item-0"><a href="link5.html">fifth item</a></li>
         </ul>
     </div>
  ```
* 再利用 etree.parse() 方法来读取文件
  ```
    # lxml_parse.py

    from lxml import etree

    # 读取外部文件 hello.html
    html = etree.parse('./hello.html')
    result = etree.tostring(html, pretty_print=True)

    print(result)
  ```
#### 使用xpath定位
* 使用上面的html，获取<li> 标签的所有 class属性
  ```
    # xpath_li.py

    from lxml import etree

    html = etree.parse('hello.html')
    result = html.xpath('//li/@class')

    print result
  ```
  ```
    ['item-0', 'item-1', 'item-inactive', 'item-1', 'item-0']
  ```
* 获取最后一个 <li> 的 <a> 的 href
  ```
   # xpath_li.py

   from lxml import etree

   html = etree.parse('hello.html')

   result = html.xpath('//li[last()]/a/@href')
   # 谓语 [last()] 可以找到最后一个元素

   print result # ['link5.html']
  ```
* 获取 class 值为 bold 的标签名
  ```
    # xpath_li.py

    from lxml import etree

    html = etree.parse('hello.html')

    result = html.xpath('//*[@class="bold"]')

    # tag方法可以获取标签名
    print result[0].tag  #span
  ```
### BeautifulSoup解析器
* lxml 一样，Beautiful Soup 也是一个HTML/XML的解析器
* lxml 只会局部遍历，而Beautiful Soup 是基于HTML DOM的，会载入整个文档，解析整个DOM树，因此时间和内存开销都会大很多，所以性能要低于lxml
* 文档：http://beautifulsoup.readthedocs.io/zh_CN/v4.4.0
* 支持css选择器
* 安装：
  ```
   pip install beautifulsoup4
  ```
#### 使用
* 字符串形式以及html文件加载
  ```
   # beautifulsoup4_test.py

    from bs4 import BeautifulSoup

    html = """
    <html><head><title>The Dormouse's story</title></head>
    <body>
    <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
    <p class="story">Once upon a time there were three little sisters; and their names were
    <a href="http://example.com/elsie" class="sister" id="link1"><!-- Elsie --></a>,
    <a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
    <a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
    and they lived at the bottom of a well.</p>
    <p class="story">...</p>
    """

    #创建 Beautiful Soup 对象
    soup = BeautifulSoup(html)

    #打开本地 HTML 文件的方式来创建对象
    #soup = BeautifulSoup(open('index.html'))

    #格式化输出 soup 对象的内容
    print soup.prettify()
  ```
* 没有显示指明解析器，会有警告，我们可以通过soup = BeautifulSoup(html,“lxml”)方式指定lxml解析器
#### 四大对象种类
* Beautiful Soup将复杂HTML文档转换成一个复杂的树形结构,每个节点都是Python对象,所有对象可以归纳为4种:
  1. Tag
  2. NavigableString
  3. BeautifulSoup
  4. Comment
##### 1. Tag
* Tag 通俗点讲就是 HTML 中的一个个标签，例如
  ```
   from bs4 import BeautifulSoup

   html = """
   <html><head><title>The Dormouse's story</title></head>
   <body>
   <p class="title" name="dromouse"><b>The Dormouse's story</b></p>
   <p class="story">Once upon a time there were three little sisters; and their names were
   <a href="http://example.com/elsie" class="sister" id="link1"><!-- Elsie --></a>,
   <a href="http://example.com/lacie" class="sister" id="link2">Lacie</a> and
   <a href="http://example.com/tillie" class="sister" id="link3">Tillie</a>;
   and they lived at the bottom of a well.</p>
   <p class="story">...</p>
   """

   #创建 Beautiful Soup 对象
   soup = BeautifulSoup(html)


   print soup.title
   # <title>The Dormouse's story</title>

   print soup.head
   # <head><title>The Dormouse's story</title></head>

   print soup.a
   # <a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>

   print soup.p
   # <p class="title" name="dromouse"><b>The Dormouse's story</b></p>

   print type(soup.p)
   # <class 'bs4.element.Tag'>
  ```
* 对于 Tag，它有两个重要的属性，是 name 和 attrs
  ```
   print soup.name
   # [document] #soup 对象本身比较特殊，它的 name 即为 [document]

   print soup.head.name
   # head #对于其他内部标签，输出的值便为标签本身的名称

   print soup.p.attrs
   # {'class': ['title'], 'name': 'dromouse'}
   # 在这里，我们把 p 标签的所有属性打印输出了出来，得到的类型是一个字典。

   print soup.p['class'] # soup.p.get('class')
   # ['title'] #还可以利用get方法，传入属性的名称，二者是等价的

   soup.p['class'] = "newClass"
   print soup.p # 可以对这些属性和内容等等进行修改
   # <p class="newClass" name="dromouse"><b>The Dormouse's story</b></p>

   del soup.p['class'] # 还可以对这个属性进行删除
   print soup.p
   # <p name="dromouse"><b>The Dormouse's story</b></p>
  ```
##### 2. NavigableString
* 获取标签的内容.string
  ```
    print soup.p.string
    # The Dormouse's story

    print type(soup.p.string)
    # In [13]: <class 'bs4.element.NavigableString'>
  ```
##### 3. BeautifulSoup
* BeautifulSoup 对象表示的是一个文档的内容。大部分时候,可以把它当作 Tag 对象，是一个特殊的 Tag
  ```
   print type(soup.name)
   # <type 'unicode'>

   print soup.name
   # [document]

   print soup.attrs # 文档本身的属性为空
   # {}
  ```
##### 4. Comment
* Comment 对象是一个特殊类型的 NavigableString 对象，其输出的内容不包括注释符号
  ```
    print soup.a
    # <a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>

    print soup.a.string
    # Elsie

    print type(soup.a.string)
    # <class 'bs4.element.Comment'>
  ```
#### CSS选择器
* 这就是另一种与 find_all 方法有异曲同工之妙的查找方法.
* 写 CSS 时，标签名不加任何修饰，类名前加.，id名前加#
* 在这里我们也可以利用类似的方法来筛选元素，用到的方法是 soup.select()，返回类型是 list
##### （1）通过标签名查找
```
 print soup.select('title')
 #[<title>The Dormouse's story</title>]

 print soup.select('a')
 #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>, <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>, <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]

 print soup.select('b')
 #[<b>The Dormouse's story</b>]
```
##### （2）通过类名查找
```
 print soup.select('.sister')
 #[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>, <a class="sister" href="http://example.com/lacie" id="link2">Lacie</a>, <a class="sister" href="http://example.com/tillie" id="link3">Tillie</a>]
```
##### （3）通过 id 名查找
```
 print soup.select('#link1')
#[<a class="sister" href="http://example.com/elsie" id="link1"><!-- Elsie --></a>]
```
##### 获取内容
* 以上的 select 方法返回的结果都是列表形式，可以遍历形式输出，然后用 get_text() 方法来获取它的内容
```

soup = BeautifulSoup(html, 'lxml')
print type(soup.select('title'))
print soup.select('title')[0].get_text()

for title in soup.select('title'):
    print title.get_text()
```