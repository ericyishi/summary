# ��ǩ��
### ��ǩ����ԭ��
* ������Ҫ֪����ÿ��app������ǩ���ģ��Զ������Գ���Ҳ��һ��app�������Զ������Գ���app�ͱ����Ե�Ŀ��app�Ǵ���ͬһ�����̵ģ��������ǵ�ǩ����Ҫ����һ�¡��Զ�����app����Ĭ��ǩ���ģ�һ�㱣����C:\Users\�û���\.android�µ�debug.keystore���棬���Ե�ֻ�б�����app��apk��ʱ����Ҫ�Ȱѱ�����apk��ǩ����Ϊ���Զ�����app��Ĭ��ǩ��һ�¡�
* �����Զ�������APK�������app��ǩ��
### ��ǩ���ķ�ʽ��
#### ��ʽһ��ʹ��Re-Sign.jar
* **ע�⣺**���ַ�ʽ�������JDK��1.6�ģ���1.7��ʼ��Ҫʹ�÷�ʽ��
* ���ص�ַ
  ```
   http://troido.de/downloads/category/1
  ```
* ʹ�ò���
  1. ˫�� Re-Sign.jar����������
  2. ��ʱ���ܻᱨ��zipalign.exeδ�ҵ���
     * ��*\sdk\build-tools\25.0.1 �п���zipalign.exe �� *\sdk\tools Ŀ¼��
  3. �����apk�Ͻ�ȥ��
  4. ѡ��һ������λ�ã����ͼ�еġ����桱��ť�����֮��
     * ��ʱ�ᵯ��һ���ɹ��ĶԻ��򡣰���PackageName ��Activity�����Լ�ס 
#### ��ʽ����ʹ������
* �����ʽ�����ף�����
* ʹ�ò���
  1. ��ѹ�������apk���������META-INF�ļ���ɾ����META-INF�������ǩ����Ϣ��
  2. ��cmd����������
     ```
	    jarsigner -keystore C:\Users\Administrator\.android\debug.keystore -storepass android -keypass android C:\Users\Administrator\Desktop\safe.apk androiddebugkey
	 ```
	 * C:\Users\Administrator\.android\debug.keystore·���Ǳ���**�Զ�����app**Ĭ��ǩ����keystore�ļ��ľ���·��
     * C:\Users\Administrator\Desktop\safe.apkΪ������apk�ľ���·��
	 * -storepass android��storepass�Ǵ�keystore�ļ�����Կ��android��Ĭ�ϵ�����
	 * -keypass android������Ĭ��ǩ������Կ��android��Ĭ�ϵ�����
     * androiddebugkey��ǩ���ı����������Ĭ��ֵ
	 * **ע��:**JDK1.7 �Ժ�Ҫ�����㷨
       ```
	     jarsigner -keystore C:\Users\Administrator\.android\debug.keystore -storepass android -keypass android -sigalg MD5withRSA -digestalg SHA C:\Users\Administrator\Desktop\safe.apk androiddebugkey
	   ```
  3. �Ż�android���ܣ����������Ǳ���ִ�еģ���ִ�к��ܻ�ȡ�����õ����ܣ�
     *  zipalign 4 ǩ��ǰ����apk�ľ���·��  ǩ���󱻲�apk�ľ���·��  
	 ```
	   zipalign 4 C:\Users\Administrator\Desktop\safe.apk D:\code\safe.apk 
     ```	 

  