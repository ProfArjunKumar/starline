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
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;

namespace Starline
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                packingMaterialAutoGenerateCode();
                papercategory.Text = "Paper Packing";
                paperscategory.Text = "Metric";
                paperUOM1.Text = "MM";
                paperuom3.Text = "MM";
                paperuom2.Text = "MM";
                BindGrid();
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
        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM mpaperpacking"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Gridview1.DataSourceID = null;
                            Gridview1.DataSource = dt;
                            Gridview1.DataBind();
                        }
                    }
                }
            }
        }
        private void packingMaterialAutoGenerateCode()
        {
            string code = "SP-PP-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(pamaterialcode) from [mpaperpacking]", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            papermaterialcode.Text = code + i.ToString();
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            cls.paperpacking(papermaterialcode.Text, paperscategory.Text, paperlength.Text, paperwidth.Text, paperspecification.Text, paperminimumquantity.Text, papercategory.Text, papermaterial.Text, paperheight.Text, paperUOM1.Text, paperSIZE.Text, papertotalquantity.Text, paperheight.Text, paperwidth.Text, papersqmt.Text, papersqft.Text);
            cls.papermaterial(papermaterial.Text);
            this.BindGrid();
            packingMaterialAutoGenerateCode();
            reset();
        }
        private void reset()
        {
            paperlength.Text = string.Empty;
            paperwidth.Text = string.Empty;
            paperspecification.Text = string.Empty;
            paperminimumquantity.Text = string.Empty;
            papermaterial.Text = string.Empty;
            paperheight.Text = string.Empty;
            paperUOM1.Text = string.Empty;
            paperuom3.Text = string.Empty;
            paperuom2.Text = string.Empty;
            paperSIZE.Text = string.Empty;
            papertotalquantity.Text = string.Empty;
            papersqft.Text = string.Empty;
            papersqmt.Text = string.Empty;
        }

        protected void papertotalquantity_TextChanged(object sender, EventArgs e)
        {
            papersqft.Text = Calculatecft().ToString();
            papersqmt.Text = Calculatecum().ToString();
        }

        private object Calculatecum()
        {
            double calcum = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(paperlength.Text);
                double width = Convert.ToDouble(paperwidth.Text);
                double height = Convert.ToDouble(paperheight.Text);
                double totalqty = Convert.ToDouble(papertotalquantity.Text);
                if (paperscategory.Text == "Metric")
                {
                    calcum = ((length * width * totalqty) / (1000000));
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

        private object Calculatecft()
        {
            double calcft = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(paperlength.Text);
                double width = Convert.ToDouble(paperwidth.Text);
                double height = Convert.ToDouble(paperheight.Text);
                double totalqty = Convert.ToDouble(papertotalquantity.Text);

                if (paperscategory.Text == "Metric")
                {
                    calcft = (length * width * totalqty) / ((25.4 * 25.4) * (12 * 12));
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
        protected void paperwidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(paperlength.Text.ToString());
            if (!string.IsNullOrEmpty(paperwidth.Text))
            {
                str.Append(" * ");
                str.Append(paperwidth.Text.ToString());
                if (!string.IsNullOrEmpty(paperheight.Text))
                {
                    str.Append(" * ");
                    str.Append(paperheight.Text.ToString());
                }
            }
            paperSIZE.Text = str.ToString();
        }

        protected void paperlength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(paperlength.Text.ToString());
            if (!string.IsNullOrEmpty(paperwidth.Text))
            {
                str.Append(" * ");
                str.Append(paperwidth.Text.ToString());
                if (!string.IsNullOrEmpty(paperheight.Text))
                {
                    str.Append(" * ");
                    str.Append(paperheight.Text.ToString());
                }
            }
            paperSIZE.Text = str.ToString();
        }

        protected void paperheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(paperlength.Text.ToString());
            if (!string.IsNullOrEmpty(paperwidth.Text))
            {
                str.Append(" * ");
                str.Append(paperwidth.Text.ToString());
                if (!string.IsNullOrEmpty(paperheight.Text))
                {
                    str.Append(" * ");
                    str.Append(paperheight.Text.ToString());
                }
            }
            paperSIZE.Text = str.ToString();
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
            TextBox txtproductid = (TextBox)row.Cells[0].Controls[0];
            TextBox txtmaterial = (TextBox)row.Cells[1].Controls[0];
            TextBox txtsize = (TextBox)row.Cells[2].Controls[0];
            TextBox txtuom = (TextBox)row.Cells[3].Controls[0];
            TextBox txtlength = (TextBox)row.Cells[4].Controls[0];
            TextBox txtweight = (TextBox)row.Cells[5].Controls[0];
            TextBox txtheight = (TextBox)row.Cells[6].Controls[0];
            TextBox txtgrade = (TextBox)row.Cells[7].Controls[0];
            TextBox txtrate = (TextBox)row.Cells[8].Controls[0];
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