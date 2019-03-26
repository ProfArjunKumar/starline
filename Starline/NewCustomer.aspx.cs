using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Starline
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Autoid();
                txtdate.Text = DateTime.Now.Date.ToShortDateString();
            }
        }

        private void Autoid()
        {
            string code = "SP-H-";
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select count(id) from Newcustomer1", con);
            int i = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            i++;
            txtcustomeid.Text = code + i.ToString();
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Newcustomer1(customerid,date,companyname,contactname,phonenumber,designation,email,workinghours,address)values('"+txtcustomeid.Text.Trim()+"','"+txtdate.Text.Trim()+"','"+txtcompanyname.Text.Trim()+"','"+txtcontactename.Text.Trim()+"','"+txtphonenumber.Text.Trim()+"','"+txtdesignation.Text.Trim()+"','"+txtemail.Text.Trim()+"','"+txtworkinghours.Text.Trim()+"','"+txtaddress.Text.Trim()+"')",con);
            cmd.ExecuteNonQuery();
            con.Close();
            Autoid();
            Clear();
        }

        private void Clear()
        {
            txtcompanyname.Text = "";
            txtdesignation.Text = "";
            txtphonenumber.Text = "";
            txtcontactename.Text = "";
            txtemail.Text = "";
            txtworkinghours.Text = "";
            txtaddress.Text = "";
        }
    }
}