# urllib��
* ��python�Դ�����http����Ŀ�
* urllib2 �� Python2.7 �Դ���ģ��(����Ҫ���أ����뼴��ʹ��)
  * urllib2 �ٷ��ĵ���https://docs.python.org/2/library/urllib2.html
  * urllib2 Դ�룺https://hg.python.org/cpython/file/2.7/Lib/urllib2.py
* �� python3.x ��,�����urllib2�Ҳ���������Ϊurllib.request 

### urllib��urllib2������
* ��python�У�urllib��urllib2�����໥����ģ�������urllib2����urllib�������汾
* rllib2���Խ���һ��Request���ʵ��������URL�����headers��urllib�����Խ���URL������ζ�ţ��㲻����αװ���User Agent�ַ����ȡ�
* urllib�ṩurlencode��������GET��ѯ�ַ����Ĳ�������urllib2û�С�����Ϊ��urllib����urllib2һ��ʹ�õ�ԭ��
* ���빤��ʹ��urllib��urlencode()�����������ǽ�key:value�����ļ�ֵ��ת����"key=value"�������ַ��������빤������ʹ��urllib��unquote()��������ע�⣬����urllib2.urlencode() )
### urlopen����
```html
   # urllib2_urlopen.py
  
  # ����urllib2 ��
  import urllib2
  
  # ��ָ����url�������󣬲����ط�������Ӧ�����ļ�����
  response = urllib2.urlopen("http://www.baidu.com")
  
  # ���ļ�����֧�� �ļ�����Ĳ�����������read()������ȡ�ļ�ȫ�����ݣ������ַ���
  html = response.read()
  
  # ��ӡ�ַ���
  print html
```
* �����ӡ���������ݣ���Ϊ������ϴ򿪰ٶ���ҳ�� �Ҽ�ѡ�񡰲鿴Դ���롱����ᷢ�֣������ǸղŴ�ӡ��������һģһ����
* ͨ����û�еڶ�������data������������get��post��û��data��Ϊget����
* urllib2Ĭ�ϵ�User-AgentͷΪ��Python-urllib/x.y��x��y��Python���汾�ʹΰ汾��,���� Python-urllib/2.7��
### request����
* ���Ҫ���ӻ��޸ı���ͷ�����������Ҫ����һ�� Request ʵ������Ϊurlopen()�Ĳ�����
   ```html
     #urllib2_useragent.py
     
     import urllib2
     
     url = "http://www.itcast.cn"
     
     #IE 9.0 �� User-Agent�������� ua_header��
     ua_header = {"User-Agent" : "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;"} 
     
     #  url ��ͬ headers��һ����Request����������󽫸��� IE9.0 �������User-Agent
     request = urllib2.Request(url, headers = ua_header)
     
     # ������������������
     response = urllib2.urlopen(request)
     
     html = response.read()
     # Ҳ����ָ������,Ĭ����utf8
     # html = response.read().decode("gbk")
     print html
   ```
* ��Ӹ����Header��Ϣ
  * Request.add_header() ���/�޸�һ���ض���header
  * Request.get_header()���鿴���е�header
  ```html
   # urllib2_headers.py

   import urllib2
   
   url = "http://www.itcast.cn"
   
   #IE 9.0 �� User-Agent
   header = {"User-Agent" : "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0;"} 
   request = urllib2.Request(url, headers = header)
   
   #Ҳ����ͨ������Request.add_header() ���/�޸�һ���ض���header
   request.add_header("Connection", "keep-alive")
   
   # Ҳ����ͨ������Request.get_header()���鿴header��Ϣ
   # request.get_header(header_name="Connection")
   
   response = urllib2.urlopen(req)
   
   print response.code     #���Բ鿴��Ӧ״̬��
   html = response.read()
   
   print html
  ```
* �����user-agent
  ```html
    # urllib2_add_headers.py
    
    import urllib2
    import random
    
    url = "http://www.itcast.cn"
    
    ua_list = [
        "Mozilla/5.0 (Windows NT 6.1; ) Apple.... ",
        "Mozilla/5.0 (X11; CrOS i686 2268.111.0)... ",
        "Mozilla/5.0 (Macintosh; U; PPC Mac OS X.... ",
        "Mozilla/5.0 (Macintosh; Intel Mac OS... "
    ]
    
    user_agent = random.choice(ua_list)
    
    request = urllib2.Request(url)
    
    #Ҳ����ͨ������Request.add_header() ���/�޸�һ���ض���header
    request.add_header("User-Agent", user_agent)
    
    # ��һ����ĸ��д�������ȫ��Сд
    request.get_header("User-agent")
    
    response = urllib2.urlopen(req)
    
    html = response.read()
    print html
  ``` 
### urlencode
* URL �Ĺ����ַ������ǿ�д�� ASCII �ַ�����������ʱ����Ҫ�� URL ���� Encode ����
* urllib�ṩurlencode�������б��룬unquote���н���
  ```html
   urllib.urlencode(values) 
  ```
  * ����valuesΪ����Ҫ��������ݣ�����ֻ��Ϊ**�ֵ�**����
  ```html
    import urllib

   
    keyword={'username':'����'}
    data=urllib.urlencode(keyword) # 'username=%E5%BC%A0%E4%B8%89'

    urllib.unquote(data) # 'username=\xe5\xbc\xa0\xe4\xb8\x89'

    print urllib.unquote(date)  # username=����
  ```
  * ͨ��urllib.urlencode()���������ֵ��ֵ�԰�URL����ת�����Ӷ��ܱ�web����������