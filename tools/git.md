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
  * **git commit -am"提交备注信息"**  可以直接跳过add这个步骤
  * **git commit -amend** 对于最近一次提交的备注信息做变更【测试没成功】
  * **git commit rebase -i 当前需要修改的父亲的哈希值** 对于指定提交的备注信息做变更【测试没成功】

  * **git push** 提交备注后，提交代码
  * **git diff** 查看变化，对比当前代码与最后一次保存的代码。
    ```
     git diff 哈希1 哈希2 //可以对两次commit比较
     // 另外HEAD 可以指代最后一次提交
     git diff HEAD HEAD^ //将最后一次提交与倒数第二次提交比对
     等同于git diff HEAD HEAD~1
     git diff HEAD HEAD^^
     等同于git diff HEAD HEAD~2
    ```
  * **git diff --cached** 比较暂存区与HEAD文件的不同，需要先将修改提交到暂存区才有用。
  * **git reset --hard 哈希值前六位** 退回到原来的版本
  * **git reset --hard** 删除暂存区里面的内容
  * **git help** 帮助命令
  * **git help --web 需要查看的命令名** 以网页的方式打开相关命令的帮助文档


#### 查看提交历史
  * **git log** 查看历史保存记录【会显示每次操作的哈希值】只查看当前分支
  ![image](https://github.com/ericyishi/img-folder/blob/master/summary/tool/gitHash.png)
  * **git log --all** 查看所有分支的历史记录
  * **git log -p <file>** 查看指定文件提交历史记录
  * **git log --oneline** 查看最近提交的历史记录
  * **git log -n次数 --oneline** 指定最近几条的记录
  * **git log --all --graph** 图形化线条，可以看出结构关系

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

### 分支
  * **git branch -v** 查看有的分支
  * **git branch -av** 查看所有的分支，包括远端的
  * **git checkout 分支名** 切换分支
  * **git checkout -b 新分支名** 创建分支，并且换到新分支上
    ```
      git checkout -b 新分支名 (基于哪个分支)
    ```
### 删除分支
  * **git branch -d 分支名** 有时会有提示无法删除，使用-D
  * **git branch -D 分支名** 直接删除

### 图形化界面
  * **gitk** 启动图形化界面的命令

### commit、tree、blob三个对象
  * commit 执行一次commit命令就创建一个commit对象
    * 一个commit只对应一个tree
  * 一个tree对应当前一个快照，以tree来呈现（文件夹也对应是tree）
  * blob 是具体的文件
  * 查看命令：
    ```
      git cat-file -p 哈希值
    ```
### 分离头指针detached HEAD
  * 在如果没有跟branch挂钩，进行变更commit，不会被git保存
    ```
     解决方案：创建分支保存下来
     git branch 新分支名 哈希值
    ```

### git与github、gitLab关系
  * 为了协同工作，我们把git代码同步到在第三方服务器上，例如：github，gitlab


