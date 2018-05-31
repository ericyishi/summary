# headless模式
### chrome
* 官方文档中介绍，mac和linux环境要求chrome版本是59+，而windows版本的chrome要求是60+
```
 option = webdriver.ChromeOptions()
 option.add_argument('headless')
 driver = webdriver.Chrome(chrome_options=option)
```