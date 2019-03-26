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
    public partial class WebForm18 : System.Web.UI.Page
    {        
        Class1 cls = new Class1();
        string cs = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                gvbind();
                returndate.Text = DateTime.Now.Date.ToShortDateString();
                ddluasgeid.Items.Insert(0, new System.Web.UI.WebControls.ListItem(" select ", " "));
                ddluasgeid.AppendDataBoundItems = true;

                string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;

                String strQuery = "select DailyusageId from Dailyconsumption";
                SqlConnection con = new SqlConnection(constr);

                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddluasgeid.DataSource = cmd.ExecuteReader();
                    ddluasgeid.DataTextField = "DailyusageId";
                    ddluasgeid.DataValueField = "DailyusageId";
                    ddluasgeid.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }                
            }
        }
        private void gvbind()
        {
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from ReturnStock", con);
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
        private void reset()
        {            
            returnmaterialcode.Text = string.Empty;
            returnavailablequantity.Text = string.Empty;
            returnmaterial.Text = string.Empty;
            returnemployeename.Text = string.Empty;
            returnemployeenamee.Text = string.Empty;
            returnrequired.Text = string.Empty;
            returnolddate.Text = string.Empty;
            returnworkorder.Text = string.Empty;
            returncategory.Text = string.Empty;
            returnsubcategory.Text = string.Empty;
            returnreturn.Text = string.Empty;
            returnrequired.Text = string.Empty;            
            returnComment.Text = string.Empty;
        }

        protected void ddluasgeid_SelectedIndexChanged(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("select * from Dailyconsumption where DailyusageId='"+ ddluasgeid.SelectedItem.ToString() +"'", con);            
            try
            {
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {                    
                    returnmaterialcode.Text = sdr["dailymaterialcode"].ToString();
                    returnemployeename.Text = sdr["dailyemployeename"].ToString();
                    returnmaterial.Text = sdr["dailymaterial"].ToString();
                    returnrequired.Text = sdr["dailyreqquantity"].ToString();
                    returnavailablequantity.Text = sdr["dailytotalquantity"].ToString();
                    returnolddate.Text = sdr["dailydate"].ToString();
                    returnworkorder.Text = sdr["work"].ToString();
                    returncategory.Text = sdr["dailycategory"].ToString();
                    returnsubcategory.Text = sdr["dailysubcategory"].ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {         
            Class1 dailycon = new Class1();
            if (returnmaterial.Text != "" && returnreturn.Text != "")
            {
                DailyConsumption dc = new DailyConsumption();
                DataTable dt = new DataTable();
                string value = (Convert.ToDecimal(returnavailablequantity.Text) + Convert.ToDecimal(returnreturn.Text)).ToString();
                string choice = returncategory.Text;

                switch (choice)
                {
                    case "Hardware":
                        string constr = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mhardware set htotalqty='" + data + "' where hmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                con.Close();
                            }
                        }
                        break;
                    case "wood":
                        string constr1 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr1))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mwood set mtotalqty ='" + data + "' where mmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "plywood":
                        string constr2 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr2))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mplywood set ptotalqty ='" + data + "' where pmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "polythene":
                        string constr3 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr3))
                        {
                            decimal data = decimal.Parse(value);

                            using (SqlCommand cmd = new SqlCommand("update mpolythene set pototalqty ='" + data + "' where pomaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Paper Packing":
                        string constr4 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr4))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpaperpacking set patotalqty ='" + data + "' where pamaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Packaging material":
                        string constr5 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr5))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mpackingmaterial set pactotalqty ='" + data + "' where pacmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Steel":
                        string constr6 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr6))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update msteel set sttotalqty ='" + data + "' where stmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Tools":
                        string constr7 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr7))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mtools set ttotalqty ='" + data + "' where tmaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    case "Miscellaneous":
                        string constr8 = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(constr8))
                        {
                            decimal data = decimal.Parse(value);
                            using (SqlCommand cmd = new SqlCommand("update mmiscellaneous set mistotalqty ='" + data + "' where mismaterial='" + returnmaterial.Text + "'", con))
                            {
                                cmd.Connection = con;
                                con.Open();
                                cmd.ExecuteNonQuery();
                                Gridview1.DataBind();
                                con.Close();
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert(' Please Enter The Required Fields')", true);
            }
            string strCon = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ToString();
            SqlConnection con1 = new SqlConnection(strCon);
            SqlCommand cmd1 = new SqlCommand("Insert into ReturnStock (DailyUsageId,Date,MaterialCode,Catgery,SubCatgery,Material,AvailbileQuty,Required,WorkOrder,EmployeeName,oldDate,[Return],Ename,Comment) values('" + ddluasgeid.SelectedItem.ToString() + "','" + returndate.Text + "','" + returnmaterialcode.Text + "','" + returncategory.Text + "','" + returnsubcategory.Text + "','" + returnmaterial.Text + "','" + returnavailablequantity.Text + "','" + returnrequired.Text + "','" + returnworkorder.Text + "','" + returnemployeename.Text + "','" + returnolddate.Text + "','" + returnreturn.Text + "','" + returnemployeenamee.Text + "','" + returnComment.Text + "')", con1);
            con1.Open();
            cmd1.ExecuteNonQuery();
            con1.Close();
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
            string FileName = "ProductMaster" + DateTime.Now + ".xls";
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