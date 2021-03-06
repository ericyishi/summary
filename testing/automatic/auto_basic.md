# 自动化测试
### 分层测试金字塔
* 层次（从上往下）:
  1. UI
     * UI自动化的投入和产出比，是三种模型中最低的，但对于越来越复杂的大型的系统，UI自动化在某些方面，也可以减少很多发布后冒烟测试的工作量。
  2. 接口
     * 接口自动化，目前来说是性价比最高的一种选择。
  3. 单元
     * 从效果来看，单元自动化是收益最高的，但是单元自动化对大多数自动化测试初学者来说，难度太大

### 适合进行自动化测试的项目
1. 需求稳定，不会频繁变更
2. 软件维护周期长，有生命力
3. 多平台运行，大量重复任务
4. 定期构建，测试验证
5. 比较频繁的回归验证
6. UI界面稳定，变动少
7. 项目进度压力不大
8. 被测系统开发较为规范，可测性强
9. 具备大量自动化测试平台
10. 测试人员具备较强编程能力
* 除了以上10点，还需考虑其他问题：
  1. 文档管理。如果文档不太完善甚至没有对应的文档，那么自动化测试工作，前期的准备工作就需要投入更多的时间和精力。
     * 文档包括需求文档、测试方案、测试用例、测试规范、开发规范、数据库表设计文档、接口文档等。
  2. 流程管理。
     * 项目的需求迭代是否稳定？从需求评审到开发、测试、发布上线是否有比较规范的流程
     
### 写好自动测试的原则【代码分层】
* 做到数据与流程分离
* 通过不断抽象消除冗余
* 测试用例应当尽量简单易读，避免复杂逻辑
* 建立用例分层架构
* 自动化测试用例必须要健壮

### PageObject设计模式
* Page Object不用按字面意思以一个页面为单位来划分，而是可以实际业务分模块、分区域来
* 不必暴露Page的内部细节
* 不要有断言
* 单个page通常分为四层
  1. 元素层element
  2. 操作层action
  3. 行为层flow
  4. 数据层data