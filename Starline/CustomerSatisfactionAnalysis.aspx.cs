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
    public partial class WebForm17 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtreviewdate.Text = DateTime.Now.Date.ToShortDateString();
            if (!IsPostBack)
            {
                Bind();
                gvbind();
            }
        }

        private void gvbind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from customeranalysis1", con);
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

        private void Clear()
        {
            txtcompanyname.Text = "";
            txtcustomername.Text = "";
            txtddcustomerid.SelectedIndex = 0;
            txtdesignation.Text = "";
            txtreviewname.Text = "";
            ddldelivery.SelectedIndex = 0;
            ddlimprovement.SelectedIndex = 0;
            ddlprice.SelectedIndex = 0;
            ddlservice.SelectedIndex = 0;
            ddlquality.SelectedIndex = 0;
        }

        private void Bind()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter("select customerid from Newcustomer1 ", con);
            sda.Fill(ds);
            txtddcustomerid.DataSource = ds;
            txtddcustomerid.DataTextField = "customerid";
            txtddcustomerid.DataValueField = "customerid";
            txtddcustomerid.DataBind();
            txtddcustomerid.Items.Insert(0, new ListItem("selectitem"));
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into customeranalysis1(customerid,customername,companyname,designation,reviewname,reviewdate,quality,delivery,price,service,improment)values('" + txtddcustomerid.SelectedItem.ToString() + "','" + txtcustomername.Text.Trim() + "','" + txtcompanyname.Text.Trim() + "','" + txtdesignation.Text.Trim() + "','" + txtreviewname.Text.Trim() + "','" + txtreviewdate.Text.Trim() + "','" + ddlquality.SelectedItem.ToString() + "','" + ddldelivery.SelectedItem.ToString() + "','" + ddlprice.SelectedItem.ToString() + "','" + ddlservice.SelectedItem.ToString() + "','" + ddlimprovement.SelectedItem.ToString() + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            gvbind();
        }

        protected void txtddcustomerid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Newcustomer1", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                txtcompanyname.Text = sdr["companyName"].ToString();
                txtcustomername.Text = sdr["contactname"].ToString();
                txtdesignation.Text = sdr["designation"].ToString();
            }
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
            string FileName = "Customer Analysis" + DateTime.Now + ".xls";
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