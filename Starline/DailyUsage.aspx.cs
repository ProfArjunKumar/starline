using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.Text.RegularExpressions;
using BLL;
using System.Web.Services;

namespace Starline
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCategories();
                CustomerentryAutoGenerateCode();
                dailydate.Text = DateTime.Now.Date.ToShortDateString();
                Reset();
                gvbind();
            }
        }
        private void gvbind()
        {
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Dailyconsumption", con);
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

        private void Reset()
        {
            ddlcategory.ClearSelection();
            ddlmaterial.ClearSelection();
            dailyworkorder.Text = string.Empty;
            dailyolddate.Text = string.Empty;
            dailyavailablestock.Text = string.Empty;
            dailyrequiredquantity.Text = string.Empty;
            dailysubcategory.Text = "";
            dailymaterial.Text = string.Empty;
            dailysize.Text = string.Empty;
            dailycustomername.Text = string.Empty;
            dailypurpose.Text = string.Empty;
            dailyminimumquantity.Text = string.Empty;
        }

        private void CustomerentryAutoGenerateCode()
        {
            string code = "SLP-DailyUsage-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(DailyusageId) from Dailyconsumption", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            dailyusageid.Text = code + i.ToString();
        }

        private void BindCategories()
        {
            DailyConsumption daily = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = daily.GetCategories();
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "categoryname";
            ddlcategory.DataValueField = "categoryid";
            ddlcategory.DataBind();
            ddlcategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "-1"));
            ddlmaterial.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoryname = ddlcategory.SelectedItem.ToString();
            DailyConsumption dc = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = dc.Getmaterialcode(categoryname);
            ddlmaterial.DataSource = dt;
            ddlmaterial.DataTextField = "Code";
            ddlmaterial.DataValueField = "ID";
            ddlmaterial.DataBind();
            ddlmaterial.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        protected void ddlmaterial_SelectedIndexChanged(object sender, EventArgs e)
        {
            Class1 dailycon = new Class1();
            DailyConsumption dc = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = dc.Getmaterialdetails(ddlmaterial.SelectedItem.ToString().Split('(')[0].Trim(), ddlcategory.SelectedItem.ToString());
            string value = ddlcategory.SelectedItem.ToString();
            if (dt.Rows.Count > 0)
            {
                switch (value)
                {
                    case "Hardware":

                        ddailycategory.Text = dt.Rows[0]["hcategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["htotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["hsubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["hsize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["hminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["hmaterial"].ToString();
                        break;
                    case "wood":
                        ddailycategory.Text = dt.Rows[0]["mcategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["mtotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["msubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["msize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["mminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["mmaterial"].ToString();
                        break;
                    case "plywood":
                        ddailycategory.Text = dt.Rows[0]["pcategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["ptotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["psubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["psize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["pminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["pmaterial"].ToString();
                        break;
                    case "polythene":
                        ddailycategory.Text = dt.Rows[0]["pocategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["pototalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["posubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["posize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["pominimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["pomaterial"].ToString();
                        break;
                    case "Paper Packing":
                        ddailycategory.Text = dt.Rows[0]["pacategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["patotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["pasubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["pasize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["paminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["pamaterial"].ToString();
                        break;
                    case "Packaging material":
                        ddailycategory.Text = dt.Rows[0]["paccategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["pactotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["pacsubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["pacsize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["pacminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["pacmaterial"].ToString();
                        break;
                    case "Steel":
                        ddailycategory.Text = dt.Rows[0]["stcategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["sttotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["stsubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["stsize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["stminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["stmaterial"].ToString();
                        break;
                    case "Tools":
                        ddailycategory.Text = dt.Rows[0]["tcategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["ttotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["tsubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["tsize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["tminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["tmaterial"].ToString();
                        break;
                    case "Miscellaneous":
                        ddailycategory.Text = dt.Rows[0]["miscategory"].ToString();
                        dailyavailablestock.Text = dt.Rows[0]["mistotalqty"].ToString();
                        dailysubcategory.Text = dt.Rows[0]["missubcategory"].ToString();
                        dailysize.Text = dt.Rows[0]["missize"].ToString();
                        dailyminimumquantity.Text = dt.Rows[0]["misminimum"].ToString();
                        dailymaterial.Text = dt.Rows[0]["mismaterial"].ToString();
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Material code not exists')", true);
                        break;

                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Class1 dailycon = new Class1();
            if (dailycustomername.Text != "" && dailyrequiredquantity.Text != "")
            {
                DailyConsumption dc = new DailyConsumption();
                DataTable dt = new DataTable();
                string value = (Convert.ToDecimal(dailyavailablestock.Text) - Convert.ToDecimal(dailyrequiredquantity.Text)).ToString();
                dailycon.dailyInsertdata(ddlmaterial.SelectedItem.ToString(), ddlcategory.SelectedItem.ToString(), dailymaterial.Text, dailysize.Text, dailysubcategory.Text, value, dailyminimumquantity.Text, dailydate.Text, dailycustomername.Text, dailyrequiredquantity.Text, dailypurpose.Text, dailyolddate.Text, dailyworkorder.Text, dailyusageid.Text);
                string choice = ddlcategory.SelectedItem.ToString();

                switch (choice)
                {
                    case "Hardware":
                        string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mhardware set htotalqty='" + data + "' where hmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        break;
                    case "wood":
                        string constr1 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr1))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mwood set mtotalqty ='" + data + "' where mmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "plywood":
                        string constr2 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mplywood set ptotalqty ='" + data + "' where pmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "polythene":
                        string constr3 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr3))
                        {
                            decimal data = decimal.Parse(value);

                            using (SqlCommand cmd = new SqlCommand("update mpolythene set pototalqty ='" + data + "' where pomaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Paper Packing":
                        string constr4 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr4))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpaperpacking set patotalqty ='" + data + "' where pamaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Packaging material":
                        string constr5 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr5))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpackingmaterial set pactotalqty ='" + data + "' where pacmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Steel":
                        string constr6 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr6))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update msteel set sttotalqty ='" + data + "' where stmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Tools":
                        string constr7 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr7))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mtools set ttotalqty ='" + data + "' where tmaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Miscellaneous":
                        string constr8 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr8))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mmiscellaneous set mistotalqty ='" + data + "' where mismaterial='" + dailymaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    default:
                        break;
                }
                Reset();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Please Enter The Required Fields')", true);
            }
            CustomerentryAutoGenerateCode();
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
            string FileName = "DailyUsage" + DateTime.Now + ".xls";
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
        protected void Gridview1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            Gridview1.EditIndex = -1;
            gvbind();
        }

        protected void Gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            int Userid = Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label labID = (Label)row.FindControl("labID");
            TextBox ddlmaterial = (TextBox)row.Cells[0].Controls[0];
            TextBox ddlcategory = (TextBox)row.Cells[1].Controls[0];
            TextBox dailymaterial = (TextBox)row.Cells[2].Controls[0];
            TextBox dailysize = (TextBox)row.Cells[3].Controls[0];
            TextBox dailysubcategory = (TextBox)row.Cells[4].Controls[0];
            TextBox dailyavailablestock = (TextBox)row.Cells[5].Controls[0];
            TextBox dailyminimumquantity = (TextBox)row.Cells[6].Controls[0];
            TextBox dailyolddate = (TextBox)row.Cells[7].Controls[0];
            TextBox dailycustomername = (TextBox)row.Cells[8].Controls[0];
            TextBox dailyrequiredquantity = (TextBox)row.Cells[9].Controls[0];
            TextBox dailypurpose = (TextBox)row.Cells[10].Controls[0];
            TextBox dailydate = (TextBox)row.Cells[11].Controls[0];
            TextBox dailyworkorder = (TextBox)row.Cells[12].Controls[0];
            TextBox dailyusageid = (TextBox)row.Cells[13].Controls[0];
            Gridview1.EditIndex = -1;
            con.Open();
            SqlCommand cmd = new SqlCommand("update Dailyconsumption set dailymaterialcode='" + ddlmaterial.Text + "',dailycategory='" + ddlcategory.Text + "',dailymaterial='" + dailymaterial.Text + "',dailysize='" + dailysize.Text + "',dailysubcategory='" + dailysubcategory.Text + "',dailytotalquantity='" + dailyavailablestock.Text + "',dailyminimumquantity='" + dailyminimumquantity.Text + "',dailydate='" + dailyolddate.Text + "',dailyemployeename='" + dailycustomername.Text + "',dailyreqquantity='" + dailyrequiredquantity.Text + "',dailypurpose='" + dailypurpose.Text + "',Upadtedate='" + dailydate.Text + "',Work='" + dailyworkorder.Text + "',DailyusageId='" + dailyusageid.Text + "' where dailyid='" + Userid + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            gvbind();
        }

        protected void Gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Gridview1.EditIndex = e.NewEditIndex;
            gvbind();
        }

        protected void Gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            SqlConnection con = new SqlConnection(constr);
            GridViewRow row = (GridViewRow)Gridview1.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM Dailyconsumption where id='" + Convert.ToInt32(Gridview1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
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