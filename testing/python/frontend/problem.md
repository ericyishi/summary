# 错误汇总
1. django提交表单报错"You called this URL via POST, but the URL doesn't end in a slash and you have APPEND_SLASH set. "
   * form表单的action属性值结尾没有加”/”

2. 模型类中写了中文，需要编码
   * 问题：如果在str方法中返回中文，在修改和添加时会报ascii的错误
   * 解决：在str()方法中，将返回值字符串末尾添加“.encode('utf-8')”
     ```html
          def __str__(self):
        return self.btitle.encode('utf-8')
     ```
   
3. 汇总下python对应django适配版本

    |Django version|Python version|
    |:---|:---:|
    |1.8|2.7, 3.2 (until the end of 2016), 3.3, 3.4, 3.5|
    |1.9, 1.10|2.7，3.4，3.5|
    |1.11|2.7，3.4，3.5，3.6|  
    |2.0|3.4，3.5，3.6|  
    |2.1|3.5，3.6，3.7|  
    |3.0，3.1|3.6，3.7，3.8|  

4. python和mysql数据库对应版本

    |Connector/Python Version|MySQL Server Versions|Python Versions|Connector Status|
    |:---|:---:|:---:|:---:|
    |8.0|8.0, 5.7, 5.6, 5.5|3.8, 3.7, 3.6, 3.5, 3.4, 2.7|General Availability|
    |2.2 (continues as 8.0)|5.7, 5.6, 5.5|3.5, 3.4, 2.7|Developer Milestone, No releases|
    |2.1|5.7, 5.6, 5.5|3.5, 3.4, 2.7, 2.6|General Availability|
    |2.0|5.7, 5.6, 5.5|3.5, 3.4, 2.7, 2.6|GA, final release on 2016-10-26|
    |1.2|5.7, 5.6, 5.5 (5.1, 5.0, 4.1)|3.4, 3.3, 3.2, 3.1, 2.7, 2.6|GA, final release on 2014-08-22|
    
5. UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)
   * 原因：Python在安装时，默认的编码是ascii，当程序中出现非ascii编码时，python的处理常常会报这样的错
   * 解决：
     * 方案1：Python代码中添加
        ```html
        import sys  
        reload(sys)  
        sys.setdefaultencoding('utf8') 
        ```
     * 方案2:在python的Lib\site-packages文件夹下新建一个sitecustomize.py，内容为：
       ```html
          # encoding=utf8  
           import sys  
           reload(sys) 
           sys.setdefaultencoding('utf8') 
        ```     
         * 此时重启python解释器，执行sys.getdefaultencoding()，发现编码已经被设置为utf8的了，多次重启之后，效果相同
         * 这是因为系统在python启动的时候，自行调用该文件，设置系统的默认编码，而不需要每次都手动的加上解决代码，属于一劳永逸的解决方法。

6. No module named templates.backends.django
   * 原因：因为你的配置让你的django项目没有指向templates文件夹  
   * 解决：
     * ①setting.py配置
        ```html
           TEMPLATES=[
           {
             'DIRS': [os.path.join(BASE_DIR, 'templates')],# 指加入当前路径下的，templates文件夹
            }
            ]
           
        ```
     * ②如果这样配置后还没有，就还有一个可能，当初在创建templates文件夹的时候，第一次没有加s，后来重命名才改的
       * 把这里面的templates换成template就行
       ```html
                 TEMPLATES = [
            {
                'BACKEND': 'django.template.backends.django.DjangoTemplates',
                'DIRS': [os.path.join(BASE_DIR, 'templates')],
                'APP_DIRS': True,
                'OPTIONS': {
                    'context_processors': [
                        'django.template.context_processors.debug',
                        'django.template.context_processors.request',
                        'django.contrib.auth.context_processors.auth',
                        'django.contrib.messages.context_processors.messages',
                    ],
                },
            },
        ]
       ```
7. 'RelatedManager' object is not iterable Django
  * 原因：因为没有拿到对象的值，   
  * 解决：在模板里面加上all {% for p in list.all %} ，或者在视图里面这样写all()
    ```html
      herolist=book.heroinfo_set.all()
      context={'list':herolist}
    ```