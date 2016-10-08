using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Data.OleDb;
using DBAccess;

namespace BankAccount
{
    public partial class FileImport : Form
    {
        public FileImport()
        {
            InitializeComponent();

            InitBankAccount();
        }

        //加载银行账户
        private void InitBankAccount()
        {
            string sql = @"SELECT BankAccountNo +'_'+ BankAccountName+'_'+ bankName BankAccountName, BankAccountDesc,bankName FROM t_bankaccount";
            DataSet ds = SqlHelper.ExecuteDataSet(sql);
            cbx_Account.DataSource = ds.Tables[0];
            cbx_Account.DisplayMember = "BankAccountName";//设置显示列
            cbx_Account.ValueMember = "BankName";//设置实际值
        }



        /// <summary>
        /// 选择文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_ChooseFile_Click(object sender, EventArgs e)
        {
            //初始化一个OpenFileDialog类
            OpenFileDialog fileDialog = new OpenFileDialog();
            //fileDialog.Filter = "(*.xls;*.csv)|*.xls;*.csv";
            //fileDialog.InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Recent);//为了获取特定的系统文件夹，可以使用System.Environment类的静态方法GetFolderPath()。该方法接受一个Environment.SpecialFolder枚举，其中可以定义要返回路径的哪个系统目录
            fileDialog.Filter = "Excel文件(*.xls)|*.xls";
            fileDialog.ValidateNames = true;     //文件有效性验证ValidateNames，验证用户输入是否是一个有效的Windows文件名
            fileDialog.CheckFileExists = true;  //验证路径有效性
            fileDialog.CheckPathExists = true; //验证文件有效性

            //判断用户是否正确的选择了文件
            if (fileDialog.ShowDialog() == DialogResult.OK)
            {
                //获取用户选择文件的后缀名
                string extension = Path.GetExtension(fileDialog.FileName);
                txtFilePath.Text = fileDialog.FileName;

                //声明允许的后缀名
                string[] str = new string[] { ".xls" };
                if (!str.Contains(extension))
                {
                    MessageBox.Show("只能选择Excel文件！");
                    return;
                }

                ExcelToDataGridView(txtFilePath.Text, dgvBankData);
            }
        }

        /// <summary>
        /// 导入
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void btn_Import_Click(object sender, EventArgs e)
        {
            SqlBulkData sbk = new SqlBulkData();
            DataTable dt = (DataTable)dgvBankData.DataSource;

            try
            {
                bool b = sbk.BulkData(dt, "T_BankTemp");

                if (b)
                {
                    //把基本户中的日期里的-替换掉
                    string sql = @"UPDATE T_BankTemp
                            SET f1 = REPLACE(f1,'-','')";
                    int k = SqlHelper.ExecuteNonQuery(sql);
                    if (k < 0)
                    {
                        MessageBox.Show("更新数据出错！");
                        return;
                    }
                    //从临时表导入正式表
                    string accountNo = cbx_Account.Text;
                    string bankName = cbx_Account.SelectedValue.ToString();

                    accountNo = accountNo.Substring(0, accountNo.IndexOf("_")); //卡号

                    sql = "";
                    switch (bankName)
                    {
                        case "交通银行":
                            sql = @"INSERT INTO T_BankAccountData(BankAccountNo,BusinessDate,Addr,Mode,Amount,Balance)
SELECT '{0}', e.f2,e.f3,e.f4,
case when e.f5 = '--' then Cast(replace(e.f6,',','') AS DECIMAL(14,2))
else (0-Cast(replace(e.f5,',','') AS DECIMAL(14,2)))
end,
Cast(replace(e.f7,',','') AS DECIMAL(14,2))
FROM T_BankTemp e
WHERE len(e.f1)=8;

TRUNCATE TABLE T_BankTemp;";
                            break;

                        case "建设银行":
                            sql = @"INSERT INTO T_BankAccountData(BankAccountNo,BusinessDate,Addr,Mode,Amount,Balance)
SELECT '{0}', e.f2,e.f4,e.f11,
case e.f5
when '0.00' then Cast(replace(e.f6,',','') AS DECIMAL(14,2))
else (0-Cast(replace(e.f5,',','') AS DECIMAL(14,2)))
end,
Cast(replace(e.f7,',','') AS DECIMAL(14,2))
FROM T_BankTemp e
WHERE len(e.f1)=8;

TRUNCATE TABLE T_BankTemp;";
                            break;

                        case "农商银行":
                            sql = @"INSERT INTO T_BankAccountData(BankAccountNo,BusinessDate,Addr,Mode,Amount,Balance)
SELECT '{0}', e.f1,'',e.f5,
case e.f3 
WHEN '0.00' THEN Cast(replace(e.f2,',','') AS DECIMAL(14,2)) 
else (0-Cast(replace(e.f3,',','') AS DECIMAL(14,2))) 
end,
Cast(replace(e.f4,',','') AS DECIMAL(14,2))
FROM T_BankTemp e
WHERE len(e.f1)=8;

TRUNCATE TABLE T_BankTemp;";
                            break;

                        case "邮政银行":
                            sql = @"INSERT INTO T_BankAccountData(BankAccountNo,BusinessDate,Addr,Mode,Amount,Balance)
SELECT '{0}', e.f2,'',e.f3,
CASE 
WHEN e.f3 IN('费','跨行','卡取') then (0-Cast(replace(e.f4,',','') AS DECIMAL(14,2)))
ELSE Cast(replace(e.f4,',','') AS DECIMAL(14,2))
END ,
Cast(replace(e.f5,',','') AS DECIMAL(14,2))
FROM T_BankTemp e
WHERE len(e.f1)=8 AND e.f3 NOT IN('费','跨行','卡取');

TRUNCATE TABLE T_BankTemp;";
                            break;

                        default:
                            break;
                    }

                    sql = string.Format(sql, accountNo);

                    int i = SqlHelper.ExecuteNonQuery(sql);
                    if (i > 0)
                        MessageBox.Show(string.Format("数据导入成功,记录数{0}！", i.ToString()));
                    else
                        MessageBox.Show("数据导入不成功！");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        /// <summary>
        /// Excel数据导入方法
        /// 作者:lhxhappy
        /// </summary>
        /// <param name="filePath"></param>
        /// <param name="dgv"></param>
        public void ExcelToDataGridView(string filePath, DataGridView dgv)
        {
            //根据路径打开一个Excel文件并将数据填充到DataSet中
            string strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source = " + filePath + ";Extended Properties ='Excel 8.0;HDR=NO;IMEX=1'";//导入时包含Excel中的第一行数据，并且将数字和字符混合的单元格视为文本进行导入
            OleDbConnection conn = new OleDbConnection(strConn);
            conn.Open();

            DataTable dt = null;

            try
            {
                dt = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

                if (dt != null)
                {
                    string[] sheetName = new string[dt.Rows.Count];
                    int i = 0;
                    foreach (DataRow row in dt.Rows)
                    {
                        sheetName[i] = row["TABLE_NAME"].ToString();
                        i++;
                    }

                    string strExcel = "";
                    OleDbDataAdapter myCommand = null;
                    DataSet ds = null;
                    strExcel = "select  * from  [" + sheetName[0] + "]";
                    myCommand = new OleDbDataAdapter(strExcel, strConn);
                    ds = new DataSet();
                    myCommand.Fill(ds, "table1");

                    //在DataGridView中显示导入的数据
                    dgv.DataSource = ds.Tables[0];
                }
            }
            catch (Exception e1)
            {
                MessageBox.Show(e1.Message);
            }
        }

        private void FileImport_Resize(object sender, EventArgs e)
        {
            dgvBankData.Width = this.Width - 30;
            dgvBankData.Height = this.Height - 90;
        }

        private void cbx_Account_SelectedIndexChanged(object sender, EventArgs e)
        {
            dgvBankData.DataSource = null;
            txtFilePath.Text = "";
        }

    }

   
}
