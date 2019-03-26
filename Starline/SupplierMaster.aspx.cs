using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Starline
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            SupplierAutoGenerateCode();
            txtdate.Text = DateTime.Now.Date.ToShortDateString();
           
        }

       
        private void SupplierAutoGenerateCode()
        {
            string code = "SLP-SUP-";
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(suplierid) from vendor", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtsupplierid.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("Insert into vendor(suplierid,supliername,phoneno,products,tax,date,contactperson,emailid,hsncode,address) values('" + txtsupplierid.Text + "','" + txtsuppliername.Text + "','" + txtphonenumber.Text + "','" + ddlproduct.SelectedItem.ToString() + "','" + ddltax.SelectedItem.ToString() + "','" + txtdate.Text + "','" + txtcontactname.Text + "','" + txtemailid.Text + "','" + ddlhsncode.SelectedItem.ToString() + "','" + txtaddress.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            getsupplierdata();
            SupplierAutoGenerateCode();
            Reset();
        }

        private void Reset()
        {
            txtsuppliername.Text = string.Empty;
            txtphonenumber.Text = string.Empty;
            ddlproduct.ClearSelection();
            ddltax.Text = string.Empty;
            txtcontactname.Text = string.Empty;
            txtemailid.Text = string.Empty;
            ddlhsncode.ClearSelection();
            txtaddress.Text = string.Empty;
        }

        private void getsupplierdata()
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter("select * from vendor", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
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
            string FileName = "SupplierMaster" + DateTime.Now + ".xls";
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