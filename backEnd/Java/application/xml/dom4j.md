# dom4j
  * 比较常用的解析开发包，hibernate底层采用
### 使用
  * 如果需要使用dom4j，必须导入jar包
    ```
     dom4j-1.6.1.jar
    ```
  * dom4j 必须使用核心类SaxReader加载xml文档获得Document，通过Document对象获得文档的根元素，然后就可以操作了。
    ```
        public static void main(String[] args) throws Exception {
	    //创建核心对象
	    SAXReader reader = new SAXReader();

	    //获取dom树
	    Document doc = reader.read("web.xml");

	    //获取根节点
	    Element root=doc.getRootElement();

	    //获取其他节点
	    List<Element> list = root.elements();
	    //遍历集合
	    for (Element ele : list) {
	    	//获取servlet-name的标签体
	    	String text = ele.elementText("servlet-name");
	    	//System.out.println(text);

	    	//获取url-pattern标签体
	    	//System.out.println(ele.elementText("url-pattern"));
	    }

	    //获取root的version属性值
	    String value = root.attributeValue("version");
	    System.out.println(value);
    	}
    }
    ```
### 常用API
1. SaxReader对象
   * read(…) 加载执行xml文档
2. Document对象
   * getRootElement() 获得根元素
3. Element对象
   * elements(…) 获得指定名称的所有子元素。可以不指定名称
   * element(…) 获得指定名称第一个子元素。可以不指定名称
   * getName() 获得当前元素的元素名
   * attributeValue(…) 获得指定属性名的属性值
   * elementText(…) 获得指定名称子元素的文本值
   * getText() 获得当前元素的文本内容