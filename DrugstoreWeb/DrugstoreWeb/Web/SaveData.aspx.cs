using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DrugstoreWeb.Web
{
    public partial class SaveData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            string dh = txtdh.Text.Trim();

            string sql = @"SELECT DISTINCT tc.spbh,tc.PCBH
FROM T_CKDMXB tc
WHERE tc.CKDBH = '{0}'";

            //string sql = @"SELECT 40268 as spbh,121212 as pcbh ";

            if (!string.IsNullOrEmpty(dh))
            {
                sql = string.Format(sql, dh);

                DataSet ds = DBAccess.SqlHelper.ExecuteDataSet(sql);
                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();

                Session["DataTable"] = ds.Tables[0];
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            
            DataTable dt = (DataTable)Session["DataTable"];
            string spbh,pcbh;
            foreach (DataRow dr in dt.Rows)
            {
                spbh = dr["spbh"].ToString();
                pcbh = dr["pcbh"].ToString();

                SearchFiles(spbh, pcbh);
            }

            lblMessage.Text = "<span style=\"border:1px #dedede solid; background-color:#ffffe1; height:16px;\"> 执行成功[" + dt.Rows.Count.ToString() + "]</span>";
        }

        private void SearchFiles(string spbh, string pcbh)
        {
            string imageName = "";
            imageName = spbh + "*" + pcbh + "*.jpg";
            string sql = "";

            string imagepath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"].ToString() + @"\检验报告";

            string[] files = System.IO.Directory.GetFiles(imagepath, imageName, System.IO.SearchOption.AllDirectories);

            foreach (string s in files)
            {
                imageName = s.Substring(s.LastIndexOf('\\') + 1);

                sql = @"if NOT EXISTS ( SELECT 1 FROM t_spxx_jybg WHERE spbh='{0}' AND pcbh = '{1}' and fileNM='{2}')
	INSERT INTO t_spxx_jybg(spbh,pcbh,filenm)
	VALUES('{0}','{1}','{2}')";

                sql = string.Format(sql, spbh, pcbh, imageName);

                DBAccess.SqlHelper.ExecuteNonQuery(sql);
            }
        }
    }
}