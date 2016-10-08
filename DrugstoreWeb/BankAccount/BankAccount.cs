using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using DBAccess;

namespace BankAccount
{
    public partial class BankAccount : Form
    {
        public BankAccount()
        {
            InitializeComponent();
            InitGrid();
        }

        private void BankAccount_Load(object sender, EventArgs e)
        {

        }

        private void InitGrid()
        {
            dataGridView1.AutoGenerateColumns = false;
            DataGridViewTextBoxCell dgvcell = new DataGridViewTextBoxCell();//这里根据自己需要来定义不同模板。当前模板为“文本单元格”

            DataGridViewColumn f1 = new DataGridViewTextBoxColumn();
            f1 = new DataGridViewColumn();
            f1.HeaderText = "编号";
            f1.DataPropertyName = "ID";
            //定义单元格模板
            f1.CellTemplate = dgvcell;//设置模板
            f1.Width = 50;
            dataGridView1.Columns.Add(f1);

            DataGridViewColumn f2 = new DataGridViewTextBoxColumn();
            f2 = new DataGridViewColumn();
            f2.HeaderText = "银行帐号";
            f2.DataPropertyName = "BankAccountNo";
            f2.CellTemplate = dgvcell;//设置模板
            f2.Width = 180;
            dataGridView1.Columns.Add(f2);

            DataGridViewColumn f3 = new DataGridViewTextBoxColumn();
            f3 = new DataGridViewColumn();
            f3.HeaderText = "帐号别名";
            f3.DataPropertyName = "BankAccountName";
            f3.CellTemplate = dgvcell;//设置模板
            f3.Width = 250;
            dataGridView1.Columns.Add(f3);

            DataGridViewColumn f4 = new DataGridViewTextBoxColumn();
            f4 = new DataGridViewColumn();
            f4.HeaderText = "帐号说明";
            f4.DataPropertyName = "BankAccountDesc";
            f4.CellTemplate = dgvcell;//设置模板
            f4.Width = 500;
            dataGridView1.Columns.Add(f4);

            DataGridViewColumn f5 = new DataGridViewTextBoxColumn();
            f5 = new DataGridViewColumn();
            f5.HeaderText = "所属银行";
            f5.DataPropertyName = "BankName";
            f5.CellTemplate = dgvcell;//设置模板
            f5.Width = 100;
            dataGridView1.Columns.Add(f5);

            BindData();
        }

        private void BindData()
        {
            string sql = @"SELECT e.BankAccountNo, e.BankAccountName, e.BankAccountDesc, e.BankName,e.ID
FROM T_BankAccount e";
            DataSet ds = SqlHelper.ExecuteDataSet(sql);

            dataGridView1.DataSource = ds.Tables[0];

            //dataGridView1.FirstDisplayedCell = dataGridView1.Rows[dataGridView1.Rows.Count - 1].Cells[0];
            //dataGridView1.CurrentCell = dataGridView1.Rows[dataGridView1.Rows.Count - 1].Cells[0];
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //新增按钮，清空记录
            txtBankNo.Text = "";
            //txtBankName.Text = "";
            //txtDesc.Text = "";
            txtid.Text = "";

            button1.Enabled = false;
        }
                
        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            //DataTable dt = (DataTable)this.dataGridView1.DataSource;
            //txtBankNo.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[0].ToString();
            //txtBankName.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[1].ToString();
            //txtDesc.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[2].ToString();
            //comboBox1.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[3].ToString();
            //txtid.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[4].ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)this.dataGridView1.DataSource;
            txtBankNo.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[0].ToString();
            txtBankName.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[1].ToString();
            txtDesc.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[2].ToString();
            comboBox1.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[3].ToString();
            txtid.Text = dt.Rows[dataGridView1.CurrentRow.Index].ItemArray[4].ToString();

            button1.Enabled = true;
        }

        private void NewData()
        {
            string AccountNo = txtBankNo.Text.Trim();
            string AccountName = txtBankName.Text.Trim();
            string AccountDesc = txtDesc.Text.Trim();
            string BankName = comboBox1.Text;

            if (string.IsNullOrEmpty(AccountNo))
            {
                MessageBox.Show("银行账号不能为空！");
                txtBankNo.Focus();
                return;
            }
            if (string.IsNullOrEmpty(AccountName))
            {
                MessageBox.Show("账号名称不能为空！");
                txtBankName.Focus();
                return;
            }

            string sql = string.Format(@"SELECT count(1) FROM T_BankAccount WHERE BankAccountNo='{0}'", AccountNo);

            int i = int.Parse(SqlHelper.ExecuteScalar(sql).ToString());

            if (i > 0)
            {
                MessageBox.Show(string.Format("该账号信息[{0}]已经存在，不能重复添加！", AccountNo));
                return;
            }
            else
            {
                sql = @"INSERT INTO T_BankAccount(BankAccountNo,BankAccountName,BankAccountDesc,BankName)
	VALUES('{0}','{1}','{2}','{3}')";

                sql = string.Format(sql, AccountNo, AccountName, AccountDesc, BankName);

                SqlHelper.ExecuteNonQuery(sql);

                BindData();

                dataGridView1.CurrentCell = dataGridView1.Rows[dataGridView1.Rows.Count - 1].Cells[0];
                //DataGridViewRow Row = new DataGridViewRow();
                //dataGridView1.RowHeadersWidth = 45;

                //int index = dataGridView1.Rows.Add(Row);
                //dataGridView1.Rows[index].Cells[0].Value = "";
                //dataGridView1.Rows[index].Cells[1].Value = "";
            }
        }

        private void UpdateData()
        {
            string AccountNo = txtBankNo.Text.Trim();
            string AccountName = txtBankName.Text.Trim();
            string AccountDesc = txtDesc.Text.Trim();
            string BankName = comboBox1.Text;
            string id = txtid.Text;

            if (string.IsNullOrEmpty(AccountNo))
            {
                MessageBox.Show("银行账号不能为空！");
                txtBankNo.Focus();
                return;
            }
            if (string.IsNullOrEmpty(AccountName))
            {
                MessageBox.Show("账号名称不能为空！");
                txtBankName.Focus();
                return;
            }

            string sql = @"UPDATE T_BankAccount 
                	SET BankAccountNo='{0}',BankAccountName = '{1}',BankAccountDesc = '{2}',BankName='{3}'
                	WHERE id={4}";

            sql = string.Format(sql, AccountNo, AccountName, AccountDesc, BankName, id);

            SqlHelper.ExecuteNonQuery(sql);

            int index = dataGridView1.CurrentRow.Index;
            dataGridView1.Rows[index].Cells[1].Value = txtBankNo.Text;
            dataGridView1.Rows[index].Cells[2].Value = txtBankName.Text;
            dataGridView1.Rows[index].Cells[3].Value = txtDesc.Text;
            dataGridView1.Rows[index].Cells[4].Value = comboBox1.Text;

           //BindData();
        }

        private void BankAccount_Resize(object sender, EventArgs e)
        {
            dataGridView1.Width = this.Width - 50;
            dataGridView1.Height = this.Height - 120;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (txtid.Text != "")
            {
                UpdateData();
            }
            else
            {
                NewData();
            }
        }

    }
}
