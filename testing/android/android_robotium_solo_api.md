# Robotium��ܺ�����Solo
### ����api
1. ��ȡ�ؼ���
   * getText()
   * getButton()
  
2. ��������ؼ���
   * clickOnText()��clickOnButton()ͨ��index����text��ʶ��ؼ���
   * clickOnView������get�ؼ���Ȼ��ͨ��clickOnView()��ʵ�ֵ���ؼ���

3. ����������
   * solo.scrollToSide(KeyEvent.KEYCODE_DPAD_RIGHT)�����һ���
   * solo.scrollToSide(KeyEvent.KEYCODE_DPAD_RIGHT)��������
   * solo.drag(float fromX,float toX,float fromY,float toY,int stepCount)�϶�

4. ��ת��
* solo.goBack()ģ��Ӳ���ؼ�
* solo.goBackToActivity("Activity����")��ת��ָ����Activity

5. ������
   * solo.takeScreenshot()

6. �ȴ���
   * solo.waitForText() //�ȴ�ָ�����ı�����
   * solo.wait()
7. �����ı���
   1. ���Ȼ�ȡid��
       * id = solo.getCurrentActivity().getResources().getIdentifier(stringid,"id",act.getPackageName())
   2. Ȼ���ȡEditText��
       * et = (EditText)solo.getView(id)
   3. Ȼ�������ı���
       * solo.enterText(et,text)
8. ��������
   * solo.clearEditText(EditText editText)
