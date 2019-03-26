using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DAL
{
    public class database
    {
        string starlinepackersConnectionString=ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString);
        public void marketinginsertDAL(string _Frommonth, string _tomonth)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into marketing values ('" + _Frommonth + "','" + _tomonth + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void inserthardwaredata(string _hmaterialcode, string _hcategory, string _hsubcategory, string _hmaterial, string _hlenght, string _hheight, string _hwidth, string _huom, string _hspecifications, string _hsize, string _hminimum, string _htotalqty)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into mhardware values ('" + _hmaterialcode + "','" + _hcategory + "','" + _hsubcategory + "','" + _hmaterial + "','" + _hlenght + "','" + _hheight + "','" + _hwidth + "','" + _huom + "','" + _hspecifications + "','" + _hsize + "','" + _hminimum + "','" + _htotalqty + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void insertlistofmachinaries(string _machinariesid, string _dop, string _item, string _nmc, string _supplier, string _qty, string _assetno, string _iadepartment, string _remarks)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into machinaries values ('" + _machinariesid + "','" + _dop + "','" + _item + "','" + _nmc + "','" + _supplier + "','" + _qty + "','" + _assetno + "','" + _iadepartment + "','" + _remarks + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public DataTable SelectData()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from machinaries", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void inserthardwarematerial(string _hmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _hmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void insertpolythenematerial(string _pomaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _pomaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void polytheneinsertdata(string _pomaterialcode, string _psubcategory, string _polength, string _powidth, string _pospecifications, string _pominimum, string _pocategory, string _pomaterial, string _poheight, string _pouom, string _posize, string _pototalqty)
        {
            SqlDataAdapter poly = new SqlDataAdapter("Insert into mpolythene values('" + _pomaterialcode + "','" + _psubcategory + "','" + _polength + "','" + _powidth + "','" + _pospecifications + "','" + _pominimum + "','" + _pocategory + "','" + _pomaterial + "','" + _poheight + "','" + _pouom + "','" + _posize + "','" + _pototalqty + "')", con);
            DataTable polydt = new DataTable();
            poly.Fill(polydt);
        }
        public DataTable polytheneselectdata()
        {
            SqlDataAdapter poly = new SqlDataAdapter("select * from mpolythene", con);
            DataTable polydt = new DataTable();
            poly.Fill(polydt);
            return polydt;
        }
        public void InsertData(string _pmaterialcode, string _pcategory, string _psubcategory, string _pmaterial, string _plength, string _luom, string _pheight, string _huom, string _pwidth, string _wuom, string _pspecifications, string _psize, string _pminimum, string _ptotalqty, string _cft, string _cum)
        {
            SqlDataAdapter da = new SqlDataAdapter("Insert into mplywood values('" + _pmaterialcode + "','" + _pcategory + "','" + _psubcategory + "','" + _pmaterial + "','" + _plength + "','" + _luom + "','" + _pheight + "','" + _huom + "','" + _pwidth + "','" + _wuom + "','" + _pspecifications + "','" + _psize + "','" + _pminimum + "','" + _ptotalqty + "','" + _cft + "','" + _cum + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public DataTable SelectData1()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from mplywood", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
        public void insertplywoodmaterial(string _pmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _pmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void insertwoodmaterial(string _mmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _mmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }

        public void Woodinsertdata(string _mmaterialcode, string _mcategory, string _msubcategory, string _mmaterial, string _mlength, string _luom, string _mheight, string _huom, string _mwidth, string _wuom, string _mspecifications, string _msize, string _mminimum, string _mtotalqty, string _cft, string _cum)
        {
            SqlDataAdapter woodda = new SqlDataAdapter("insert into  mwood (mmaterialcode,mcategory,msubcategory,mmaterial,mlength,luom,mheight,huom,mwidth,wuom,mspecifications,msize,mminimum,mtotalqty,CFT,CUM) values ('" + _mmaterialcode + "','" + _mcategory + "','" + _msubcategory + "','" + _mmaterial + "','" + _mlength + "','" + _luom + "','" + _mheight + "','" + _huom + "','" + _mwidth + "','" + _wuom + "','" + _mspecifications + "','" + _msize + "','" + _mminimum + "','" + _mtotalqty + "','" + _cft + "','" + _cum + "')", con);
            DataTable wooddt = new DataTable();
            woodda.Fill(wooddt);

        }



        public object woodselectdata()
        {
            SqlDataAdapter woodda = new SqlDataAdapter("select * from mwood", con);
            DataTable dt = new DataTable();
            woodda.Fill(dt);
            return dt;

        }

        public void insertpapermaterial(string _pamaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _pamaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }

        public void paperpackinginsertdata(string _pamaterialcode, string _pasubcategory, string _palength, string _pawidth, string _paspecifications, string _paminimum, string _pacategory, string _pamaterial, string _paheight, string _pauom, string _pasize, string _patotalqty, string _huom, string _wuom, string _cum, string _cft)
        {
            SqlDataAdapter paperpacking = new SqlDataAdapter("Insert into mpaperpacking ([pamaterialcode] ,[pasubcategory] ,[palength],[pawidth],[paspecifications],[paminimum] ,[pacategory],[pamaterial],[paheight],[pauom],[pasize],[patotalqty],[huom],[wuom],[CFT],[CUM]) values('" + _pamaterialcode + "','" + _pasubcategory + "','" + _palength + "','" + _pawidth + "','" + _paspecifications + "','" + _paminimum + "','" + _pacategory + "','" + _pamaterial + "','" + _paheight + "','" + _pauom + "','" + _pasize + "','" + _patotalqty + "','" + _huom + "','" + _wuom + "','" + _cum + "','" + _cft + "')", con);
            DataTable paperpackingdt = new DataTable();
            paperpacking.Fill(paperpackingdt);

        }

        public DataTable paperpackingselectdata()
        {
            SqlDataAdapter paperpacking = new SqlDataAdapter("select * from mpaperpacking", con);
            DataTable paperpackingdt = new DataTable();
            paperpacking.Fill(paperpackingdt);
            return paperpackingdt;
        }
        public void insertsteelmaterial(string _stmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _stmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void steelinsertdata(string _stmaterialcode, string _stsubcategory, string _stlength, string _stwidth, string _stspecifications, string _stminimum, string _stcategory, string _stmaterial, string _stheight, string _stuom, string _stsize, string _sttotalqty)
        {
            SqlDataAdapter steel = new SqlDataAdapter("Insert into msteel values('" + _stmaterialcode + "','" + _stsubcategory + "','" + _stlength + "','" + _stwidth + "','" + _stspecifications + "','" + _stminimum + "','" + _stcategory + "','" + _stmaterial + "','" + _stheight + "','" + _stuom + "','" + _stsize + "','" + _sttotalqty + "')", con);
            DataTable steeldt = new DataTable();
            steel.Fill(steeldt);

        }

        public DataTable steelselectdata()
        {
            SqlDataAdapter steel = new SqlDataAdapter("select * from msteel", con);
            DataTable steeldt = new DataTable();
            steel.Fill(steeldt);
            return steeldt;
        }

        public void inserttoolmaterial(string _tmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _tmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void toolsinsertdata(string _tmaterialcode, string _tsubcategory, string _tlength, string _twidth, string _tspecifications, string _tminimum, string _tcategory, string _tmaterial, string _theight, string _tuom, string _tsize, string _ttotalqty)
        {
            SqlDataAdapter tools = new SqlDataAdapter("Insert into mtools values('" + _tmaterialcode + "','" + _tsubcategory + "','" + _tlength + "','" + _twidth + "','" + _tspecifications + "','" + _tminimum + "','" + _tcategory + "','" + _tmaterial + "','" + _theight + "','" + _tuom + "','" + _tsize + "','" + _ttotalqty + "')", con);
            DataTable toolsdt = new DataTable();
            tools.Fill(toolsdt);

        }

        public DataTable toolsselectdata()
        {
            SqlDataAdapter tools = new SqlDataAdapter("select * from mtools", con);
            DataTable toolsdt = new DataTable();
            tools.Fill(toolsdt);
            return toolsdt;
        }

        public void packingmaterialinsertdata(string _pacmaterialcode, string _pacsubcategory, string _paclength, string _pacheight, string _pacwidth, string _pacspecifications, string _pacminimum, string _paccategory, string _pacmaterial, string _pacluom, string _pacsize, string _pactotalqty)
        {
            SqlDataAdapter packingmaterial = new SqlDataAdapter("Insert into mpackingmaterial values('" + _pacmaterialcode + "','" + _pacsubcategory + "','" + _paclength + "','" + _pacheight + "','" + _pacwidth + "','" + _pacspecifications + "','" + _pacminimum + "','" + _paccategory + "','" + _pacmaterial + "','" + _pacluom + "','" + _pacsize + "','" + _pactotalqty + "')", con);
            DataTable packingmaterialdt = new DataTable();
            packingmaterial.Fill(packingmaterialdt);

        }
        public void insertpackingmaterial(string _pacmaterial)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into allmaterial values ('" + _pacmaterial + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void insertdata(string _supplierid, string _companyname, string _phonenumber, string _products, string _tax, string _date, string _contactperson, string _emailid, string _hsncode, string _address)
        {

            SqlCommand cmd = new SqlCommand("Supplierdetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@supplier", _supplierid);
            cmd.Parameters.AddWithValue("@company", _companyname);
            cmd.Parameters.AddWithValue("@phonenumber", _phonenumber);
            cmd.Parameters.AddWithValue("@products", _products);
            cmd.Parameters.AddWithValue("@tax", _tax);
            cmd.Parameters.AddWithValue("@date", _date);
            cmd.Parameters.AddWithValue("@contactperson", _contactperson);
            cmd.Parameters.AddWithValue("@email", _emailid);
            cmd.Parameters.AddWithValue("@hsn", _hsncode);
            cmd.Parameters.AddWithValue("@address", _address);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public object Supplierselectdata()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from supplier ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }


        public void supplierupadteDDl(string _id, string _supplierid, string _companyname, string _phoneno, string _products, string _tax, string _date, string _contactperson, string _emailid, string _hsncode, string _address)
        {
            SqlDataAdapter da = new SqlDataAdapter("update supplier set supplierid='" + _supplierid + "',companyname='" + _companyname + "',phoneno='" + _phoneno + "',products='" + _products + "',tax='" + _tax + "',date='" + _date + "',contactperson='" + _contactperson + "',emailid='" + _emailid + "',hsncode='" + _hsncode + "',address='" + _address + "' where id='" + _id + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }

        public void insertproductddl(string _productid, string _productdate, string _productname, string _productlength, string _productwidth, string _productthickness, string _productgrade)
        {

            SqlDataAdapter da = new SqlDataAdapter("insert into product values ('" + _productid + "','" + _productdate + "','" + _productname + "','" + _productlength + "','" + _productwidth + "','" + _productthickness + "','" + _productgrade + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void insertproductddl(string _id, string _supplierid, string _companyname, string _phoneno, string _products, string _tax, string _date, string _contactperson, string _emailid, string _hsncode, string _address)
        {
            SqlDataAdapter da = new SqlDataAdapter("update supplier set supplierid='" + _supplierid + "',companyname='" + _companyname + "',phoneno='" + _phoneno + "',products='" + _products + "',tax='" + _tax + "',date='" + _date + "',contactperson='" + _contactperson + "',emailid='" + _emailid + "',hsncode='" + _hsncode + "',address='" + _address + "' where id='" + _id + "' ", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public void customerentryinsertDAL(string _CustomerId, string _ReviewerName, string _ReviewerDate, string _CompanyName, string _ContactName, string _Designation, string _Quality, string _Price, string _Delivery, string _Services, string _Improvement)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into CustomerSatisfactionAnalysis (CustomerId,ReviewerName,ReviewerDate,CompanyName,ContactName,Designation,Quality,Price,Delivery,Services,Improvement) values ('" + _CustomerId + "','" + _ReviewerName + "','" + _ReviewerDate + "','" + _CompanyName + "','" + _ContactName + "','" + _Designation + "','" + _Quality + "','" + _Price + "','" + _Delivery + "','" + _Services + "','" + _Improvement + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }

        public void ComplaintRegisterinsertDAL(string _complaintid, string _date, string _customerid, string _companyname, string _complaintsdeatails, string _type, string _action, string _status)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into ComplaintsRegister (ComplaintId,Date,CustomerId,CompanyName,CompanyDetails,Type,ActionTakenOn,Status) values ('" + _complaintid + "','" + _date + "','" + _customerid + "','" + _companyname + "','" + _complaintsdeatails + "','" + _type + "','" + _action + "','" + _status + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }

        public void newfallowupinsertDAL(string _leadid, string _companyname, string _contact, string _follow, string _followtype, string _fallowupdate, string _status, string _comment)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into newfallowup (leadid,companyname,contactperson,fallowupby,fallowuptype,fallowupdate,status,comment) values ('" + _leadid + "','" + _companyname + "','" + _contact + "','" + _follow + "','" + _followtype + "','" + _fallowupdate + "','" + _status + "','" + _comment + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void newleadinsertDAL(string _leadid, string _date, string _Companyname, string _Contactname, string _Mobile, string _email, string _Address, string _Requirement, string _executivename, string _status, string _comment)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into lead (leadid,date,companyname,contactname,mobile,email,address,requirement,executivename,status,comment) values ('" + _leadid + "','" + _date + "','" + _Companyname + "','" + _Contactname + "','" + _Mobile + "','" + _email + "','" + _Address + "','" + _Requirement + "','" + _executivename + "','" + _status + "','" + _comment + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public void productmasterinsertDAL(string _ProductId, string _Material, string _Size, string _UOM, string _Length, string _Weight, string _Height, string _Grade, string _Rate)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into ProductMaster (ProductId,Material,Size,UOM,Length,Weight,Height,Grade,Rate) values ('" + _ProductId + "','" + _Material + "','" + _Size + "','" + _UOM + "','" + _Length + "','" + _Weight + "','" + _Height + "','" + _Grade + "','" + _Rate + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public object productentryselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from ProductMaster ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }
        public void vendormasterinsertDAL(string _SupplierId, string _CompantName, string _ContactName, string _Designation, string _ContactNumber, string _EmailId, string _Address, string _HsnCode, string _Tax)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into VendorMaster (SupplierId,CompantName,ContactName,Designation,ContactNumber,EmailId,Address,HsnCode,Tax) values ('" + _SupplierId + "','" + _CompantName + "','" + _ContactName + "','" + _Designation + "','" + _ContactNumber + "','" + _EmailId + "','" + _Address + "','" + _HsnCode + "','" + _Tax + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public object vendorentryselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from VendorMaster ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }
        public void vehiclemasterinsertDAL(string _VehicleId, string _VehicleNumber, string _InsuranceNumber, string _VehicleType)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into VehicleMaster (VehicleId,VehicleNumber,InsuranceNumber,VehicleType) values ('" + _VehicleId + "','" + _VehicleNumber + "','" + _InsuranceNumber + "','" + _VehicleType + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public object vehicleentryselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from VehicleMaster ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }

        public void divermasterinsertDAL(string _DriverId, string _Name, string _Phone, string _Address, string _PanCardNumber)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into DriverMaster (DriverId,Name,Phone,Address,PanCardNumber) values ('" + _DriverId + "','" + _Name + "','" + _Phone + "','" + _Address + "','" + _PanCardNumber + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }

        public void dailyusageinsertdal(string _DailyUsageId, string _Date, string _MaterialCode, string _Catgery, string _SubCatgery, string _Material, string _AvailbileQuty, string _Required, string _Work, string _EmployeeName, string _oldDate)
        {
            SqlDataAdapter da = new SqlDataAdapter("Insert into DailyUsage values('" + _DailyUsageId + "','" + _Date + "','" + _MaterialCode + "','" + _Catgery + "','" + _Material + "','" + _AvailbileQuty + "','" + _Required + "','" + _Work + "','" + _EmployeeName + "','" + _oldDate + "','" + _SubCatgery + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
        }
        public DataTable dailyusageselectdata()
        {
            SqlDataAdapter usage = new SqlDataAdapter("select * from DailyUsage", con);
            DataTable usagdt = new DataTable();
            usage.Fill(usagdt);
            return usagdt;
        }

        public void ReturnStockinsertdata(string _DailyUsageId, string _Date, string _MaterialCode, string _Catgery, string _SubCatgery, string _Material, string _AvailbileQuty, string _Required, string _WorkOrder, string _EmployeeName, string _oldDate, string _Return, string _Ename, string _Date1, string _Comment)
        {
            SqlDataAdapter poly = new SqlDataAdapter("Insert into ReturnStock values('" + _DailyUsageId + "','" + _Date + "','" + _MaterialCode + "','" + _Catgery + "','" + _SubCatgery + "','" + _Material + "','" + _AvailbileQuty + "','" + _Required + "','" + _WorkOrder + "','" + _EmployeeName + "','" + _oldDate + "','" + _Return + "','" + _Ename + "','" + _Date1 + "','" + _Comment + "')", con);
            DataTable polydt = new DataTable();
            poly.Fill(polydt);

        }

        public DataTable ReturnstockSelectdata()
        {
            SqlDataAdapter usage = new SqlDataAdapter("select * from ReturnStock", con);
            DataTable usagdt = new DataTable();
            usage.Fill(usagdt);
            return usagdt;
        }




        public void newemployeeinsertdata(string _employeeid, string _name, string _joiningdate, string _gender, string _department, string _designation, string _mobile, string _email, string _address, string _emgcontact)
        {
            SqlDataAdapter poly = new SqlDataAdapter("Insert into newemployee values('" + _employeeid + "','" + _name + "','" + _joiningdate + "','" + _gender + "','" + _department + "','" + _designation + "','" + _mobile + "','" + _email + "','" + _address + "','" + _emgcontact + "')", con);
            DataTable polydt = new DataTable();
            poly.Fill(polydt);

        }

        public DataTable newemployeeSelectdata()
        {
            SqlDataAdapter usage = new SqlDataAdapter("select * from newemployee", con);
            DataTable usagdt = new DataTable();
            usage.Fill(usagdt);
            return usagdt;
        }
        public void relievinginsertdata(string _employeeid, string _name, string _joiningdate, string _department, string _designation, string _mobile, string _relievingdate)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into Relieving values ('" + _employeeid + "','" + _name + "','" + _joiningdate + "','" + _department + "','" + _designation + "','" + _mobile + "', '" + _relievingdate + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }



        //public void dailyusageinsertdata(string _DailyUsageId, string _Date, string _MaterialCode, string _Catgery, string _SubCatgery, string _Material, string _AvailbileQuty, string _Required, string _WorkOrder, string _EmployeeName, string _oldDate)
        //{
        //    SqlDataAdapter usage = new SqlDataAdapter("Insert into DailyUsage(DailyUsageId,Date,MaterialCode,Catgery,SubCatgery,Material,AvailbileQuty,Required,WorkOrder,EmployeeName,oldDate) values('" + _DailyUsageId + "','" + _Date + "','" + _MaterialCode + "','" + _Catgery + "','" + _Material + "','" + _AvailbileQuty + "','" + _Required + "','" + _WorkOrder + "','" + _EmployeeName + "','" + _oldDate + "','" + _SubCatgery + "')", con);
        //    DataTable usagedt = new DataTable();
        //    usage.Fill(usagedt);

        //}

        //public DataTable dailyusageselectdata()
        //{
        //    SqlDataAdapter usage = new SqlDataAdapter("select * from DailyUsage", con);
        //    DataTable usagedt = new DataTable();
        //    usage.Fill(usagedt);
        //    return usagedt;
        //}

        public void drivermasterinsertDAL(string _DriverId, string _Name, string _Phone, string _Address, string _PanCardNumber)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into DriverMaster (DriverId,Name,Phone,Address,PanCardNumber) values ('" + _DriverId + "','" + _Name + "','" + _Phone + "','" + _Address + "','" + _PanCardNumber + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public object driverentryselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from DriverMaster ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }

        public object customerentryselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from CustomerSatisfactionAnalysis ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }

        public void complatintsinsertDAL(string _ComplaintId, string _Date, string _CustomerId, string _CompanyName, string _CompanyDetails, string _Type, string _ActionTakenOn, string _Status)
        {
            SqlDataAdapter da = new SqlDataAdapter("insert into ComplaintsRegister (ComplaintId,Date,CustomerId,CompanyName,CompanyDetails,Type,ActionTakenOn,Status) values ('" + _ComplaintId + "','" + _Date + "','" + _CustomerId + "','" + _CompanyName + "','" + _CompanyName + "','" + _CompanyDetails + "','" + _Type + "','" + _ActionTakenOn + "','" + _Status + "')", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

        }
        public object complaintselectDAL()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from ComplaintsRegister ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }
        public object customerfeedbackDDl()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from customerfeedback1 ", con);
            DataTable dt2 = new DataTable();
            da1.Fill(dt2);
            return dt2;
        }
        public void customerentryfeedbackDDl(string _customerid, string _customername, string _contactperson, string _ciaddress, string _cidate, string _reviewername, string _phone, string _service, string _price, string _quality, string _delivery, string _support)
        {
            SqlDataAdapter da2 = new SqlDataAdapter("insert into customerfeedback1 (customerid,customername,contactperson,ciaddress,cidate,reviewername,phone,service,price,quality,delivery,support) values ('" + _customerid + "','" + _customername + "','" + _contactperson + "','" + _ciaddress + "','" + _cidate + "','" + _reviewername + "','" + _phone + "','" + _service + "','" + _price + "','" + _quality + "','" + _delivery + "','" + _support + "')", con);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);


        }
        public DataTable GetCategories()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from categorys", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;

        }
        public DataTable GetSuplierNames()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from supplier", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;

        }
        public DataTable GetCategories1()
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            DataTable dt = new DataTable();
            cmd = new SqlCommand("SP_MaterialCodes", con);
            cmd.CommandType = CommandType.StoredProcedure;
            da.SelectCommand = cmd;
            da.Fill(dt);
            return dt;

        }
        public DataTable Getmaterialcode(string categoryname)
        {
            //string starlinepackersConnectionString = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("Getmaterialcodelist"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@categoryname", categoryname));
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);
                    }
                }
            }
            return dt;

        }

        public DataTable GetMaterialDetails(string id, string categoryname)
        {
            //string starlinepackersConnectionString = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("GetDetail"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    cmd.Parameters.Add(new SqlParameter("@categoryname", categoryname));
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);

                    }

                }
            }
            return dt;
        }

        public DataTable Getdataback(string categoryname)
        {
            //string starlinepackersConnectionString = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("Getpostbackdata"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@categoryname", categoryname));
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);

                    }

                }
            }
            return dt;
        }
        public DataTable purchaseorderGetDetails(string materialcode)
        {
            //string starlinepackersConnectionString = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("purchaseorderGetDetail"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id", materialcode));
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);

                    }

                }
            }
            return dt;
        }

        public DataTable GetAllSupplier()
        {
            //string starlinepackersConnectionString = ConfigurationManager.ConnectionStrings["starlinepackersConnectionString"].ConnectionString;

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {

                using (SqlCommand cmd = new SqlCommand("GetAllSupplier"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);

                    }

                }
            }
            return dt;
        }


        public DataTable SubtractQuantity(string Matericode, string Totalqty)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(starlinepackersConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetavailableStock"))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@MatericalCode", Matericode));
                    cmd.Parameters.Add(new SqlParameter("@purchageQuantity", Totalqty));

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {

                        sda.Fill(dt);
                    }
                }
            }
            return dt;
        }
        public void insertdata(string _dailymaterialcode, string _dailycategory, string _dailymaterial, string _dailysize, string _dailysubcategory, string _dailytotalquantity, string _dailyminimumquantity, string _dailydate, string _dailyemployeename, string _dailyreqquantity, string _dailypurpose, string _DailyusageId)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("insert into Dailyconsumption values ('" + _dailymaterialcode + "','" + _dailycategory + "','" + _dailymaterial + "','" + _dailysize + "','" + _dailysubcategory + "','" + _dailytotalquantity + "','" + _dailyminimumquantity + "','" + _dailydate + "','" + _dailyemployeename + "','" + _dailyreqquantity + "','" + _dailypurpose + "','" + _DailyusageId + "')", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);

        }


        public object selectdata()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from Dailyconsumption ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }

        public void maintainencdal(string _machinariesid, string _dop, string _item, string _nmc, string _qty, string _guranteepaid, string _supplier)
        {
            SqlDataAdapter da1 = new SqlDataAdapter("insert into mainteance values ('" + _machinariesid + "','" + _dop + "','" + _item + "','" + _nmc + "','" + _qty + "','" + _guranteepaid + "','" + _supplier + "')", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);

        }


        public object selectdatamaintainence()
        {
            SqlDataAdapter da1 = new SqlDataAdapter("select * from mainteance ", con);
            DataTable dt = new DataTable();
            da1.Fill(dt);
            return dt;
        }


        public void Cfeedbackinsertdata(string _customerid, string _companyname, string _contactname, string _contactnumber, string _designation, string _reviewername, string _reviewerdate, string _meetingSpecification, string _consistencyQuality, string _identificationTraceability, string _ddlmaterialcode, string _timelyCompletion, string _transportArrangment, string _technicalSupport, string _responseUrgent, string _valueMoney, string _resolutionComplaints, string _responseSpecial, string _complaintResponse, string _knowledgeDesign)
        {
            SqlDataAdapter feed = new SqlDataAdapter("Insert into CFeedBack values('" + _customerid + "','" + _companyname + "','" + _contactname + "','" + _contactnumber + "','" + _designation + "','" + _reviewername + "','" + _reviewerdate + "','" + _meetingSpecification + "','" + _consistencyQuality + "','" + _identificationTraceability + "','" + _ddlmaterialcode + "','" + _timelyCompletion + "','" + _transportArrangment + "','" + _technicalSupport + "','" + _responseUrgent + "','" + _valueMoney + "','" + _resolutionComplaints + "','" + _responseSpecial + "','" + _complaintResponse + "','" + _knowledgeDesign + "')", con);
            DataTable feedback = new DataTable();
            feed.Fill(feedback);

        }


        public DataTable ReturnstockSelectdata1()
        {
            SqlDataAdapter usage = new SqlDataAdapter("select * from CFeedBack", con);
            DataTable usagdt = new DataTable();
            usage.Fill(usagdt);
            return usagdt;
        }


    }
}
