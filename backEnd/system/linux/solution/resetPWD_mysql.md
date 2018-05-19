# 重置mysql密码
### 步骤
1. kill掉所有mysql的进程
```
 service mysqld stop
```

2. 使用命令跳过密码输入
```
mysqld_safe --skip-grant-tables &
```

3. 设置新的密码
```
use mysql
update user set password=password("root1234") where user='root'; //修改用户：root的密码成为：root1234
flush privileges//刷新MySQL的系统权限相关表，否则会出现拒绝访问 忘记输入的话重启mysql服务也可以
```

4. 重启mysql系统服务后就可以用新密码进入MySQL了
```
 service mysqld restart
```
