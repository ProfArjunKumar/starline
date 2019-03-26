using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Web.Caching;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Text;
using System;
using System.Web.UI;
using System.Configuration;
using BLL;
using System.Data.SqlClient;

namespace Starline
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ProductMasterID();
                reset();
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from ProductMaster", con);
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

        private void reset()
        {
            txtmaterial.Text = string.Empty;
            txtuom.Text = string.Empty;
            txtsize.Text = string.Empty;
            txtlength.Text = string.Empty;
            txtweight.Text = string.Empty;
            txtheight.Text = string.Empty;
            txtgrade.Text = string.Empty;
            txtrate.Text = string.Empty;
        }
        private void ProductMasterID()
        {
            string code = "SLP-PM-";
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(ProductId) from ProductMaster", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtproductid.Text = code + i.ToString();
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string mCode = string.Empty;
            cls.productmasterinsertBLL(txtproductid.Text, txtmaterial.Text, txtsize.Text, txtuom.Text, txtlength.Text, txtweight.Text, txtheight.Text, txtgrade.Text, txtrate.Text);
            reset();
            ProductMasterID();
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
            string FileName = "ProductMaster" + DateTime.Now + ".xls";
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

        protected void Gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            gvbind();
        }

        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM ProductMaster where id='" + Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            gvbind();
        }

        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            gvbind();
        }

        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            int Userid = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label labID = (Label)row.FindControl("labID");
            TextBox txtproductid = (TextBox)row.Cells[1].Controls[0];
            TextBox txtmaterial = (TextBox)row.Cells[2].Controls[0];
            TextBox txtsize = (TextBox)row.Cells[3].Controls[0];
            TextBox txtuom = (TextBox)row.Cells[4].Controls[0];
            TextBox txtlength = (TextBox)row.Cells[5].Controls[0];
            TextBox txtweight = (TextBox)row.Cells[6].Controls[0];
            TextBox txtheight = (TextBox)row.Cells[7].Controls[0];
            TextBox txtgrade = (TextBox)row.Cells[8].Controls[0];
            TextBox txtrate = (TextBox)row.Cells[9].Controls[0];
            Gridview1.EditIndex = -1;
            con.Open();
            SqlCommand cmd = new SqlCommand("update ProductMaster set ProductId='" + txtproductid.Text + "', Material='" + txtmaterial.Text + "',Size='" + txtsize.Text + "',UOM='" + txtuom.Text + "',Length='" + txtlength.Text + "',Weight='" + txtweight.Text + "',Height='" + txtheight.Text + "',Grade='" + txtgrade.Text + "',Rate='" + txtrate.Text + "'where Id='" + Userid + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            gvbind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }
    }
}