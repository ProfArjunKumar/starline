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
using System.Text;
using iTextSharp.text.html.simpleparser;

namespace Starline
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        Class1 tool = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ToolAutoGenerateCode();
                toolscategory.Text = "Tools";
            }
        }

        private void ToolAutoGenerateCode()
        {
            string code = "SP-T-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(tmaterialcode) from mtools", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            toolsmaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            tool.tools(toolsmaterialcode.Text, toolssubcategory.Text, toolslength.Text, toolswidth.Text, toolsspecification.Text, toolsminiomumqtylevel.Text, toolscategory.Text, toolsmaterial.Text, toolsheight.Text, toolsuom.Text, toolssize.Text, toolsavailablestock.Text);
            tool.toolallmaterial(toolsmaterial.Text);
            this.BindGrid();
            ToolAutoGenerateCode();
            reset();
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersconnectionstring"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM mtools "))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSourceID = null;
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        private void reset()
        {
            toolslength.Text = string.Empty;
            toolswidth.Text = string.Empty;
            toolsspecification.Text = string.Empty;
            toolsminiomumqtylevel.Text = string.Empty;
            toolscategory.Text = string.Empty;
            toolsmaterial.Text = string.Empty;
            toolsheight.Text = string.Empty;
            toolsuom.ClearSelection();
            toolssize.Text = string.Empty;
            toolsavailablestock.Text = string.Empty;
            toolssubcategory.Text = string.Empty;
        }

        protected void toolslength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(toolslength.Text.ToString());

            if (!string.IsNullOrEmpty(toolswidth.Text))
            {
                str.Append(" * ");
                str.Append(toolswidth.Text.ToString());
                if (!string.IsNullOrEmpty(toolsheight.Text))
                {
                    str.Append(" * ");
                    str.Append(toolsheight.Text.ToString());
                }
            }
            toolssize.Text = str.ToString();
        }
        protected void toolswidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(toolslength.Text.ToString());

            if (!string.IsNullOrEmpty(toolswidth.Text))
            {
                str.Append(" * ");
                str.Append(toolswidth.Text.ToString());
                if (!string.IsNullOrEmpty(toolsheight.Text))
                {
                    str.Append(" * ");
                    str.Append(toolsheight.Text.ToString());
                }
            }
            toolssize.Text = str.ToString();
        }
        protected void toolsheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(toolslength.Text.ToString());

            if (!string.IsNullOrEmpty(toolswidth.Text))
            {
                str.Append(" * ");
                str.Append(toolswidth.Text.ToString());
                if (!string.IsNullOrEmpty(toolsheight.Text))
                {
                    str.Append(" * ");
                    str.Append(toolsheight.Text.ToString());
                }
            }
            toolssize.Text = str.ToString();
        }
    }
}