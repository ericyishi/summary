# SMTP发送邮件
* python提供了smtplib模块用于发送邮件，对SMTP协议进行简单的封装
* 使用前发送者的邮箱必须开启SMTP服务

### 服务器信息
* 网易：
  * SMTP smtp.163.com 465/994(ssl) 25(非ssl)
  * POP3 pop.163.com 995(ssl) 110(非ssl)
* QQ
  * SMTP smtp.163.com 465/587(ssl)
  * POP3 pop.163.com 995(ssl)

* 注意：使用ssl端口，连接方法为：
  ```
   smtp = smtplib.SMTP_SSL(smtpserver, 465)
  ```
  * 非ssl端口
    ```
     smtp = smtplib.SMTP()
     smtp.connect(smtpserver, 25)
    ```

### 发送给单个用户
```
    import smtplib
    from email.header import Header
    from email.mime.text import MIMEText

    # 发送邮箱服务器
    smtpserver = 'smtp.163.com'
    # 发送邮箱用户名/密码
    user = 'XXX@163.com'
    password = '授权码'
    # 发送邮箱
    sender = 'XXX@163.com'
    # 多个接收邮箱，单个收件人的话，直接是receiver='XXX@163.com'
    receiver = 'X2@qq.com'
    # 发送邮件主题
    subject = '小微系统报告书xxx2'

    # 编写 HTML类型的邮件正文
    # MIMEText这个效果和下方用MIMEMultipart效果是一致的，已通过。
    msg = MIMEText('<html><h1>xxx报告书</h1></html>', 'html', 'utf-8')

    msg['Subject'] = Header(subject, 'utf-8')  # subject
    msg['From'] = sender
    # 收件箱地址
    msg['to'] = receiver


    # 连接发送邮件
    smtp = smtplib.SMTP()
    smtp.connect(smtpserver, 25)
    smtp.login(user, password)
    smtp.sendmail(sender, receiver, msg.as_string())
    smtp.quit()
```

### 发送给多个用户
* 只需在上面代码，做些修改
* 发送给多个用户，接收的参数是一个**列表**
  ```
   receiver = ['X2@163.com','X3@qq.com']
   smtp.sendmail(sender, receiver, msg.as_string())
  ```
* 还需要将收件箱地址，变为字符串的格式
  ```
   msg['to'] = ','.join(receiver) # 目的是将列表转化成字符串'X2@163.com','X3@qq.com'

  ```
### 带附件发送【解决附件不能为中文的问题】
```
import base64
import smtplib
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

# 发送邮箱服务器
smtpserver = 'smtp.163.com'
# 发送邮箱用户名/密码
user = 'XXX1@163.com'
password = 'XXX'
# 发送邮箱
sender = 'XXX1@163.com'
# 多个接收邮箱，单个收件人的话，直接是receiver='XXX@126.com'
receiver = ['XXX@qq.com', 'XXX@163.com']
# 发送邮件主题
subject = 'hahahabbbbb'

fileName = r'C:\Users\Administrator\Desktop\随机回帖.txt'
att = MIMEText(open(fileName, 'rb').read(), 'base64', 'UTF-8')
att["Content-Type"] = 'application/octet-stream'
att.add_header('Content-Disposition', 'attachment',
               filename='=?utf-8?b?' + str(base64.b64encode(fileName.encode('UTF-8')), encoding="utf8") + '?=')

msgRoot = MIMEMultipart('alternative')
msgRoot.attach(MIMEText('<html><h1>nihao报告书2</h1></html>', 'html', 'utf-8')) #正文

msgRoot['Subject'] = Header(subject, 'utf-8')  # subject
msgRoot['From'] = sender
msgRoot['to'] = ','.join(receiver)
msgRoot.attach(att)

# 连接发送邮件
smtp = smtplib.SMTP_SSL(smtpserver, 465)
smtp.login(user, password)
smtp.sendmail(sender, receiver, msgRoot.as_string())
smtp.quit()

```
* 编码方法是Base64，解码后是UTF-8
  ```
   filename='=?utf-8?b?' + str(base64.b64encode(fileName.encode('UTF-8')), encoding="utf8") + '?=')
  ```
* 如果fileName带路径，上传的附件的文件名也会跟上路径


### 常见错误
1. 报错smtplib.SMTPAuthenticationError: (550, b'User has no permission')或者smtplib.SMTPAuthenticationError: (535, b'Error: authentication failed')
   * 这两个错误是你的密码用的不是授权码导致
   * 建议使用网易邮箱，设置方便。设置后，密码就填授权码了
2. smtplib.SMTPDataError: (554, b'DT:SPM 163 smtp13
   * 554 DT:SPM 发送的邮件内容包含了未被许可的信息，或被系统识别为垃圾邮件。请检查是否有用户发送病毒或者垃圾邮件；
     * 可能原因是为“发件人和收件人参数没有进行定义
     * 可也能是正文没有内容