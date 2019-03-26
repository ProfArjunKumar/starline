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
    public partial class WebForm7 : System.Web.UI.Page
    {
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PlywoodAutoGenerateCode();
                txtcategory.Text = "Plywood";
            }
        }

        private void PlywoodAutoGenerateCode()
        {
            string code = "SP-Ply-";
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);            
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(pmaterialcode) from mplywood", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtmaterialcode.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            cls.Insertdata(txtmaterialcode.Text, txtcategory.Text, ddlsubcategory.SelectedItem.Text, txtmaterial.Text, txtlength.Text, txtUOM.Text, txtheight.Text, txtuom1.Text, txtwidth.Text, txtuomh.Text, txtspecification.Text, txtSIZE.Text, txtminimumquantity.Text, txttotalquantity.Text, txtsqft.Text, txtsqmt.Text);
            cls.plywoodmaterial(txtmaterial.Text);
            this.BindGrid();
            PlywoodAutoGenerateCode();
            reset();
        }

        private void reset()
        {
            txtlength.Text = string.Empty;
            txtwidth.Text = string.Empty;
            txtspecification.Text = string.Empty;
            txtminimumquantity.Text = string.Empty;
            txtmaterial.Text = string.Empty;
            txtheight.Text = string.Empty;
            txtUOM.Text = string.Empty;
            txtuom1.Text = string.Empty;
            txtuomh.Text = string.Empty;
            txtSIZE.Text = string.Empty;
            txttotalquantity.Text = string.Empty;
            ddlsubcategory.ClearSelection();
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT pid, pmaterialcode,pcategory,psubcategory,pmaterial,pspecifications,psize,pminimum,ptotalqty,CFT,CUM FROM mplywood"))
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

        protected void txttotalquantity_TextChanged(object sender, EventArgs e)
        {
            txtsqft.Text = Calculatecft().ToString();
            txtsqmt.Text = Calculatecum().ToString();
        }

        private object Calculatecum()
        {
            double calcum = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(txtlength.Text);
                double width = Convert.ToDouble(txtwidth.Text);
                double height = Convert.ToDouble(txtheight.Text);
                double totalqty = Convert.ToDouble(txttotalquantity.Text);
                if (ddlsubcategory.Text == "Metric")
                {
                    calcum = (length * width * totalqty) / (1000000);                    
                    double d = calcum;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
                if (ddlsubcategory.Text == "Imperial")
                {
                    calcum = (length * width * totalqty) * (0.09290304);
                    double d = calcum;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return r;
        }
        private object Calculatecft()
        {
            double calcft = 0;
            double r = 0;
            try
            {
                double length = Convert.ToDouble(txtlength.Text);
                double width = Convert.ToDouble(txtwidth.Text);
                double height = Convert.ToDouble(txtheight.Text);
                double totalqty = Convert.ToDouble(txttotalquantity.Text);

                if (ddlsubcategory.Text == "Metric")
                {
                    calcft = (length * width * totalqty) / ((25.4 * 25.4) * (12 * 12));
                    double d = calcft;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
                if (ddlsubcategory.Text == "Imperial")
                {
                    calcft = (length * width * totalqty);
                    double d = calcft;
                    r = Convert.ToDouble(d.ToString("#.00"));
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return r;
        }

        protected void txtlength_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());
            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtSIZE.Text = str.ToString();
        }

        protected void txtwidth_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());
            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtSIZE.Text = str.ToString();
        }

        protected void txtheight_TextChanged(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();
            str.Append(txtlength.Text.ToString());
            if (!string.IsNullOrEmpty(txtwidth.Text))
            {
                str.Append(" * ");
                str.Append(txtwidth.Text.ToString());
                if (!string.IsNullOrEmpty(txtheight.Text))
                {
                    str.Append(" * ");
                    str.Append(txtheight.Text.ToString());
                }
            }
            txtSIZE.Text = str.ToString();
        }

        protected void ddlsubcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlsubcategory.SelectedItem.ToString() == "Metric")
            {
                txtUOM.Text = "MM";
                txtuomh.Text = "MM";
                txtuom1.Text = "MM";
            }
            else
            {
                txtUOM.Text = "Feet";
                txtuomh.Text = "Inch";
                txtuom1.Text = "Inch";
            }
        }
    }
}