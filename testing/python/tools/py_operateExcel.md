#  操作Excel
### 入取excel
1. 需要安装包：xlrd
  ```
   pip install https://pypi.douban.com/simple xlrd
  ```
2. 操作
  ```
   import xlrd
   bookwork=xlrd.workbook("文件路径") # 路径需要转义
   sheet=bookwork.sheets[0] # 获取第一张表
   for i in range(sheet.nrows): # 获取所有行信息
     for j in range(sheet.ncols):
       print(sheet.cell(i,j).value,end=" ") # 打印每一个单元格内容内容

  ```
  * 除了上面bookwork.sheets[0]获取表格的信息以外，我们bookwork.sheet_by_index(0)
  * 获取单个元素，sheetname.cell(i,j).value
  * 获取一行数据使用sheetname.row_values(i)


### 写入excel
1. 需要安装包:xlwt
   ```
    pip install https://pypi.douban.com/simple xlwt
   ```
2. 操作
   ```
    import xlwt
    # 创建一个workbook 设置编码
    workbook = xlwt.Workbook(encoding = 'utf-8')
    # 创建一个worksheet表名叫My Worksheet
    worksheet = workbook.add_sheet('My Worksheet')

    # 写入excel
    # 参数对应 行, 列, 值
    # 在2行1列写入数据
    worksheet.write(1,0, label = 'this is test')

    # 保存文件名
    workbook.save('Excel_test.xls')
   ```
