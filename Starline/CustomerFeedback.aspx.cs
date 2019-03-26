using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Starline
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            txtreviewerdate.Text = DateTime.Now.Date.ToShortDateString();
            if (!IsPostBack)
            {
                
                Bind();
                gvbind();
            }
        }

        private void gvbind()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from CFeedBack", con);
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
            txtcontactname.Text = "";
            txtcustomerid.SelectedIndex = 0;
            txtdesignation.Text = "";
            txtreviewerdate.Text = "";
            txtreviewername.Text = "";
            txtcontactnumber.Text = "";
            ddlknowledge.SelectedIndex = 0;
            ddlidentification.SelectedIndex = 0;
            ddlconsistency.SelectedIndex = 0;
            ddlcomplaint.SelectedIndex = 0;
            ddlmeeting.SelectedIndex = 0;
            ddlreponse.SelectedIndex = 0;
            ddlresolution.SelectedIndex = 0;
            ddlresponse.SelectedIndex = 0;
            ddltechsupport.SelectedIndex = 0;
            ddlteamsupport.SelectedIndex = 0;
            ddltime.SelectedIndex = 0;
            ddltransporta.SelectedIndex = 0;
            ddlvalue.SelectedIndex = 0;


        }

        private void Bind()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter("select customerid from customerfeedback1 ", con);
            sda.Fill(ds);
            txtcustomerid.DataSource = ds;
            txtcustomerid.DataTextField = "customerid";
            txtcustomerid.DataValueField = "customerid";
            txtcustomerid.DataBind();
            txtcustomerid.Items.Insert(0, new ListItem("selectitem"));
        }

        protected void txtcustomerid_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Newcustomer1", con);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                txtcompanyname.Text = sdr["companyname"].ToString();
                txtcontactname.Text = sdr["contactname"].ToString();
                txtcontactnumber.Text = sdr["phonenumber"].ToString();
                txtdesignation.Text = sdr["designation"].ToString();

            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into CFeedBack(customerid,companyname,contactname,contactnumber,designation,reviewername,reviewerdate,meetingSpecification,consistencyQuality,identificationTraceability,teamSupport,timelyCompletion,transportArrangment,technicalSupport,responseUrgent,valueMoney,resolutionComplaints,responseSpecial,complaintResponse,knowledgeDesign)values('" + txtcustomerid.Text.Trim() + "','" + txtcompanyname.Text.Trim() + "','" + txtcontactname.Text.Trim() + "','" + txtcontactnumber.Text.Trim() + "','" + txtdesignation.Text.Trim() + "','" + txtreviewername.Text.Trim() + "','" + txtreviewerdate.Text.Trim() + "','" + ddlmeeting.SelectedItem.ToString() + "','" + ddlconsistency.SelectedItem.ToString() + "','" + ddlidentification.SelectedItem.ToString() + "','" + ddlteamsupport.SelectedItem.ToString() + "','" + ddltime.SelectedItem.ToString() + "','" + ddltransporta.SelectedItem.ToString() + "','" + ddltechsupport.SelectedItem.ToString() + "','" + ddlreponse.SelectedItem.ToString() + "','" + ddlvalue.SelectedItem.ToString() + "','" + ddlresolution.SelectedItem.ToString() + "','" + ddlresponse.SelectedItem.ToString() + "','" + ddlcomplaint.SelectedItem.ToString() + "','" + ddlknowledge.SelectedItem.ToString() + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Clear();
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
            string FileName = "CFeedBack" + DateTime.Now + ".xls";
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