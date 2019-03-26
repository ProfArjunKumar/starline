using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using BLL;
using System.IO;

namespace Starline
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                txtdate.Text = DateTime.Now.Date.ToShortDateString();
                BindCategories();
                int recentEnquiryId = GetRecentEnquiryId();
                txtid.Text = Convert.ToString(recentEnquiryId);
                
            }
        }        

        private static DataTable GetData(string query)
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
       
        private int GetRecentEnquiryId()
        {
            string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand("select isnull(MAX(EnquiryId),0) EnquiryId from enquirymul", con);
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
            DailyConsumption daily = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = daily.GetCategories();
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "categoryname";
            ddlcategory.DataValueField = "categoryid";
            ddlcategory.DataBind();
            ddlcategory.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", "-1"));
            ddlmaterialcode.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoryname = ddlcategory.SelectedItem.ToString();
            DailyConsumption dc = new DailyConsumption();
            DataTable dt = new DataTable();
            dt = dc.Getmaterialcode(categoryname);
            ddlmaterialcode.DataSource = dt;
            ddlmaterialcode.DataTextField = "Code";
            ddlmaterialcode.DataValueField = "ID";
            ddlmaterialcode.DataBind();
            ddlmaterialcode.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--select--", "-1"));
        }

        protected void btnadd_Click(object sender, EventArgs e)
        {
            CreateNewRow();
            this.GridView1.Visible = false;
           this.Button1.Visible = false;
            ddlcategory.SelectedIndex = 0;
            ddlmaterialcode.SelectedIndex = 0;
            txtrequiredquantity.Text = "";
            txtrequireddate.Text = "";
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
                        dr["enqid"] = txtid.Text;
                        dr["Category"] = ddlcategory.SelectedItem.Text;
                        dr["materialcode"] = ddlmaterialcode.SelectedItem.Text;
                        dr["RequiredQuantity"] = txtrequiredquantity.Text;
                        dr["RequiredDate"] = txtrequireddate.Text;
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
                    datatbl.Columns.Add("Category", typeof(string));
                    datatbl.Columns.Add("materialcode", typeof(string));
                    datatbl.Columns.Add("RequiredQuantity", typeof(string));
                    datatbl.Columns.Add("RequiredDate", typeof(DateTime));

                    DataRow dr1 = datatbl.NewRow();
                    dr1 = datatbl.NewRow();
                    dr1["enqid"] = txtid.Text;
                    dr1["Category"] = ddlcategory.SelectedItem.Text;
                    dr1["materialcode"] = ddlmaterialcode.SelectedItem.Text;
                    dr1["RequiredQuantity"] = txtrequiredquantity.Text;
                    dr1["RequiredDate"] = txtrequireddate.Text;
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
            string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
            SqlConnection con = new SqlConnection(strCon);

            int tenqid = int.Parse(this.txtid.Text);
            string tdate = this.txtdate.Text;
            string tEmployeeName = this.txtemployeename.Text;

            SqlCommand cmd = new SqlCommand("Usp_InsertEnquiry", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@EnquiryId", tenqid);
            cmd.Parameters.AddWithValue("@CreatedDate", tdate);
            cmd.Parameters.AddWithValue("@EmpName", tEmployeeName);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            DataTable dt = (DataTable)ViewState["Row"];
            string Category, materialcode, RequiredQuantity;
            DateTime RequiredDate;
            int enqid;

            foreach (DataRow row in dt.Rows)
            {
                enqid = int.Parse(row["enqid"].ToString());
                Category = row["Category"].ToString();
                materialcode = row["materialcode"].ToString();
                RequiredQuantity = row["RequiredQuantity"].ToString();
                RequiredDate = Convert.ToDateTime(row["RequiredDate"].ToString());
                this.InsertRows(enqid, materialcode, RequiredQuantity, RequiredDate, Category);
            }
            gvradd.Visible = false;
             GridView1.DataBind();
            this.GridView1.Visible = true;
            this.Button1.Visible = true;
            this.btnsubmit.Visible = false;
            int recentEnquiryId = GetRecentEnquiryId();
            txtid.Text = Convert.ToString(recentEnquiryId);
        }

        private void InsertRows(int enqid, string materialcode, string requiredQuantity, DateTime requiredDate, string category)
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("insert into EnquiryList (EnquiryId,MaterialName,Weight,RequiredDate,Category) values('" + enqid.ToString() + "','" + materialcode.ToString() + "','" + requiredQuantity.ToString() + "','" + requiredDate.ToString() + "','" + category.ToString() + "')", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
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
            string FileName = "PurchaseIndent" + DateTime.Now + ".xls";
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