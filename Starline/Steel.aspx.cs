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
using iTextSharp.text.html.simpleparser;
using System.Text;

namespace Starline
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        Class1 steelp = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SteelAutoGenerateCode();
                steelcategory.Text = "Steel";
            }
        }

        private void SteelAutoGenerateCode()
        {
            string code = "SP-S-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(stmaterialcode) from msteel", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            steelmaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            string mCode = string.Empty;
            steelp.steel(steelmaterialcode.Text, steelsubcategory.Text, steellength.Text, steelwidth.Text, steelspecification.Text, steelminiomumqtylevel.Text, steelcategory.Text, steelmaterial.Text, steelheight.Text, steeluom.Text, steelsize.Text, steelavailablestock.Text);
            steelp.steelallmaterial(steelmaterial.Text);
            GridView1.DataBind();
            Reset();
            SteelAutoGenerateCode();
        }

        private void Reset()
        {
            steellength.Text = string.Empty;
            steelwidth.Text = string.Empty;
            steelspecification.Text = string.Empty;
            steelminiomumqtylevel.Text = string.Empty;
            steelcategory.Text = string.Empty;
            steelmaterial.Text = string.Empty;
            steelheight.Text = string.Empty;
            steeluom.Text = string.Empty;
            steelsize.Text = string.Empty;
            steelavailablestock.Text = string.Empty;
            steelsubcategory.Text = string.Empty;
        }

        protected void steelheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(steellength.Text.ToString());
            if (!string.IsNullOrEmpty(steelwidth.Text))
            {
                str.Append(" * ");
                str.Append(steelwidth.Text.ToString());
                if (!string.IsNullOrEmpty(steelheight.Text))
                {
                    str.Append(" * ");
                    str.Append(steelheight.Text.ToString());
                }
            }
            steelsize.Text = str.ToString();
        }

        protected void steellength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(steellength.Text.ToString());
            if (!string.IsNullOrEmpty(steelwidth.Text))
            {
                str.Append(" * ");
                str.Append(steelwidth.Text.ToString());
                if (!string.IsNullOrEmpty(steelheight.Text))
                {
                    str.Append(" * ");
                    str.Append(steelheight.Text.ToString());
                }
            }
            steelsize.Text = str.ToString();
        }

        protected void steelwidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();

            str.Append(steellength.Text.ToString());
            if (!string.IsNullOrEmpty(steelwidth.Text))
            {
                str.Append(" * ");
                str.Append(steelwidth.Text.ToString());
                if (!string.IsNullOrEmpty(steelheight.Text))
                {
                    str.Append(" * ");
                    str.Append(steelheight.Text.ToString());
                }
            }
            steelsize.Text = str.ToString();
        }
    }
}