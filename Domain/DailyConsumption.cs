using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Configuration;


namespace Domain
{
    public class DailyConsumption
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        public void insertdata(string _dailymaterialcode, string _dailycategory, string _dailymaterial, string _dailysize, string _dailysubcategory, string _dailytotalquantity, string _dailyminimumquantity, string _dailydate, string _dailyemployeename, string _dailyreqquantity, string _dailypurpose, string _updatedate, string _Work, string _DailyusageId)
        {

            SqlCommand cmd = new SqlCommand("DailUpdateValues", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@materialcode", _dailymaterialcode);
            cmd.Parameters.AddWithValue("@category", _dailycategory);
            cmd.Parameters.AddWithValue("@categoryname", _dailycategory);
            cmd.Parameters.AddWithValue("@material", _dailymaterial);
            cmd.Parameters.AddWithValue("@size", _dailysize);
            cmd.Parameters.AddWithValue("@subcategory", _dailysubcategory);
            cmd.Parameters.AddWithValue("@totalquantity", _dailytotalquantity);
            cmd.Parameters.AddWithValue("@minimumquantity", _dailyminimumquantity);
            cmd.Parameters.AddWithValue("@date", _dailydate);
            cmd.Parameters.AddWithValue("@employeename", _dailyemployeename);
            cmd.Parameters.AddWithValue("@total", _dailyreqquantity);
            cmd.Parameters.AddWithValue("@purpose", _dailypurpose);
            cmd.Parameters.AddWithValue("@stock", _dailytotalquantity);
            cmd.Parameters.AddWithValue("@updatedate", _updatedate);
            cmd.Parameters.AddWithValue("@Work", _Work);
            cmd.Parameters.AddWithValue("@DailyusageId", _DailyusageId);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void dailydeleteddl(string _dailyid, string _dailymaterialcode, string _dailycategory, string _dailymaterial, string _dailysize, string _dailysubcategory, string _dailytotalquantity, string _dailyminimumquantity, string _dailydate, string _dailyemployeename, string _dailyreqquantity, string _dailypurpose, string _Upadtedate, string _Work)
        {
            SqlDataAdapter da = new SqlDataAdapter("delete  from Dailyconsumption where dailyid='" + _dailyid + "'", con);
            DataTable dt = new DataTable();
            //SqlDataAdapter da = new SqlDataAdapter("update  Dailyconsumption set dailymaterialcode='" + _dailymaterialcode + "',dailycategory='" + _dailycategory + "',dailymaterial='" + _dailymaterial + "',dailysize='" + _dailysize + "',dailysubcategory='" + _dailysubcategory + "',dailytotalquantity='" + _dailytotalquantity + "',dailyminimumquantity='" + _dailyminimumquantity + "',dailydate='" + _dailydate + "',dailyemployeename='" + _dailyemployeename + "',dailyreqquantity='" + _dailyreqquantity + "',dailypurpose='" + _dailypurpose + "',Upadtedate='" + _Upadtedate + "',work='" + _work + "' where dailyid='" + _dailyid + "'", con);
            //DataTable dt = new DataTable();
            da.Fill(dt);

        }

        public void dailyupdateddl(string _hmaterial, string _htotalqty)
        {

            SqlDataAdapter da = new SqlDataAdapter(" UPDATE mhardware  SET mhardware.htotalqty = Dailyconsumption.dailytotalquantity  FROM mhardware  INNER JOIN  Dailyconsumption ON mhardware.hmaterial = Dailyconsumption.dailymaterial", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
    }
}
