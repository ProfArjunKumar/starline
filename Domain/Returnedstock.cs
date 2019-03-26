using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Domain
{
    public class Returnedstock
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        public void returninsertdata(string _returnmaterialcode, string _returncategory, string _returnmaterial, string _returnsize, string _returnsubcategory, string _returntotalquantity, string _returnminimumquantity, string _returndate, string _returnemployeename, string _returnreqquantity, string _returnpurpose)
        {
            SqlCommand cmd = new SqlCommand("DailReturnValues", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@materialcode", _returnmaterialcode);
            cmd.Parameters.AddWithValue("@category", _returncategory);
            cmd.Parameters.AddWithValue("@categoryname", _returncategory);
            cmd.Parameters.AddWithValue("@material", _returnmaterial);
            cmd.Parameters.AddWithValue("@size", _returnsize);
            cmd.Parameters.AddWithValue("@subcategory", _returnsubcategory);
            cmd.Parameters.AddWithValue("@totalquantity", _returntotalquantity);
            cmd.Parameters.AddWithValue("@minimumquantity", _returnminimumquantity);
            cmd.Parameters.AddWithValue("@date", _returndate);
            cmd.Parameters.AddWithValue("@employeename", _returnemployeename);
            cmd.Parameters.AddWithValue("@total", _returnreqquantity);
            cmd.Parameters.AddWithValue("@purpose", _returnpurpose);
            cmd.Parameters.AddWithValue("@stock", _returntotalquantity);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public object Returnselectdata()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from Returnedstock ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }





        public void addinsertdata(string _addpurchaseid, string _addmaterialcode, string _addcategory, string _addmaterial, string _addsize, string _addsubcategory, string _addtotalquantity, string _addminimumquantity, string _adddate, string _addemployeename, string _addreqquantity, string _GRNID)
        {

            SqlCommand cmd = new SqlCommand("DailAddValues", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Purchaseid", _addpurchaseid);
            cmd.Parameters.AddWithValue("@materialcode", _addmaterialcode);
            cmd.Parameters.AddWithValue("@category", _addcategory);
            cmd.Parameters.AddWithValue("@categoryname", _addcategory);
            cmd.Parameters.AddWithValue("@material", _addmaterial);
            cmd.Parameters.AddWithValue("@size", _addsize);
            cmd.Parameters.AddWithValue("@subcategory", _addcategory);
            cmd.Parameters.AddWithValue("@totalquantity", _addtotalquantity);
            cmd.Parameters.AddWithValue("@minimumquantity", _addminimumquantity);
            cmd.Parameters.AddWithValue("@date", _adddate);
            cmd.Parameters.AddWithValue("@employeename", _addemployeename);
            cmd.Parameters.AddWithValue("@total", _addreqquantity);
            cmd.Parameters.AddWithValue("@stock", _addtotalquantity);
            cmd.Parameters.AddWithValue("@grn", _GRNID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        public void updateadddata(string _addid, string _addpurchaseid, string _addmaterialcode, string _addcategory, string _addmaterial, string _addsize, string _addsubcategory, string _addtotalquantity, string _addminimumquantity, string _adddate, string _addemployeename, string _addreqquantity, string _GRNID)
        {
            SqlCommand cmd = new SqlCommand("DailyUpdateAddValues", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@addid", _addid);
            cmd.Parameters.AddWithValue("@Purchaseid", _addpurchaseid);
            cmd.Parameters.AddWithValue("@materialcode", _addmaterialcode);
            cmd.Parameters.AddWithValue("@category", _addcategory);
            cmd.Parameters.AddWithValue("@categoryname", _addcategory);
            cmd.Parameters.AddWithValue("@material", _addmaterial);
            cmd.Parameters.AddWithValue("@size", _addsize);
            cmd.Parameters.AddWithValue("@subcategory", _addcategory);
            cmd.Parameters.AddWithValue("@totalquantity", _addtotalquantity);
            cmd.Parameters.AddWithValue("@minimumquantity", _addminimumquantity);
            cmd.Parameters.AddWithValue("@date", _adddate);
            cmd.Parameters.AddWithValue("@employeename", _addemployeename);
            cmd.Parameters.AddWithValue("@total", _addreqquantity);
            cmd.Parameters.AddWithValue("@stock", _addtotalquantity);
            cmd.Parameters.AddWithValue("@grn", _GRNID);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }


        //public void updateadddata(string _addid,string _addpurchaseid, string _addmaterialcode, string _addcategory, string _addmaterial, string _addsize, string _addsubcategory, string _addtotalquantity, string _addminimumquantity, string _adddate, string _addemployeename, string _addreqquantity,string _GRNID)
        //{
        //    //SqlDataAdapter da = new SqlDataAdapter("update ADDstock set addpurchadseid='"+_addpurchaseid+"',")
        //    SqlDataAdapter da= new SqlDataAdapter("update ADDstock set addpurchaseid='"+_addpurchaseid+"',addmaterialcode='"+_addmaterialcode+"',addcategory='"+_addcategory+"',addmaterial='"+_addmaterial+"',addsize='"_addsize"',addsubcategory='"+_addsubcategory+"',addtotalquantity='"+_addtotalquantity+"',addminimumquantity='"+_addminimumquantity+"',adddate='"+_adddate+"',addemployeename='"+_addemployeename+"',addreqquantity='"+_addreqquantity+"',GRNID='"++_GRNID"' where addid='"+_addid+"'",con);

        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //}

        public object addselectdata()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from DailAddValues ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }

    }
}
