# 参数化
* 参数化目的在于模拟中更接近真实环境数据
* 对于需要大量数据，来模拟真实场景，可以使用关联数据库里面的数据来获取。
### 进入
   ```
    Vuser--Parameter Lists
   ```
### 参数化用户名、密码

  * 使用ODBC 连接mysql数据库
    * 操作步骤：
      1. 配置ODBC
         1. 安装ODBC。操作系统上安装ODBC【mysql-connector-odbc-5.1.13-win32.msi】
         2. Vuser--Parameter Lists--new(新增变量，username)--选择类型File,会自动创建一个username.dat文件
         3. 选择Data Wizard
         4. Spcify SQL statement
         5. Create--机器数据源--新建
         6. 系统数据源--下拉列表选择ODBC--配置mysql数据库信息
      2. SQL框中输入操作数据库的sql语句
         ```
          SELECT USERNAME,PASSWORD FROM pw_members
         ```
      3. 点确定，就会在username.dat中生成两列，数据是来源于数据库的username，password
      4. 为参数username指定列。
         * “select column”为“By name”，选择“username”列
      4. 创建参数password，设置File path为username.dat对数据进行关联
         * 并且选择“By name”，选择“password”列
         * **重点**：同时设置“Select next row”为“Same line as username”，保证取密码的行数，与取用户名是相同的行

