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
    public partial class WebForm23 : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtdate.Text = DateTime.Now.Date.ToShortDateString();
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from InwardRegister", con);
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
        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("insert into InwardRegister(Date,Vehicleno,Vehicletype,Time) values('" + txtdate.Text.Trim() + "','" + txtvehiclenumber.Text.Trim() + "','" + txtvehicletype.Text.Trim() + "','" + txttime.Text.Trim() + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Reset();
            gvbind();
        }

        private void Reset()
        {
            txtvehiclenumber.Text = "";
            txtvehicletype.Text = "";
            txttime.Text = "";
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
            string FileName = "InwardRegister" + DateTime.Now + ".xls";
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
            SqlConnection con = new SqlConnection(strCon);
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM InwardRegister where id='" + Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
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
            SqlConnection con = new SqlConnection(strCon);
            int Userid = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label labID = (Label)row.FindControl("labID");
            TextBox txtvehiclenumber = (TextBox)row.Cells[1].Controls[0];
            TextBox txtvehicletype = (TextBox)row.Cells[2].Controls[0];
            Gridview1.EditIndex = -1;
            con.Open();
            SqlCommand cmd = new SqlCommand("update InwardRegister set Vehicleno='" + txtvehiclenumber.Text + "', Vehicletype='" + txtvehicletype.Text + "' where Id='" + Userid + "'", con);
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