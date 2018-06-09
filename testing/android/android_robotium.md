# Robotium
### 概要
* 基于instrumentation框架的Robotium的库，只支持java语言
* instrumentation框架需要相同的进程下工作，只是不同的线程，所以无法与系统软件进行交互，不能够跨APP进行测试
* 可以测试Android Native和Android Hybrid App
* 处理多个activity的切换

### 下载
```
 https://github.com/RobotiumTech/robotium/wiki/Downloads
```

### 使用
* 以eclipse为例
  1.File->New->Android Test Project【注意是Android项目】，输入测试的工程名字，选择要测试的工程；
    * 如果只有apk，就选第一个This Project  
  2.右键新建的工程名，选择Properties->Java Build Path->Libraries ->Add External JARs…，选择下载好的robotium-solo.jar包，我选择的是robotium-solo-5.6.0.jar，为了方便阅读，建议将robotium-solo-5.6.0-javadoc.jar也一并导入.还要在Order and Export里面勾选上； 
    * 这一步可以在Add Libraries中导入JUnit4
  3.在src/test包下新建java文件，这就是我们的测试文件了，到此配置完成，开始编写脚本。 
    * 父类选择ActivityInstrumentationTestCase2
    * 注：以上默认待测工程在本地，如果是对网上下载的apk进行测试，需要将apk重签名，因为robotium要求被测应用和测试程序要有一致的签名。apk的重签名可以使用命令行，也可以使用工具re-sign.jar甚至是360辅助工具，具体细节不在此处提及。
  4. 编写测试代码
     * 这里是以直接对apk测试的所以需要知道包名
	 * 获取包名的办法：aapt dump badging 被测apk的绝对路径
	 * 在AndroidManifest.xml下面去修改被测包名
	   ```
	     <instrumentation
        android:targetPackage="cn.com.open.mooc" />
	   ```
	 
     ```
	    package com.imooc.test;
        //robotium提供的测试用类
		import com.robotium.solo.Solo;
		import android.app.Activity;
		//测试工程要继承用来测试activity的父类
		import android.test.ActivityInstrumentationTestCase2;
		import android.util.Log;
		import android.widget.EditText;
		import android.widget.ImageView;
		import android.widget.ListView;
		import android.widget.TextView;


		//

		@SuppressWarnings("rawtypes")
		public class TestMooc extends ActivityInstrumentationTestCase2 {
			private Solo solo;
			//这里的包名是需要获取的
			private static final String MainActivity="cn.com.open.mooc.ui.loading.MCLoadingActivity";
			private static Class launchActivityClass;
			
			static{
				try{
				    //反射
					launchActivityClass=Class.forName(MainActivity);
				}
				catch(ClassNotFoundException e){
					throw new RuntimeException(e);
				}
			}
			
			@SuppressWarnings("unchecked")
			public TestMooc() throws ClassNotFoundException{
				super(launchActivityClass);
			}
			
			//在测试方法前要覆盖父类的setUp()方法和tearDown()方法，这两个方法分别用来初始化solo、绑定对应的Antivity和清理垃圾资源、关闭Activity：
			@Override
			protected void setUp() throws Exception{
				super.setUp();
				solo=new Solo(getInstrumentation(),getActivity());
			}
			
			@Override
			protected void tearDown() throws Exception{
				solo.finishOpenedActivities();
			}
			

			public void clickEnter(){
				Activity act = solo.getCurrentActivity();
				int btnId=act.getResources().getIdentifier("go", "id", act.getPackageName());
				solo.waitForView(btnId);
				solo.clickOnButton("直接进入");
				assertTrue("Enter Fail", solo.waitForText("分类", 1, 3000));
			}
			
			public void clickSearch(){
				Activity act = solo.getCurrentActivity();
				int searchId=act.getResources().getIdentifier("search_course", "id", act.getPackageName());
				
				ImageView view =  (ImageView) solo.getView(searchId);		
				solo.clickOnView(view);
				assertTrue("search Fail", solo.waitForText("搜索课程", 1, 3000));
			}

			public void enterSearch(){
				Activity act = solo.getCurrentActivity();
				int txtId = act.getResources().getIdentifier("search_content", "id", act.getPackageName());
				EditText edit = (EditText) solo.getView(txtId);
				
				solo.enterText(edit, "软件测试基础");
				
				int searchId= act.getResources().getIdentifier("study_latest", "id", act.getPackageName());
				ImageView view =  (ImageView) solo.getView(searchId);		
				solo.clickOnView(view);
				
				int listId = act.getResources().getIdentifier("list_view", "id", act.getPackageName());
				ListView list=(ListView) solo.getView(listId);
				int cnt = list.getChildCount();
				if(cnt>0){
					solo.clickOnText("概念篇");
				}
				else{
					assertTrue("can't Find course",false);
				}
			}
			
			public void palyChapter(){
				TextView tv = (TextView) solo.getView("cn.com.open.mooc:id/section_name", 7);
				Log.d("imooc", "chapter name :"+tv.getText().toString());
				if(tv.getText().toString().matches("(.*)敏捷测试(.*)")){
					solo.clickOnView(tv);
					solo.sleep(3000);			
				}
				else{
					assertTrue("Not Click the Agile Test Chapter",false);
				}
			}
			//所有的测试方法都必须以test开头，程序会自动调用test开头的方法，每次调用都会运行一次测试工程。
			public void testPlayAgile(){
				clickEnter();
				clickSearch();
				enterSearch();
				palyChapter();
			}
			
		}
	 ```
	 * 最后将工程Run As->Android JUnit Test，在虚拟机或真机上运行就可以了！
