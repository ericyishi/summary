# �����¼�
### ʹ�÷�ʽ
* ��Ҫ�����
  ```
   from selenium.webdriver.common.keys import Keys
   ����
   from selenium.webdriver import Keys
  ```
* ʹ�÷�ʽ
  ```
   driver.find_element_by_id("kw").send_keys(Keys.BACK_SPACE)
   # ����һ���س���
   driver.find_element_by_id("kw").send_keys(Keys.CONTROL,'a')
   # ȫѡ����������
  ```
### ���÷���
  * send_keys(Keys.BACK_SPACE) ɾ����
  * send_keys(Keys.SPACE) �ո��
  * send_keys(Keys.TAB) TAB��
  * send_keys(Keys.ESCAPE) ESC���˼�
  * send_keys(Keys.ENTER) ENTER�س���
  * send_keys(Keys.CONTROL,'a') ȫѡ
  * send_keys(Keys.CONTROL,'c') ����
  * send_keys(Keys.CONTROL,'x') ����
  * send_keys(Keys.CONTROL,'v') ճ��
  * send_keys(Keys.F1) ����F1
