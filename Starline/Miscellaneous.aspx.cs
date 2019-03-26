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
    public partial class WebForm11 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                miscellAutogenerateCode();
                miscategory.Text = "Miscellaneous";

            }
        }

        private void miscellAutogenerateCode()
        {
            string code = "SP-MIS-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(materialid) from miscelltab", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            mismaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("insert into miscelltab (category,subc,material,length,width,height,size,umo,availables,minlevel) values ('" + miscategory.Text + "','" + missubcategory.Text + "','" + mismaterial.Text + "','" + mislength.Text + "','" + miswidth.Text + "','" + misheight.Text + "','" + missize.Text + "','" + muom.Text + "','" + misavailablestock.Text + "','" + misminqtylevel.Text + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();            
            con.Close();
            miscellAutogenerateCode();
            GridView1.DataBind();
            reset();
        }

        private void reset()
        {            
            miscategory.Text = string.Empty;
            missubcategory.Text = string.Empty;
            mismaterial.Text = string.Empty;
            mislength.Text = string.Empty;
            miswidth.Text = string.Empty;
            misheight.Text = string.Empty;
            missize.Text = string.Empty;
            muom.Text = string.Empty;
            misavailablestock.Text = string.Empty;
            misminqtylevel.Text = string.Empty;
        }

        protected void mislength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(mislength.Text.ToString());
            if (!string.IsNullOrEmpty(miswidth.Text))
            {
                str.Append(" * ");
                str.Append(miswidth.Text.ToString());
                if (!string.IsNullOrEmpty(misheight.Text))
                {
                    str.Append(" * ");
                    str.Append(misheight.Text.ToString());
                }
            }
            missize.Text = str.ToString();
        }

        protected void miswidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(mislength.Text.ToString());
            if (!string.IsNullOrEmpty(miswidth.Text))
            {
                str.Append(" * ");
                str.Append(miswidth.Text.ToString());
                if (!string.IsNullOrEmpty(misheight.Text))
                {
                    str.Append(" * ");
                    str.Append(misheight.Text.ToString());
                }
            }
            missize.Text = str.ToString();
        }

        protected void misheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(mislength.Text.ToString());
            if (!string.IsNullOrEmpty(miswidth.Text))
            {
                str.Append(" * ");
                str.Append(miswidth.Text.ToString());
                if (!string.IsNullOrEmpty(misheight.Text))
                {
                    str.Append(" * ");
                    str.Append(misheight.Text.ToString());
                }
            }
            missize.Text = str.ToString();
        }
    }
}