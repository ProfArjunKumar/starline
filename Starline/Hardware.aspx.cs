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
    public partial class WebForm5 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AutoGenerateCode();
                txtcategory.Text = "Hardware";
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from mhardware", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
               
                GridView1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        private void AutoGenerateCode()
        {
            string code = "SP-H-";
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(hmaterialcode) from mhardware", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtmaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string mCode = string.Empty;
            cls.hardwareinsert(txtmaterialcode.Text, txtcategory.Text, txtsubcategory.Text, txtmaterial.Text, txtlength.Text, txtheight.Text, txtwidth.Text, txtddlUOM.Text, txtspecifications.Text, txtsize.Text, txtminimumstock.Text, txtavailablestock.Text);
            cls.hardwarematerial(txtmaterial.Text);
            this.gvbind();
            Reset();
            AutoGenerateCode();
        }

        private void Reset()
        {
            txtsubcategory.Text = "";
            txtlength.Text = "";
            txtwidth.Text = "";
            txtheight.Text = "";
            txtspecifications.Text = "";
            txtminimumstock.Text = "";
            txtcategory.Text = "";
            txtmaterial.Text = "";
            txtddlUOM.SelectedIndex = 0;
            txtsize.Text = "";
            txtavailablestock.Text = "";
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
            string FileName = "Hardware" + DateTime.Now + ".xls";
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

        protected void txtlength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());

            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtsize.Text = str.ToString();
        }

        protected void txtwidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());

            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtsize.Text = str.ToString();
        }

        protected void txtthickness_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());

            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtsize.Text = str.ToString();
        }
    }
}