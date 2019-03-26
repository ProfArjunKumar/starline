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
    public partial class WebForm4 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CustomerentryAutoGenerateCode();
                reset();
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from DriverMaster", con);
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
            txtname.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtaddress.Text = string.Empty;
            txtpan.Text = string.Empty;
        }

        private void CustomerentryAutoGenerateCode()
        {
            string code = "SLP-DR-";
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(DriverId) from DriverMaster", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtdriverid.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string mCode = string.Empty;
            cls.drivermasterinsertBLL(txtdriverid.Text, txtname.Text, txtPhone.Text, txtaddress.Text, txtpan.Text);            
            reset();
            CustomerentryAutoGenerateCode();
            Gridview1.DataBind();
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
            string FileName = "DriverMaster" + DateTime.Now + ".xls";
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
            SqlCommand cmd = new SqlCommand("delete FROM DriverMaster where id='" + Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
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
            TextBox txtdriverid = (TextBox)row.Cells[0].Controls[0];
            TextBox txtname = (TextBox)row.Cells[1].Controls[0];
            TextBox txtPhone = (TextBox)row.Cells[2].Controls[0];
            TextBox txtaddress = (TextBox)row.Cells[3].Controls[0];
            TextBox txtpan = (TextBox)row.Cells[4].Controls[0];
            Gridview1.EditIndex = -1;
            con.Open();
            SqlCommand cmd = new SqlCommand("update DriverMaster set DriverId='" + txtdriverid.Text + "', Name='" + txtname.Text + "',Phone='" + txtPhone.Text + "',Address='" + txtaddress.Text + "',PanCardNumber='" + txtpan.Text + "' where Id='" + Userid + "'", con);
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