using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Collections.Specialized;
using System.Data;

namespace DrugstoreWeb
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Params["spbh"] != null && Request.Params["spbh"] != "")
                {
                    string pzwh = "";
                    string pcbh = "";
                    pzwh = Request.Params["spbh"].Trim();

                    if (Request.Params["pcbh"] != null && Request.Params["pcbh"] != "")
                    {
                        pcbh = Request.Params["pcbh"].ToString();
                        txtpcbh.Text = pcbh;
                        txtpcbh.AutoPostBack = true;
                    }

                    txtspbh.Text = pzwh;
                    txtspbh.AutoPostBack = true;

                    Search(pzwh, pcbh);
                }
            }
        }

        protected void lstFile_SelectedIndexChanged(object sender, EventArgs e)
        {
            int i = lstFile.SelectedIndex;

            imgsp.ImageUrl = lstFile.Items[i].Value;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string pzwh = "";
            string pcbh = "";

            pzwh = txtspbh.Text.Trim();
            pcbh = txtpcbh.Text.Trim();
            Search(pzwh, pcbh);
        }

        private void Search(string spbh, string pcbh)
        {
            imgsp.ImageUrl = "";
            string imageName = "";

            if (chk.Checked)
            {
                imageName = "*" + spbh + "*" + pcbh + "*.jpg";
            }
            else
            {
                imageName = spbh + "*" + pcbh + "*.jpg";
            }

            string url = ""; // "~/Images/检验报告/";

            string imagepath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"].ToString() + @"\检验报告";
            string imagefolder = System.Configuration.ConfigurationManager.AppSettings["ImageFolder"].ToString();

            string[] files = System.IO.Directory.GetFiles(imagepath, imageName, System.IO.SearchOption.AllDirectories);

            //var res = files.Select(p => new { p, filename = System.IO.Path.GetFileNameWithoutExtension(p) });

            lstFile.Items.Clear();

            foreach (string s in files)
            {
                imageName = s.Substring(s.LastIndexOf('\\') + 1);

                url = "~/" + (s.Substring(s.LastIndexOf(imagefolder))).Replace("\\", "/");

                lstFile.Items.Add(new ListItem(imageName, url));
            }

            if (files.Length > 0)
            {
                imgsp.ImageUrl = lstFile.Items[0].Value;
                lstFile.SelectedIndex = 0;
            }
        }

        //保存文件名到数据库，便于和实货对比，检验报告是否齐全
        private void savedata()
        {
            string sql = @"SELECT distinct m.spbh,m.pcbh
FROM t_ckdmxb m
JOIN t_ckdzb z ON m.CKDBH=z.CKDBH
WHERE z.JSDW='109' AND bz <> '...'";

            DataSet ds = DBAccess.SqlHelper.ExecuteDataSet(sql);
            string spbh, pcbh;

            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                spbh = dr["spbh"].ToString();
                pcbh = dr["pcbh"].ToString();

                SearchFiles(spbh,pcbh);
            }    

        }

        private void SearchFiles(string spbh, string pcbh)
        {
            string imageName = "";
            imageName = spbh + "_" + pcbh + "*.jpg";
            string sql = "";

            string imagepath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"].ToString() + @"\检验报告";

            string[] files = System.IO.Directory.GetFiles(imagepath, imageName, System.IO.SearchOption.AllDirectories);

            foreach (string s in files)
            {
                imageName = s.Substring(s.LastIndexOf('\\') + 1);

                sql = @"if NOT EXISTS ( SELECT 1 FROM t_spxx_jybg WHERE spbh='{0}' AND pcbh = '{1}' and fileNM='{2}')
	INSERT INTO t_spxx_jybg(spbh,pcbh,filenm)
	VALUES('{0}','{1}','{2}')";

                DBAccess.SqlHelper.ExecuteNonQuery(sql);
            }
        }



        //private string get_Sign(Hashtable)
        //{

        //}

        /// <summary>
        /// 分析 url 字符串中的参数信息
        /// </summary>
        /// <param name="url">输入的 URL</param>
        /// <param name="baseUrl">输出 URL 的基础部分</param>
        /// <param name="nvc">输出分析后得到的 (参数名,参数值) 的集合</param>
        /// <author>木野狐(Neil Chen)</author>
        /// <date>2005-06-23</date>
        static void ParseUrl(string url, out string baseUrl, out NameValueCollection nvc)
        {
            if (url == null)
                throw new ArgumentNullException("url");

            nvc = new NameValueCollection();
            baseUrl = "";

            if (url == "")
                return;

            int questionMarkIndex = url.IndexOf('?');

            if (questionMarkIndex == -1)
            {
                baseUrl = url;
                return;
            }
            baseUrl = url.Substring(0, questionMarkIndex);
            if (questionMarkIndex == url.Length - 1)
                return;
            string ps = url.Substring(questionMarkIndex + 1);

            // 开始分析参数对    
            System.Text.RegularExpressions.Regex re = new System.Text.RegularExpressions.Regex(@"(^|&)?(/w+)=([^&]+)(&|$)?", System.Text.RegularExpressions.RegexOptions.Compiled);
            System.Text.RegularExpressions.MatchCollection mc = re.Matches(ps);

            foreach (System.Text.RegularExpressions.Match m in mc)
            {
                nvc.Add(m.Result("$2"), m.Result("$3"));
            }
        }
    }
}
