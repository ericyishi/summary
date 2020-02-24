# websocket
### 概念
 * websocket它是一个完整的**应用层**协议，包含一套标准的 API 
 * 是HTML5 开始提供的一种在单个 TCP 连接上进行全双工通讯【客户端、服务器都能主动发】的协议。通常与http协议一起工作。
 * websocket也是长连接
 * 第一次需要使用http协议建立与服务器端的连接，之后就与http无关

### 相关的库
 ```html
  pip install websocket-client -i https://pypi.douban.com/simple
 ```  
### 测试
 * 一个支持websocket的网站
   ```
    http://websocket.org/echo.html
   ```
   * 协议名以ws开头  
 
### 测试代码
1. 客服端
```html
    #-*- coding: utf-8 -*-
    import websocket,time,threading
    import sys
    
    def when_message(ws,message):
        print("接收到的消息:"+message)
    
    def when_open(ws):
        print("建立连接...")
        def run():
            while True:
    
                if sys.version > '3':
                    msg=input("请输入内容")
                else:
                    msg=raw_input("请输入内容:")
                ws.send(msg)
                time.sleep(1)
                # 如果用户输入close消息，则直接关闭本次连接
                if msg=='close':
                    ws.close()
                    break
        threading.Thread(target=run).start()
    
    def when_close(ws):
        print("关闭连接...")
    
    ws=websocket.WebSocketApp("ws://echo.websocket.org",
                           on_message=when_message,
                           on_open=when_open,
                           on_close=when_close)
    # 保持持久连接
    ws.run_forever()
``` 
2. 服务器端
```html
    #-*- coding: utf-8 -*-
    import websocket,time,threading
    import sys
    
    def when_message(ws,message):
        print("接收到的消息:"+message)
    
    def when_open(ws):
        print("建立连接...")
        def run():
            while True:
    
                if sys.version > '3':
                    msg=input("请输入内容")
                else:
                    msg=raw_input("请输入内容:")
                ws.send(msg)
                time.sleep(1)
                # 如果用户输入close消息，则直接关闭本次连接
                if msg=='close':
                    ws.close()
                    break
        threading.Thread(target=run).start()
    
    def when_close(ws):
        print("关闭连接...")
    
    ws=websocket.WebSocketApp("ws://localhost:8888",
                           on_message=when_message,
                           on_open=when_open,
                           on_close=when_close)
    # 保持持久连接
    ws.run_forever()
```