# ����������
* ��Щʱ������Ҫ����һЩģ�飬����webdriver��û���ṩ��Ӧ�Ĳ������������ǿ���ʹ��JS�����ƣ��������������

### ���÷���
1. �����������ĵ�ָ���ĸ߶�
 ```
  scrollTo(xpos,ypos)
 ```
 * xpos	���衣Ҫ�ڴ����ĵ���ʾ�����Ͻ���ʾ���ĵ��� x ���ꡣ�����ˮƽ��������
 * ypos	���衣Ҫ�ڴ����ĵ���ʾ�����Ͻ���ʾ���ĵ��� y ���ꡣ ����Դ�ֱ��������

 ```
  js="window.scrollTo(0,100)"
  # ����ֱ����������100px��λ��
  driver.execute_script(js)
 ```
  * ��������:js="window.scrollTo(0,document.body.scrollHeight)"
    

2. ������������ָ����Ԫ�صĸ߶�
  ```
   element.scrollIntoView() 
  ```
   * ����Ĭ��Ϊtrue��
   * ����Ϊtrueʱ���øú�����ҳ�棨������������������ʹelement�Ķ�������ͼ��������**��������**��
   * ����Ϊfalseʱ��ʹelement�ĵײ�����ͼ��������**�ײ�����**��
   * TIPS��ҳ�棨�������ɹ���ʱ�����ã����й��������С�
  ```
   js="document.getElementById('choice').scrollIntoView(true)"
   driver.execute_script(js)
  ```  
3. �ƶ�ָ����λ����
  ```
   js='window.scrollBy(0,400)' # �����ƶ�400px
  ```
 
 