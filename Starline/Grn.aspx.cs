using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BLL;
using System.IO;

namespace Starline
{
    public partial class WebForm22 : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindcategory();
                int recentEnquiryId = GetRecentEnquiryId();
                txtgrnid.Text = Convert.ToString(recentEnquiryId);
                txtdate.Text = DateTime.Now.Date.ToShortDateString();
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from grn", con);
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
        private void bindcategory()
        {
            DailyConsumption daily = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = daily.GetCategories();
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "categoryname";
            ddlcategory.DataValueField = "categoryid";
            ddlcategory.DataBind();
            ddlcategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "-1"));
            ddlpurchaseorderid.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "-1"));
            ddlmaterialname.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        private int GetRecentEnquiryId()
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select isnull(max(id),0) id from grn", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return reader.GetInt32(0) + 1;
            }
            con.Close();
            return 0;
        }
        private void RemoveDuplicateItems(DropDownList ddlpurchaseorderid)
        {
            for (int i = 0; i < ddlpurchaseorderid.Items.Count; i++)
            {
                ddlpurchaseorderid.SelectedIndex = i;
                string str = ddlpurchaseorderid.SelectedItem.ToString();
                for (int counter = i + 1; counter < ddlpurchaseorderid.Items.Count; counter++)
                {
                    ddlpurchaseorderid.SelectedIndex = counter;
                    string compareStr = ddlpurchaseorderid.SelectedItem.ToString();
                    if (str == compareStr)
                    {
                        ddlpurchaseorderid.Items.RemoveAt(counter);
                        counter = counter - 1;
                    }
                }
            }
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter("select Order_ID from purchaseorderfinal where Category='" + ddlcategory.SelectedItem.Text + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlpurchaseorderid.DataSource = ds;
            ddlpurchaseorderid.DataTextField = "Order_ID";
            ddlpurchaseorderid.DataValueField = "Order_ID";
            ddlpurchaseorderid.DataBind();
            ddlpurchaseorderid.Items.Insert(0, new ListItem("Please select Order Id"));
            RemoveDuplicateItems(ddlpurchaseorderid);
        }

        protected void ddlpurchaseorderid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select Supplier_name from purchaseorderfinal where Order_ID='" + ddlpurchaseorderid.SelectedItem.ToString() + "' ", con);
            con.Open();
            SqlDataReader myreader = cmd.ExecuteReader();
            while (myreader.Read())
            {
                txtsuppliername.Text = (myreader["Supplier_name"].ToString());
            }
            con.Close();
            SqlDataAdapter da = new SqlDataAdapter("select Material_name from purchaseorderfinal where Order_ID='" + ddlpurchaseorderid.SelectedItem.ToString() + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlmaterialname.DataSource = ds;
            ddlmaterialname.DataTextField = "Material_name";
            ddlmaterialname.DataValueField = "Material_name";
            ddlmaterialname.DataBind();
            ddlmaterialname.Items.Insert(0, new ListItem("Please select Material Name"));
        }

        protected void ddlmaterialname_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select Quantity from purchaseorderfinal where Material_name='" + ddlmaterialname.SelectedItem.ToString() + "' ", con);
            con.Open();
            SqlDataReader myreader = cmd.ExecuteReader();
            while (myreader.Read())
            {
                txtquantity.Text = (myreader["Quantity"].ToString());
            }
            con.Close();

            Class1 dailycon = new Class1();
            DailyConsumption dc = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = dc.Getmaterialdetails(ddlmaterialname.SelectedItem.ToString().Split('(')[0].Trim(), ddlcategory.SelectedItem.ToString());
            string value = ddlcategory.SelectedItem.ToString();
            if (dt.Rows.Count > 0)
            {
                switch (value)
                {
                    case "Hardware":
                        txtmaterialname.Text = dt.Rows[0]["hmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["htotalqty"].ToString();
                        break;
                    case "wood":
                        txtmaterialname.Text = dt.Rows[0]["mmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["mtotalqty"].ToString();
                        break;
                    case "plywood":
                        txtmaterialname.Text = dt.Rows[0]["pmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["ptotalqty"].ToString();
                        break;
                    case "polythene":
                        txtmaterialname.Text = dt.Rows[0]["pomaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["pototalqty"].ToString();
                        break;
                    case "Paper Packing":
                        txtmaterialname.Text = dt.Rows[0]["pamaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["patotalqty"].ToString();
                        break;
                    case "Packaging material":
                        txtmaterialname.Text = dt.Rows[0]["pacmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["pactotalqty"].ToString();
                        break;
                    case "Steel":
                        txtmaterialname.Text = dt.Rows[0]["stmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["sttotalqty"].ToString();
                        break;
                    case "Tools":
                        txtmaterialname.Text = dt.Rows[0]["tmaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["ttotalqty"].ToString();
                        break;
                    case "Miscellaneous":
                        txtmaterialname.Text = dt.Rows[0]["mismaterial"].ToString();
                        txtavailablestock.Text = dt.Rows[0]["mistotalqty"].ToString();
                        break;
                    default:
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Material code not exists')", true);
                        break;
                }
            }
        }

        protected void txtaccept_TextChanged(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(txtquantity.Text);
            int j = Convert.ToInt32(txtaccept.Text);
            int a = i - j;
            txtdamaged.Text = a.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Class1 dailycon = new Class1();
            if (txtmaterialname.Text != "" && txtaccept.Text != "")
            {
                DailyConsumption dc = new DailyConsumption();
                DataTable dt = new DataTable();
                string value = (Convert.ToDecimal(txtavailablestock.Text) + Convert.ToDecimal(txtaccept.Text)).ToString();
                string choice = ddlcategory.SelectedItem.ToString();

                switch (choice)
                {
                    case "Hardware":
                        string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mhardware set htotalqty='" + data + "' where hmaterial='" + txtmaterialname.Text + "'", con))
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
                            using (SqlCommand cmd = new SqlCommand("update mwood set mtotalqty ='" + data + "' where mmaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "plywood":
                        string constr2 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mplywood set ptotalqty ='" + data + "' where pmaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "polythene":
                        string constr3 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr3))
                        {
                            decimal data = decimal.Parse(value);

                            using (SqlCommand cmd = new SqlCommand("update mpolythene set pototalqty ='" + data + "' where pomaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "Paper Packing":
                        string constr4 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr4))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpaperpacking set patotalqty ='" + data + "' where pamaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "Packaging material":
                        string constr5 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr5))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpackingmaterial set pactotalqty ='" + data + "' where pacmaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "Steel":
                        string constr6 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr6))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update msteel set sttotalqty ='" + data + "' where stmaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "Tools":
                        string constr7 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr7))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mtools set ttotalqty ='" + data + "' where tmaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    case "Miscellaneous":
                        string constr8 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr8))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mmiscellaneous set mistotalqty ='" + data + "' where mismaterial='" + txtmaterialname.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();                               
                                con.Close();
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Please Enter The Required Fields')", true);
            }
            SqlConnection con2 = new SqlConnection(strCon);
            SqlCommand cmd2 = new SqlCommand("insert into grn (Date,Approved,Reject,Category,PurchaseOrder,MaterialCode,Quantity) values('" + txtdate.Text + "','"+ txtaccept.Text+"','"+txtdamaged.Text+"','"+ddlcategory.SelectedItem.ToString()+"','"+ddlpurchaseorderid.SelectedItem.ToString()+"','"+ ddlmaterialname.SelectedItem.ToString() +"','"+txtquantity.Text+"')", con2);
            con2.Open();
            cmd2.ExecuteNonQuery();
            con2.Close();
            SqlConnection con1 = new SqlConnection(strCon);
            SqlCommand cmd1 = new SqlCommand("insert into Damage values('" + txtgrnid.Text + "','" + txtdate.Text + "','" + ddlpurchaseorderid.SelectedItem.ToString() + "','" + txtsuppliername.Text + "','" + ddlmaterialname.SelectedItem.ToString() + "','" + txtquantity.Text + "','" + txtaccept.Text + "','" + txtdamaged.Text + "')", con1);
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();
            int recentEnquiryId = GetRecentEnquiryId();
            txtgrnid.Text = Convert.ToString(recentEnquiryId);
            ddlcategory.SelectedIndex = 0;
            ddlpurchaseorderid.SelectedIndex = 0;
            ddlmaterialname.SelectedIndex = 0;
            txtmaterialname.Text = "";
            txtquantity.Text = "";
            txtaccept.Text = "";
            txtdamaged.Text = "";
            gvbind();
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
            string FileName = "GRN" +( DateTime.Now.Date.ToShortDateString()) + ".xls";
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