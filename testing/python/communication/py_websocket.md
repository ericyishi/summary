# websocket
### ����
 * websocket����һ��������**Ӧ�ò�**Э�飬����һ�ױ�׼�� API 
 * ��HTML5 ��ʼ�ṩ��һ���ڵ��� TCP �����Ͻ���ȫ˫��ͨѶ���ͻ��ˡ���������������������Э�顣ͨ����httpЭ��һ������
 * websocketҲ�ǳ�����
 * ��һ����Ҫʹ��httpЭ�齨����������˵����ӣ�֮�����http�޹�

### ��صĿ�
 ```html
  pip install websocket-client -i https://pypi.douban.com/simple
 ```  
### ����
 * һ��֧��websocket����վ
   ```
    http://websocket.org/echo.html
   ```
   * Э������ws��ͷ  
 
### ���Դ���
1. �ͷ���
```html
    #-*- coding: utf-8 -*-
    import websocket,time,threading
    import sys
    
    def when_message(ws,message):
        print("���յ�����Ϣ:"+message)
    
    def when_open(ws):
        print("��������...")
        def run():
            while True:
    
                if sys.version > '3':
                    msg=input("����������")
                else:
                    msg=raw_input("����������:")
                ws.send(msg)
                time.sleep(1)
                # ����û�����close��Ϣ����ֱ�ӹرձ�������
                if msg=='close':
                    ws.close()
                    break
        threading.Thread(target=run).start()
    
    def when_close(ws):
        print("�ر�����...")
    
    ws=websocket.WebSocketApp("ws://echo.websocket.org",
                           on_message=when_message,
                           on_open=when_open,
                           on_close=when_close)
    # ���ֳ־�����
    ws.run_forever()
``` 
2. ��������
```html
    #-*- coding: utf-8 -*-
    import websocket,time,threading
    import sys
    
    def when_message(ws,message):
        print("���յ�����Ϣ:"+message)
    
    def when_open(ws):
        print("��������...")
        def run():
            while True:
    
                if sys.version > '3':
                    msg=input("����������")
                else:
                    msg=raw_input("����������:")
                ws.send(msg)
                time.sleep(1)
                # ����û�����close��Ϣ����ֱ�ӹرձ�������
                if msg=='close':
                    ws.close()
                    break
        threading.Thread(target=run).start()
    
    def when_close(ws):
        print("�ر�����...")
    
    ws=websocket.WebSocketApp("ws://localhost:8888",
                           on_message=when_message,
                           on_open=when_open,
                           on_close=when_close)
    # ���ֳ־�����
    ws.run_forever()
```