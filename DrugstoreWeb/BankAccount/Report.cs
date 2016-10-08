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
    public partial class Report : Form
    {
        public Report()
        {
            InitializeComponent();

            Init();

            DateTime dt = DateTime.Now;
            dt = dt.AddDays(1 - dt.Day).AddMonths(-1);
            dateTimePicker1.Value = dt;
        }

        private void Init()
        {
            for (int i = 0; i < dataGridView1.Columns.Count; i++)
            {
                dataGridView1.Columns[i].Width = 50;
                if (i == 0) continue;
                dataGridView1.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
            }

        }

        private void Report_Resize(object sender, EventArgs e)
        {
            dataGridView1.Width = this.Width - 40;
            dataGridView1.Height = this.Height - 70;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string ks = dateTimePicker1.Text;
            string js = dateTimePicker2.Text;
            DataSet ds = SqlHelper.ExecuteDataSet(string.Format("exec sp_BankAccountCheck '{0}','{1}'", ks, js));

            dataGridView1.DataSource = ds.Tables[0];

            for (int i = 0; i < dataGridView1.Columns.Count; i++)
            {
                if (i == 0) continue;
                dataGridView1.Columns[i].DefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleRight;
                dataGridView1.Columns[i].SortMode = DataGridViewColumnSortMode.NotSortable;
            }

            //BuildColor();
        }


        /// <summary>
        /// 自定单元格颜色
        /// </summary>
        private void BuildColor()
        {
            for (int i = 0; i < this.dataGridView1.Rows.Count; i++)
            {
                for (int j = 0; j < dataGridView1.ColumnCount; j++)
                {
                    if (this.dataGridView1[i, j] != null && this.dataGridView1[i, j].Value != null)
                    {
                        // 根据条件设置不同的颜色
                        string value = this.dataGridView1[i, j].Value.ToString();
                        bool b = value.StartsWith("-");

                        if (this.dataGridView1[i, j].Value.ToString().StartsWith("-"))
                            this.dataGridView1[i, j].Style.BackColor = Color.Red;

                    }
                }
            }

        }

        private void dataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {


            DataGridView dgv = (DataGridView)sender;
            string colName = dgv.Columns[e.ColumnIndex].Name;
            if (colName != "交易日期")
            {
                if (e.Value != null && e.Value.ToString().Length != 0)
                {
                    if (e.Value.ToString().Substring(0, 1) == "-")
                    {
                        e.CellStyle.ForeColor = Color.Red;
                    }
                    Decimal d = Decimal.Parse(e.Value.ToString());
                    e.Value = d.ToString("N");
                    e.FormattingApplied = true;
                }
            }

        }

        private void dataGridView1_RowPostPaint(object sender, DataGridViewRowPostPaintEventArgs e)
        {
            using (var brush = new SolidBrush(dataGridView1.RowHeadersDefaultCellStyle.ForeColor))
            {

                e.Graphics.DrawString((e.RowIndex + 1).ToString(), dataGridView1.DefaultCellStyle.Font, brush, e.RowBounds.Location.X + 12, e.RowBounds.Y + 5);

            }
        }

    }
}
