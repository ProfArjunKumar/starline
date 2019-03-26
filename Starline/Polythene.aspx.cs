using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Configuration;
using BLL;
using System.Web.Caching;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Text;

namespace Starline
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        Class1 PolytheneP = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PolytheneAutoGenerateCode();
                polythenecategory.Text = "polythene";
            }
        }
        private void PolytheneAutoGenerateCode()
        {
            string code = "SP-POLY-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(pomaterialcode) from mpolythene", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            polythenematerialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string mCode = string.Empty;
            PolytheneP.polythenedata(polythenematerialcode.Text, polythenesubcategory.Text, polythenelength.Text, polythenewidth.Text, polythenespecification.Text, polytheneminiomumstock.Text, polythenecategory.Text, polythenematerial.Text, txtheight.Text, polytheneuom.Text, polythenesize.Text, polytheneavailablestock.Text);
            PolytheneP.polythenematerial(polythenematerial.Text);
            this.BindGrid();
            PolytheneAutoGenerateCode();
            reset();
        }
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersconnectionstring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT  * FROM mpolythene"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSourceID = null;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }
        private void reset()
        {
            polythenelength.Text = string.Empty;
            polythenewidth.Text = string.Empty;
            polythenespecification.Text = string.Empty;
            polytheneminiomumstock.Text = string.Empty;
            polythenematerial.Text = string.Empty;
            txtheight.Text = string.Empty;
            polytheneuom.ClearSelection();
            polythenesize.Text = string.Empty;
            polytheneavailablestock.Text = string.Empty;
            polythenesubcategory.Text = string.Empty;
        }

        protected void txtheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(polythenelength.Text.ToString());
            if (!string.IsNullOrEmpty(polythenewidth.Text))
            {
                str.Append(" * ");
                str.Append(polythenewidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            polythenesize.Text = str.ToString();
        }

        protected void polythenelength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(polythenelength.Text.ToString());

            if (!string.IsNullOrEmpty(polythenewidth.Text))
            {
                str.Append(" * ");
                str.Append(polythenewidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            polythenesize.Text = str.ToString();
        }

        protected void polythenewidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(polythenewidth.Text.ToString());
            if (!string.IsNullOrEmpty(polythenelength.Text))
            {
                str.Append(" * ");
                str.Append(polythenelength.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            polythenesize.Text = str.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }

        private void ExportGridToExcel()
        {

            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Polythene" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

    }
}