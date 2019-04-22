# git
* git是一个源代码管理工具。
### git存储机制
![image](https://github.com/ericyishi/img-folder/blob/master/summary/tool/gitRunTheory.png)

### 常用命令
#### 创建版本库
  * **git clone <url>** 克隆远程版本库
  * **git init** 在需要版本控制的项目下使用，初始化一个空的git仓库，会生成一个.git文件夹 ，用于记录本地源代码的变更情况。
      *  建立git仓库的两种场景
         * 1. 已有项目纳入git管理
             ```
                cd 项目代码所在文件夹
               git init
            ```
         * 2. 新建项目直接用git管理
            ```
                cd 文件夹
                git init 项目名
                cd 项目名
            ```
#### 修改和提交
  * **git status** 查看本地仓库变更状态，第一次查看是显示未被跟踪的文件
  * **git add 文件名** 添加当前文件添加到跟踪列表
    * 使用**git add .** 可以添加所有内容。【但不应该添加node_modules这类文件，只添加开发的源文件】
    * 创建一个添加本地git忽略清单文件 **.gitignore**,此文件用于说明哪些文件被跟踪哪些是忽略的。只能使用命令创建，因为window下无法创建以“.”开头的文件
    * 在cmd下创建touch .gitignore
  * **git commit -m “提交备注信息”** 保存副本,保存在.git本地仓库里。
  * **git push** 提交备注后，提交代码
  * **git diff** 查看变化，对比当前代码与最后一次保存的代码。

  * **git reset --hard 哈希值前六位** 退回到原来的版本
  * **git reset --hard** 删除暂存区里面的内容
  * **git help** 帮助命令

#### 查看提交历史
  * **git log** 查看历史保存记录【会显示每次操作的哈希值】
  ![image](https://github.com/ericyishi/img-folder/blob/master/summary/tool/gitHash.png)
  * **git log -p <file>** 查看指定文件提交历史记录

#### 暂存
  * **git stash "名字"** 比如想pull 最新代码，又不想加新commit;或者当在需要紧急处理一个bug时，工作区内容又没有完成，不适合提交，需要暂存起来。

  * **git stash list** 列出所有保存的进度列表
  * **git stash pop|apply [--index] [<stash>]**
    * apply 只会读取暂存区的数据，通过  apply 后，暂存区的数据仍然存在；
    * pop 是取出最新的一次暂存数据，取出后，这次数据就不会存在于暂存区中了。
### 撤销
  * **git reset HEAD** 适用于撤销掉git add .【绿字变红字(撤销add)】

### 其他操作
  * **git mv 老文件 新文件** 重命名文件
### git与github、gitLab关系
  * 为了协同工作，我们把git代码同步到在第三方服务器上，例如：github，gitlab


