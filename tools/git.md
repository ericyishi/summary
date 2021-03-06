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
  * **git reset HEAD** 取消暂存区里面所有内容，恢复至HEAD指向最新的commit的内容
  * **git reset HEAD -- 文件名1 文件名2** 暂存区的部分内容取消
  * **git checkout -- 需要恢复的文件名** 恢复工作区的内容至暂存区状态
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
      git checkout -b 新分支名 基于哪个分支 #基于某个分支在本地创建一个新分支
      git checkout -b feature origin/feature/feature1
      # 从远端origin/feature/feature1的仓库拷贝一份至本地，新分支名为feature（实际是与远端分支建立了联系的，本地push直接会推到远端）
    ```
### 删除分支
  * **git branch -d 分支名** 有时会有提示无法删除，使用-D
  * **git branch -D 分支名** 直接删除

### 回退
  * **git reset --hard 哈希值前六位** 退回到原来的版本

### 存储修改
  ```
   经常有这样的事情发生，当你正在进行项目中某一部分的工作，里面的东西处于一个比较杂乱的状态，而你想转到其他分支上进行一些工作。
   问题是，你不想提交进行了一半的工作，否则以后你无法回到这个工作点。
   解决这个问题的办法就是git stash命令。
  ```
  * **git stash** 将所有修改放入stash中
  * **git stash list** 查看stash里的存储
  * **git stash apply** 将stash里的东西弹出到工作区，另外stash list里面的记录也保留
  * **git stash pop** 将stash里的东西弹出到工作区，另外stash list里面记录也丢弃
### 备份

### 远端
 * **git remote -v**  查看远端版本库信息
 * **git remote add [shortname] [url]**  添加远端仓库
 * **git fetch shortname** 拉取远程版本库
 ```
   git fetch是将远程主机的最新内容拉到本地，用户在检查了以后决定是否合并到工作本机分支中。

   而git pull 则是将远程主机的最新内容拉下来后直接合并，即：git pull = git fetch + git merge，这样可能会产生冲突，需要手动解决。
 ```
### 合并分支
 * **git merge** git merge 是通过暴力地将两分支的最新commit 揉合到一个新的commit 上达到合并效果的.保持修改内容的历史记录，但是历史记录会很复杂。
 * **git rebase** git rebase 则是通过一种续接的方式：将master 拆下，续到b1上来。就相当于本来master 与b1都在同一起点，现在改为master的起点为b1。


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


