# ʹ��JS��ֹ����
* ϣ���ȴ��������ʱ�䣬�������趨һ������ʱ�䣬������ֹ�����Ǽ���ִ�д���
```
 self.driver.execute_script('window.stop()')
```
### Ӧ�ã���������ʱ�䣬ֹͣ���أ�����ִ�к������
```
 def test_PageLoad(self):
   # ����ҳ������޶�ʱ��Ϊ8��
   self.driver.set_page_load_timeout(8)
   try:
     startTime=time.time()
	 self.driver.get("www.bilibili.com")
   except TimeoutException:
     # ʹ��jsֹͣ����
     self.driver.execute_script('window.stop()')  
   end=time.time()-startTime
   print(end)
   # �������д�����߼�   
```