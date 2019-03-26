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
    public partial class WebForm6 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                WooodAutoGenerateCode();
                txtcategory.Text = "wood";
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT mid, mmaterialcode,mspecifications,mcategory,msubcategory,mmaterial,msize,mminimum,mtotalqty,cft,cum FROM mwood", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                Gridview1.DataSource = ds;
                Gridview1.DataBind();
            }
            else
            {
                ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
                Gridview1.DataSource = ds;
                Gridview1.DataBind();
                int columncount = Gridview1.Rows[0].Cells.Count;
                Gridview1.Rows[0].Cells.Clear();
                Gridview1.Rows[0].Cells.Add(new TableCell());
                Gridview1.Rows[0].Cells[0].ColumnSpan = columncount;
                Gridview1.Rows[0].Cells[0].Text = "No Records Found";
            }
        }

        private void WooodAutoGenerateCode()
        {
            string code = "SP-W-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(mmaterialcode) from mwood", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtmaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            cls.Woodinsertdata(txtmaterialcode.Text, txtcategory.Text, ddlsubcategory.SelectedItem.Text, txtmaterial.Text, txtlength.Text, txtUOM.Text, txtheight.Text, txtuom1.Text, txtwidth.Text, txtuomh.Text, txtspecification.Text, txtSIZE.Text, txtminimumquantity.Text, txttotalquantity.Text, txtsqft.Text, txtsqmt.Text);
            cls.woodmaterial(txtmaterial.Text);            
            this.gvbind();
            WooodAutoGenerateCode();
            reset();
        }

        private void reset()
        {
            txtlength.Text = string.Empty;
            txtwidth.Text = string.Empty;
            txtspecification.Text = string.Empty;
            txtminimumquantity.Text = string.Empty;
            txtmaterial.Text = string.Empty;
            txtheight.Text = string.Empty;
            txtUOM.Text = string.Empty;
            txtuom1.Text = string.Empty;
            txtuomh.Text = string.Empty;
            txtSIZE.Text = string.Empty;
            txttotalquantity.Text = string.Empty;
            ddlsubcategory.ClearSelection();
            txtsqft.Text = string.Empty;
            txtsqmt.Text = string.Empty;
        }

       

        protected void txttotalquantity_TextChanged(object sender, EventArgs e)
        {
            txtsqft.Text = CalculateCFT().ToString();
            txtsqmt.Text = CalculateCUM().ToString();
        }
        private object CalculateCUM()
        {
            double calcum = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(txtlength.Text);
                double width = Convert.ToDouble(txtwidth.Text);
                double height = Convert.ToDouble(txtheight.Text);
                double totalqty = Convert.ToDouble(txttotalquantity.Text);
                if (ddlsubcategory.Text == "Metric")
                {
                    calcum = (length * width * height * totalqty) / (1000000942.3425024);
                    double d = calcum;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
                if (ddlsubcategory.Text == "Imperial")
                {
                    // calcft = ((length * width * height) / (144)) * (totalqty);
                    calcum = (((length * width * height) / (144)) * (totalqty)) / (35.3147);
                    double d = calcum;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return r;
        }
        private object CalculateCFT()
        {
            double calcft = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(txtlength.Text);
                double width = Convert.ToDouble(txtwidth.Text);
                double height = Convert.ToDouble(txtheight.Text);
                double totalqty = Convert.ToDouble(txttotalquantity.Text);
                if (ddlsubcategory.Text == "Metric")
                {
                    calcft = (length * width * height * totalqty) / (28316846.592);
                    double d = calcft;
                    //r = Convert.ToDouble(d.ToString("#.00000000"));
                    r = Convert.ToDouble(string.Format("{0:0.00}", d));
                }
                if (ddlsubcategory.Text == "Imperial")
                {
                    calcft = ((length * width * height) / (144)) * (totalqty);
                    double d = calcft;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return r;
        }

        protected void ddlsubcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsubcategory.SelectedItem.ToString() == "Metric")
            {
                txtUOM.Text = "MM";
                txtuomh.Text = "MM";
                txtuom1.Text = "MM";
            }
            else
            {
                txtUOM.Text = "Feet";
                txtuomh.Text = "Inch";
                txtuom1.Text = "Inch";
            }
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
            txtSIZE.Text = str.ToString();
        }

        protected void txtheight_TextChanged(object sender, EventArgs e)
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
            txtSIZE.Text = str.ToString();
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
            txtSIZE.Text = str.ToString();
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
            string FileName = "Wood" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            Gridview1.GridLines = GridLines.Both;
            Gridview1.HeaderStyle.Font.Bold = true;
            Gridview1.RenderControl(htmltextwrtter);
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