using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BankAccount
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
        }

        private void 帐号维护ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            //银行帐号维护
            if (!ShowChildrenForm("银行帐号维护"))
            {
                BankAccount fm = new BankAccount();
                fm.MdiParent = this;
                fm.WindowState = FormWindowState.Maximized;
                fm.Show();
            }  
        }

        private void 数据导入ToolStripMenuItem_Click(object sender, EventArgs e)
        {

            if (!ShowChildrenForm("数据导入"))
            {
                FileImport fm = new FileImport();
                fm.MdiParent = this;
                fm.WindowState = FormWindowState.Maximized;
                fm.Show();
            }            
        }

        private bool ShowChildrenForm(string p_ChildrenFormText)
        {
            int i;     //依次检测当前窗体的子窗体     
            for (i = 0; i < this.MdiChildren.Length; i++)
            {         //判断当前子窗体的Text属性值是否与传入的字符串值相同
                if (this.MdiChildren[i].Text == p_ChildrenFormText)
                {             //如果值相同则表示此子窗体为想要调用的子窗体，激活此子窗体并返回true值   
                    this.MdiChildren[i].Activate();
                    return true;
                }
            }     //如果没有相同的值则表示要调用的子窗体还没有被打开，返回false值     
            return false;
        }

        private void 数据查询ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (!ShowChildrenForm("数据查询"))
            {
                Report fm = new Report();
                fm.MdiParent = this;
                fm.WindowState = FormWindowState.Maximized;
                fm.Show();
            }    
        }

        private void Main_Load(object sender, EventArgs e)
        {

        }    

    }
}
