# Robotium框架核心类Solo
### 常用api
1. 获取控件：
   * getText()
   * getButton()
  
2. 点击操作控件：
   * clickOnText()，clickOnButton()通过index或者text来识别控件。
   * clickOnView：首先get控件，然后通过clickOnView()来实现点击控件。

3. 滑屏操作：
   * solo.scrollToSide(KeyEvent.KEYCODE_DPAD_RIGHT)：向右滑屏
   * solo.scrollToSide(KeyEvent.KEYCODE_DPAD_RIGHT)：向左滑屏
   * solo.drag(float fromX,float toX,float fromY,float toY,int stepCount)拖动

4. 跳转：
* solo.goBack()模仿硬返回键
* solo.goBackToActivity("Activity名称")跳转到指定的Activity

5. 截屏：
   * solo.takeScreenshot()

6. 等待：
   * solo.waitForText() //等待指定的文本出现
   * solo.wait()
7. 输入文本：
   1. 首先获取id：
       * id = solo.getCurrentActivity().getResources().getIdentifier(stringid,"id",act.getPackageName())
   2. 然后获取EditText：
       * et = (EditText)solo.getView(id)
   3. 然后输入文本：
       * solo.enterText(et,text)
8. 清空输入框：
   * solo.clearEditText(EditText editText)
