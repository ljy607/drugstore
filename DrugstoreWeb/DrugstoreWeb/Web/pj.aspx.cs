using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;
using System.Collections.Specialized;

namespace DrugstoreWeb
{
    public partial class pj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.Params["pzwh"] != null && Request.Params["pzwh"] != "")
                {
                    string pzwh = "";
                    pzwh = Request.Params["pzwh"].Trim();
                    txtspbh.Text = pzwh;
                    txtspbh.AutoPostBack = true;
                    Search(pzwh);
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

            pzwh = txtspbh.Text.Trim();

            Search(pzwh);
        }

        private void Search( string pzwh)
        {
            imgsp.ImageUrl = "";
            string imageName = "";

            if (chk.Checked)
            {
                imageName = "*"+pzwh + "*.jpg";
            }
            else
            {
                imageName = pzwh + "*.jpg";
            }

            string url = "";

            string imagepath = System.Configuration.ConfigurationManager.AppSettings["ImagePath"].ToString() + @"\批件";
            string imagefolder = System.Configuration.ConfigurationManager.AppSettings["ImageFolder"].ToString();

            string[] files = System.IO.Directory.GetFiles( imagepath, imageName, System.IO.SearchOption.AllDirectories);

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
                //imageName = lstFile.Items[0].Text;
                //imageName = imageName.Substring(imageName.LastIndexOf('\\') + 1);
                //imgsp.ImageUrl = url + imageName;
                imgsp.ImageUrl = lstFile.Items[0].Value;
                lstFile.SelectedIndex = 0;            
            }
        }

    }
}
