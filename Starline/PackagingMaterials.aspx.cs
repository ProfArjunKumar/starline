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
    public partial class WebForm12 : System.Web.UI.Page
    {
        Class1 Paper = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PaperAutoGenerateCode();
                packagecategory.Text = "Packaging material";
                DataBind();
            }
        }

        private void PaperAutoGenerateCode()
        {
            string code = "SP-PM-";
            SqlConnection con = new SqlConnection(cs);
            //SqlConnection con = new SqlConnection("data source=DESKTOP-G8CIQLI\\SQLEXPRESS;Initial Catalog=starlinepackers;Integrated Security=true");
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(pacmaterialcode) from mpackingmaterial", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            pakagematerialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            string mCode = string.Empty;
            Paper.packingmaterial(pakagematerialcode.Text, packagescategory.Text, packagelength.Text, packageheight.Text, packagewidth.Text, packagespecification.Text, packageministck.Text, packagecategory.Text, packagmaterial.Text, ddluom.Text, packagesize.Text, packageavailable.Text);
            Paper.packingallmaterial(packagmaterial.Text);
            PaperAutoGenerateCode();
            GridView1.DataBind();
            reset();
        }
        private void reset()
        {
            packagelength.Text = string.Empty;
            packagewidth.Text = string.Empty;
            packagespecification.Text = string.Empty;
            packageministck.Text = string.Empty;
            packagmaterial.Text = string.Empty;
            packageheight.Text = string.Empty;
            ddluom.ClearSelection();
            packagesize.Text = string.Empty;
            packageavailable.Text = string.Empty;
            packagescategory.Text = string.Empty;
        }

        protected void packagelength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(packagelength.Text.ToString());
            if (!string.IsNullOrEmpty(packagewidth.Text))
            {
                str.Append(" * ");
                str.Append(packagewidth.Text.ToString());
                if (!string.IsNullOrEmpty(packageheight.Text))
                {
                    str.Append(" * ");
                    str.Append(packageheight.Text.ToString());
                }
            }
            packagesize.Text = str.ToString();
        }
        protected void packagewidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(packagelength.Text.ToString());
            if (!string.IsNullOrEmpty(packagewidth.Text))
            {
                str.Append(" * ");
                str.Append(packagewidth.Text.ToString());
                if (!string.IsNullOrEmpty(packageheight.Text))
                {
                    str.Append(" * ");
                    str.Append(packageheight.Text.ToString());
                }
            }
            packagesize.Text = str.ToString();
        }
        protected void packageheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(packagelength.Text.ToString());
            if (!string.IsNullOrEmpty(packagewidth.Text))
            {
                str.Append(" * ");
                str.Append(packagewidth.Text.ToString());
                if (!string.IsNullOrEmpty(packageheight.Text))
                {
                    str.Append(" * ");
                    str.Append(packageheight.Text.ToString());
                }
            }
            packagesize.Text = str.ToString();
        }
    }
}