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
    public partial class WebForm25 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                autoid();
                txtDATE.Text = DateTime.Now.Date.ToShortDateString();
                Bind();
                Clear();
                gvbind();
            }
        }

        private void gvbind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from ComplaintsRegister", con);
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

        private void Bind()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter("select customerid from ComplaintsRegister ", con);
            sda.Fill(ds);
            txtddcustomerid.DataSource = ds;
            txtddcustomerid.DataTextField = "CustomerId";
            txtddcustomerid.DataValueField = "CustomerId";
            txtddcustomerid.DataBind();
            txtddcustomerid.Items.Insert(0, new ListItem("selectitem"));
        }

        private void autoid()
        {
            string code = "SP-H-";
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(id) from ComplaintsRegister", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtcomplaintid.Text = code + i.ToString();
        }
        private void Clear()
        {
            txtcompanydetails.Text = "";
            txtddlstatus.SelectedIndex = 0;
            txtddtype.SelectedIndex = 0;
            txtactiontaken.Text = "";
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into ComplaintsRegister(ComplaintId,Date,CustomerId,CompanyName,CompanyDetails,Type,ActionTakenOn,Status) values('" + txtcomplaintid.Text.Trim() + "','" + txtDATE.Text.Trim() + "','" + txtddcustomerid.SelectedItem.ToString() + "','" + txtcompanyname.Text.Trim() + "','" + txtcompanydetails.Text.Trim() + "','" + txtddtype.SelectedItem.ToString() + "','" + txtactiontaken.Text.Trim() + "','" + txtddlstatus.SelectedItem.ToString() + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
            gvbind();
        }

        protected void txtddcustomerid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from ComplaintsRegister", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                txtcompanyname.Text = sdr["CompanyName"].ToString();

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
            string FileName = "ComplaintsRegister" + DateTime.Now + ".xls";
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