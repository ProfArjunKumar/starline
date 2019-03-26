using BLL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Starline
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtdate.Text = DateTime.Now.ToShortDateString();
                bindcategory();
                BindCategories();
                int recentEnquiryId = GetRecentEnquiryId();
                txtorderid.Text = Convert.ToString(recentEnquiryId);
                txtdate.Text = DateTime.Now.Date.ToShortDateString();
                gvbind();
            }
        }

        private void gvbind()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select Order_ID,Date,Supplier_name,Material_name,Quantity,Total from purchaseorderfinal", con);
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
            ddlmaterialname.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        private DataSet GetData(string query)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString());
            SqlDataAdapter da = new SqlDataAdapter("select MaterialName from EnquiryList where Category='"+ ddlcategory.SelectedItem.Text +"'", con1);
            DataSet ds = new DataSet();
            {
                da.Fill(ds);
                return ds;
            }
        }        
        private int GetRecentEnquiryId()
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select isnull(MAX(Order_ID),0) Order_ID from purchaseorderfinal", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return reader.GetInt32(0) + 1;
            }
            con.Close();
            return 0;
        }

        private void BindCategories()
        {
            SqlConnection con = new SqlConnection(strCon);
            SqlDataAdapter da = new SqlDataAdapter("select supliername from vendor", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlsuppliername.DataSource = ds;
            ddlsuppliername.DataValueField = "supliername";
            ddlsuppliername.DataTextField = "supliername";
            ddlsuppliername.DataBind();
            ddlsuppliername.Items.Insert(0, new ListItem("Please select"));
        }
        protected void ddlsuppliername_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                SqlCommand cmd = new SqlCommand("select tax,hsncode from vendor where supliername='" + ddlsuppliername.SelectedItem.ToString() + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txttax.Text = dr["tax"].ToString();
                    txthsncode.Text = dr["hsncode"].ToString();
                }
                con.Close();
            }
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlmaterialname.DataSource = GetData("select MaterialName from EnquiryList");
            ddlmaterialname.DataTextField = "MaterialName";
            ddlmaterialname.DataValueField = "MaterialName";
            ddlmaterialname.DataBind();
            ddlmaterialname.Items.Insert(0, new ListItem("Please select"));
        }

        protected void txtprice_TextChanged(object sender, EventArgs e)
        {
            int i = Convert.ToInt32(txtRequiredquantity.Text);
            int j = Convert.ToInt32(txtprice.Text);
            int a = i * j;
            int k = Convert.ToInt32(txttax.Text);
            txttotal.Text = (((a * k) / 100) + a).ToString();
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            CreateNewRow();
            getclear();
            Gridview1.Visible = false;
            Button1.Visible = false;
        }

        private void getclear()
        {            
            ddlmaterialname.SelectedIndex = 0;
            txtRequiredquantity.Text = "";
            txtprice.Text = "";
            txttotal.Text = "";
        }

        private void CreateNewRow()
        {
            try
            {
                DataTable datatbl = new DataTable();
                if (ViewState["Row"] != null)
                {
                    datatbl = (DataTable)ViewState["Row"];                    
                    DataRow dr = datatbl.NewRow();
                    if (datatbl.Rows.Count > 0)
                    {
                        dr["enqid"] = txtorderid.Text;
                        dr["Date"] = txtdate.Text;                        
                        dr["supliername"] = ddlsuppliername.SelectedItem.Text;
                        dr["tax"] = txttax.Text;
                        dr["price"] = txtprice.Text;
                        dr["materialname"] = ddlmaterialname.SelectedItem.Text;
                        dr["RequiredQuantity"] = txtRequiredquantity.Text;                        
                        dr["total"] = txttotal.Text;
                        dr["Category"] = ddlcategory.SelectedItem.Text;
                        datatbl.Rows.Add(dr);
                        ViewState["Row"] = datatbl;
                        ViewState["CurrentTable"] = datatbl;
                        gvradd.DataSource = ViewState["Row"];
                        gvradd.DataBind();
                        this.btnsubmit.Visible = true;
                    }
                }
                else
                {
                    datatbl.Columns.Add("enqid", typeof(int));
                    datatbl.Columns.Add("Date", typeof(DateTime));                    
                    datatbl.Columns.Add("supliername", typeof(string));
                    datatbl.Columns.Add("tax", typeof(string));
                    datatbl.Columns.Add("price", typeof(string));
                    datatbl.Columns.Add("materialname", typeof(string));
                    datatbl.Columns.Add("RequiredQuantity", typeof(string));                    
                    datatbl.Columns.Add("total", typeof(string));
                    datatbl.Columns.Add("Category", typeof(string));
                    DataRow dr1 = datatbl.NewRow();
                    dr1 = datatbl.NewRow();
                    dr1["enqid"] = txtorderid.Text;
                    dr1["Date"] = txtdate.Text;                    
                    dr1["supliername"] = ddlsuppliername.Text;
                    dr1["tax"] = txttax.Text;
                    dr1["price"] = txtprice.Text;
                    dr1["materialname"] = ddlmaterialname.SelectedItem.Text;
                    dr1["RequiredQuantity"] = txtRequiredquantity.Text;                    
                    dr1["total"] = txttotal.Text;
                    dr1["Category"] = ddlcategory.SelectedItem.Text;
                    datatbl.Rows.Add(dr1);
                    ViewState["Row"] = datatbl;
                    ViewState["CurrentTable"] = datatbl;
                    gvradd.DataSource = ViewState["Row"];
                    gvradd.DataBind();
                    this.btnsubmit.Visible = true;
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Row"];
            string Date, supliername, total, materialname, RequiredQuantity, Category;
            int enqid;
            foreach (DataRow row in dt.Rows)
            {
                enqid = int.Parse(row["enqid"].ToString());
                Date = row["Date"].ToString();
                supliername = row["supliername"].ToString();
                materialname = row["materialname"].ToString();
                RequiredQuantity = row["RequiredQuantity"].ToString();
                total = row["total"].ToString();
                Category = row["Category"].ToString();

                this.InsertRows(enqid, Date, supliername, materialname, RequiredQuantity, total,Category);
            }
            gvbind();
            Gridview1.Visible = true;
            int recentEnquiryId = GetRecentEnquiryId();
            txtorderid.Text = Convert.ToString(recentEnquiryId);
            this.btnsubmit.Visible = false;
            this.Button1.Visible = true;
        }

        private void InsertRows(int enqid, string date, string supliername, string materialname, string requiredQuantity, string total, string category)
        {
            string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("insert into purchaseorderfinal values('" + enqid.ToString() + "','" + date.ToString() + "','" + supliername.ToString() + "','" + materialname.ToString() + "','" + requiredQuantity.ToString() + "','" + total.ToString() + "','" + category.ToString() + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter da = new SqlDataAdapter("select Order_ID,Date,Supplier_name,Material_name,Quantity,Total from purchaseorderfinal", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Gridview1.DataSource = ds;
            Gridview1.DataBind();
            gvradd.Visible = false;
        }

        protected void gvradd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Row"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Row"] = dt;
            gvradd.DataSource = dt;
            gvradd.DataBind();
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
            string FileName = "purchaseorder" + DateTime.Now + ".xls";
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