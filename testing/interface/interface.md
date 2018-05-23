# 接口测试
### 概念
* 接口测试：是对系统组件间接口的一种测试
* 主要用于检测外部系统与系统之间以及系统内部各个子系统之间的交互点。
* 测试内容：
  * 重点测试的是数据的交换，传递和控制管理过程，以及系统间的相互逻辑依赖关系等等，这要求对业务逻辑有一定程度上的理解，对数据流向有较好的定位。
### 接口测试分类
1. 程序接口测试(程序模块间接口测试)
   * 一般需要与开发程序接口相同的语言
     * 桩模块（stub）：集成测试前要为被测模块编制一些模拟其下级模块功能的“替身”模块，以代替被测模块的接口，接受或传递被测模块的数据，这些专供测试用的“假”模块称为被测模块的桩模块
     * 驱动测试（自底向上集成时使用），就是你负责测试模块/方法是中间的，没有main（）入口，怎么编译，怎么启动呢？就需要写一个带main()的方法来调用你的模块/方法，这个就是驱动测试
     ```
      public class ddd
        {
        //Test driver
        public static void main(String[] args) {
        ddd d = new ddd();
        d.Add();
        }

        //My module
        public int Add() {
        int output=this.Stub1() + this.Stub2();
        System.out.print("My module: return value is "+output+"\n");
        return output;
        }

        //Stub1
        public int Stub1() {
        int output=3;
        System.out.print("Stub 1 : return value is "+output+"\n");
        return output;

        }

        //Stub2
        public int Stub2() {
        int output=7;
        System.out.print("Stub 2 : return value is "+output+"\n");
        return output;
        }
        }
     ```
2. 协议接口测试
   * 这类是我们常说的接口测试

### 接口测试的重要性
1. 相对于UI测试，能更早的发现问题
2. 相对于UI测试，能发现更底层的问题
3. 相对于UI测试，发现和解决的效率更高

### 接口测试依据--接口定义文档
1. 接口概述
2. HTTP请求方式
3. 认证说明
4. 请求限制说明
5. 请求参数说明
6. 返回说明
7. 其它

### 测试要点
* 检查接口的功能, 接口返回的数据是否与预期结果一致。
* 检查接口的容错性和健壮性，假如传递数据的类型错误时是否可以处理,传递的参数足够大或为负数时，接口是否可以正常处理。
* 检查接口的性能，对于一些接口，需要进行多线程测试（适用于接口压力测试）
* 接口的安全性

### 接口的测试用例
1. 用例标题
2. 预置条件
3. 操作步骤
4. 输入数据
5. 预期结果
6. 实际结果

### 测试工具
1. 浏览器插件：postman这类
2. 接口自动化测试工具：jmeter、Robot Framework
3. 接口性能测试：LR、Jmeter
