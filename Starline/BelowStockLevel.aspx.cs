using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Starline
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd=new SqlCommand ("select * from ")
        }
    }
}