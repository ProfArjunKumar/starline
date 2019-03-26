using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using System.Web;
using System.Configuration;
using System.IO;

namespace BLL
{
    public class Class1
    {
        database d = new database();
        public void hardwareinsert(string _hmaterialcode, string _hcategory, string _hsubcategory, string _hmaterial, string _hlenght, string _hheight, string _hwidth, string _huom, string _hspecifications, string _hsize, string _hminimum, string _htotalqty)
        {
            d.inserthardwaredata(_hmaterialcode, _hcategory, _hsubcategory, _hmaterial, _hlenght, _hheight, _hwidth, _huom, _hspecifications, _hsize, _hminimum, _htotalqty);
        }
        public void marketinginsertBLL(string _Frommonth, string _tomonth)
        {
            d.marketinginsertDAL(_Frommonth, _tomonth);
        }
        public void newleadinsertBLL(string _leadid, string _date, string _Companyname, string _Contactname, string _Mobile, string _email, string _Address, string _Requirement, string _executivename, string _status, string _comment)
        {
            d.newleadinsertDAL(_leadid, _date, _Companyname, _Contactname, _Mobile, _email, _Address, _Requirement, _executivename, _status, _comment);
        }
        public void hardwarematerial(string _hmaterial)
        {
            d.inserthardwarematerial(_hmaterial);
        }
        public void polythenematerial(string _pomaterial)
        {
            d.insertpolythenematerial(_pomaterial);
        }
        public void polythenedata(string _pomaterialcode, string _psubcategory, string _polength, string _powidth, string _pospecifications, string _pominimum, string _pocategory, string _pomaterial, string _poheight, string _pouom, string _posize, string _ptotalqty)
        {
            d.polytheneinsertdata(_pomaterialcode, _psubcategory, _polength, _powidth, _pospecifications, _pominimum, _pocategory, _pomaterial, _poheight, _pouom, _posize, _ptotalqty);
        }
        public object polyselect()
        {
            return d.polytheneselectdata();
        }
        public void plywoodmaterial(string _pmaterial)
        {
            d.insertplywoodmaterial(_pmaterial);
        }
        public void Insertlistofmachinariesbll(string _machinariesid, string _dop, string _item, string _nmc, string _supplier, string _qty, string _assetno, string _iadepartment, string _remarks)
        {

            d.insertlistofmachinaries(_machinariesid, _dop, _item, _nmc, _supplier, _qty, _assetno, _iadepartment, _remarks);
        }
        public object machinariesselect()
        {
            return d.selectdata();
        }
        public void Insertdata(string _pmaterialcode, string _pcategory, string _psubcategory, string _pmaterial, string _plength, string _luom, string _pheight, string _huom, string _pwidth, string _wuom, string _pspecifications, string _psize, string _pminimum, string _ptotalqty, string _cft, string _cum)
        {

            d.InsertData(_pmaterialcode, _pcategory, _psubcategory, _pmaterial, _plength, _luom, _pheight, _huom, _pwidth, _wuom, _pspecifications, _psize, _pminimum, _ptotalqty, _cft, _cum);
        }
        public object select()
        {
            return d.SelectData();
        }
        public void woodmaterial(string _mmaterial)
        {
            d.insertwoodmaterial(_mmaterial);
        }
        public void Woodinsertdata(string _mmaterialcode, string _mcategory, string _msubcategory, string _mmaterial, string _mlength, string _luom, string _mheight, string _huom, string _mwidth, string _wuom, string _mspecifications, string _msize, string _mminimum, string _mtotalqty, string _cft, string _cum)
        {
            d.Woodinsertdata(_mmaterialcode, _mcategory, _msubcategory, _mmaterial, _mlength, _luom, _mheight, _huom, _mwidth, _wuom, _mspecifications, _msize, _mminimum, _mtotalqty, _cft, _cum);
        }
        public object Woodselectdata()
        {
            return d.woodselectdata();
        }
        public void papermaterial(string _pamaterial)
        {
            d.insertpapermaterial(_pamaterial);
        }
        public void paperpacking(string _pamaterialcode, string _pasubcategory, string _palength, string _pawidth, string _paspecifications, string _paminimum, string _pacategory, string _pamaterial, string _paheight, string _pauom, string _pasize, string _patotalqty, string _huom, string _wuom, string _cum, string _cft)
        {
            d.paperpackinginsertdata(_pamaterialcode, _pasubcategory, _palength, _pawidth, _paspecifications, _paminimum, _pacategory, _pamaterial, _paheight, _pauom, _pasize, _patotalqty, _huom, _wuom, _cum, _cft);
        }
        public object paperpackingselect()
        {
            return d.paperpackingselectdata();
        }
        public void steel(string _stmaterialcode, string _stsubcategory, string _stlength, string _stwidth, string _stspecifications, string _stminimum, string _stcategory, string _stmaterial, string _stheight, string _stuom, string _stsize, string _sttotalqty)
        {
            d.steelinsertdata(_stmaterialcode, _stsubcategory, _stlength, _stwidth, _stspecifications, _stminimum, _stcategory, _stmaterial, _stheight, _stuom, _stsize, _sttotalqty);
        }
        public object steelselect()
        {
            return d.steelselectdata();
        }
        public void steelallmaterial(string _stmaterial)
        {
            d.insertsteelmaterial(_stmaterial);
        }
        public void toolallmaterial(string _tmaterial)
        {
            d.inserttoolmaterial(_tmaterial);
        }
        public void tools(string _tmaterialcode, string _tsubcategory, string _tlength, string _twidth, string _tspecifications, string _tminimum, string _tcategory, string _tmaterial, string _theight, string _tuom, string _tsize, string _ttotalqty)
        {
            d.toolsinsertdata(_tmaterialcode, _tsubcategory, _tlength, _twidth, _tspecifications, _tminimum, _tcategory, _tmaterial, _theight, _tuom, _tsize, _ttotalqty);
        }
        public object toolsselect()
        {
            return d.toolsselectdata();
        }
        public void packingmaterial(string _pacmaterialcode, string _pacsubcategory, string _paclength, string _pacheight, string _pacwidth, string _pacspecifications, string _pacminimum, string _paccategory, string _pacmaterial, string _pacluom, string _pacsize, string _pactotalqty)
        {
            d.packingmaterialinsertdata(_pacmaterialcode, _pacsubcategory, _paclength, _pacheight, _pacwidth, _pacspecifications, _pacminimum, _paccategory, _pacmaterial, _pacluom, _pacsize, _pactotalqty);
        }
        public void packingallmaterial(string _pacmaterial)
        {
            d.insertpackingmaterial(_pacmaterial);
        }
        public void supplierinsertdata(string _supplierid, string _companyname, string _phonenumber, string _products, string _tax, string _date, string _contactperson, string _emailid, string _hsncode, string _address)
        {
            d.insertdata(_supplierid, _companyname, _phonenumber, _products, _tax, _date, _contactperson, _emailid, _hsncode, _address);
        }
        public void productinsertdata(string _productid, string _productdate, string _productname, string _productlength, string _productwidth, string _productthickness, string _productgrade)
        {
            d.insertproductddl(_productid, _productdate, _productname, _productlength, _productwidth, _productthickness, _productgrade);
        }
        public void CustomerentryinsertBLL(string _CustomerId, string _ReviewerName, string _ReviewerDate, string _CompanyName, string _ContactName, string _Designation, string _Quality, string _Price, string _Delivery, string _Services, string _Improvement)
        {
            d.customerentryinsertDAL(_CustomerId, _ReviewerName, _ReviewerDate, _CompanyName, _ContactName, _Designation, _Quality, _Price, _Delivery, _Services, _Improvement);
        }
        public void ComplaintRegisteinsertBLL(string _complaintid, string _date, string _customerid, string _companyname, string _complaintsdeatails, string _type, string _action, string _status)
        {
            d.ComplaintRegisterinsertDAL(_complaintid, _date, _customerid, _companyname, _complaintsdeatails, _type, _action, _status);
        }
        public void newfallowupinsertBLL(string _leadid, string _companyname, string _contact, string _follow, string _followtype, string _fallowupdate, string _status, string _comment)
        {
            d.newfallowupinsertDAL(_leadid, _companyname, _contact, _follow, _followtype, _fallowupdate, _status, _comment);
        }
        public object customerentryselectBLL()
        {
            return d.customerentryselectDAL();
        }
        public void ComplaintsinsertBLL(string _ComplaintId, string _Date, string _CustomerId, string _CompanyName, string _CompanyDetails, string _Type, string _ActionTakenOn, string _Status)
        {
            d.complatintsinsertDAL(_ComplaintId, _Date, _CustomerId, _CompanyName, _CompanyDetails, _Type, _ActionTakenOn, _Status);
        }
        public object ComplaintsselectBLL()
        {
            return d.complaintselectDAL();
        }
        public void productmasterinsertBLL(string _ProductId, string _Material, string _Size, string _UOM, string _Length, string _Weight, string _Height, string _Grade, string _Rate)
        {
            d.productmasterinsertDAL(_ProductId, _Material, _Size, _UOM, _Length, _Weight, _Height, _Grade, _Rate);
        }
        public void vendormasterinsertBLL(string _SupplierId, string _CompantName, string _ContactName, string _Designation, string _ContactNumber, string _EmailId, string _Address, string _HsnCode, string _Tax)
        {
            d.vendormasterinsertDAL(_SupplierId, _CompantName, _ContactName, _Designation, _ContactNumber, _EmailId, _Address, _HsnCode, _Tax);
        }
        public void vehiclemasterinsertBLL(string _VehicleId, string _VehicleNumber, string _InsuranceNumber, string _VehicleType)
        {
            d.vehiclemasterinsertDAL(_VehicleId, _VehicleNumber, _InsuranceNumber, _VehicleType);
        }
        public void drivermasterinsertBLL(string _DriverId, string _Name, string _Phone, string _Address, string _PanCardNumber)
        {
            d.divermasterinsertDAL(_DriverId, _Name, _Phone, _Address, _PanCardNumber);
        }
        public void customerfeedbackinsertBAL(string _customerid, string _customername, string _contactperson, string _ciaddress, string _cidate, string _reviewername, string _phone, string _service, string _price, string _quality, string _delivery, string _support)
        {
            d.customerentryfeedbackDDl(_customerid, _customername, _contactperson, _ciaddress, _cidate, _reviewername, _phone, _service, _price, _quality, _delivery, _support);
        }
        public object CustomerfeedbackyselectBAL()
        {
            return d.customerfeedbackDDl();
        }
        public void dailyusageinsertbll(string _DailyUsageId, string _Date, string _MaterialCode, string _Catgery, string _SubCatgery, string _Material, string _AvailbileQuty, string _Required, string _WorkOrder, string _EmployeeName, string _oldDate)
        {
            d.dailyusageinsertdal(_DailyUsageId, _Date, _MaterialCode, _Catgery, _SubCatgery, _Material, _AvailbileQuty, _Required, _WorkOrder, _EmployeeName, _oldDate);
        }
        public void ReturnStockdata(string __DailyUsageId, string _Date, string _MaterialCode, string _Catgery, string _SubCatgery, string _Material, string _AvalibileQuty, string _Required, string _WorkOrder, string _EmployeeName, string _oldDate, string _Return, string _Ename, string _Date1, string _Comment)
        {
            d.ReturnStockinsertdata(__DailyUsageId, _Date, _MaterialCode, _Catgery, _SubCatgery, _Material, _AvalibileQuty, _Required, _WorkOrder, _EmployeeName, _oldDate, _Return, _Ename, _Date1, _Comment);
        }
        public object returnstockselect()
        {
            return d.ReturnstockSelectdata();
        }
        public void newemployeeinserbll(string _employeeid, string _name, string _joiningdate, string _gender, string _department, string _designation, string _mobile, string _email, string _address, string _emgcontact)
        {
            d.newemployeeinsertdata(_employeeid, _name, _joiningdate, _gender, _department, _designation, _mobile, _email, _address, _emgcontact);
        }
        public object newemployeeselect()
        {
            return d.newemployeeSelectdata();
        }
        public void relievinginsertbll(string _employeeid, string _name, string _joiningdate, string _department, string _designation, string _mobile, string _relievingdate)
        {
            d.relievinginsertdata(_employeeid, _name, _joiningdate, _department, _designation, _mobile, _relievingdate);
        }
        public object relievingselect()
        {
            return d.newemployeeSelectdata();
        }
        public void mainatainencbll(string _machinariesid, string _dop, string _item, string _nmc, string _qty, string _guranteepaid, string _supplier)
        {
            d.maintainencdal(_machinariesid, _dop, _item, _nmc, _qty, _guranteepaid, _supplier);
        }
        public object maintainencselect()
        {
            return d.selectdatamaintainence();
        }
        public object dailyusageselect()
        {
            return d.dailyusageselectdata();
        }
        public void dailyInsertdata(string _dailymaterialcode, string _dailycategory, string _dailymaterial, string _dailysize, string _dailysubcategory, string _dailytotalquantity, string _dailyminimumquantity, string _dailydate, string _dailyemployeename, string _dailyreqquantity, string _dailypurpose, string _updatedate, string _Work, string _DailyusageId)
        {
            Domain.DailyConsumption dDaily = new Domain.DailyConsumption();
            dDaily.insertdata(_dailymaterialcode, _dailycategory, _dailymaterial, _dailysize, _dailysubcategory, _dailytotalquantity, _dailyminimumquantity, _dailydate, _dailyemployeename, _dailyreqquantity, _dailypurpose, _updatedate, _Work, _DailyusageId);
        }
        public void dailydeletedata(string _dailyid, string _dailymaterialcode, string _dailycategory, string _dailymaterial, string _dailysize, string _dailysubcategory, string _dailytotalquantity, string _dailyminimumquantity, string _dailydate, string _dailyemployeename, string _dailyreqquantity, string _dailypurpose, string _updatedate, string _Work)
        {
            Domain.DailyConsumption dDaily = new Domain.DailyConsumption();
            dDaily.dailydeleteddl(_dailyid, _dailymaterialcode, _dailycategory, _dailymaterial, _dailysize, _dailysubcategory, _dailytotalquantity, _dailyminimumquantity, _dailydate, _dailyemployeename, _dailyreqquantity, _dailypurpose, _updatedate, _Work);
        }
        public void dailypostbackdata(string _hid, string _htotalqty)
        {
            Domain.DailyConsumption dDaily = new Domain.DailyConsumption();
            dDaily.dailyupdateddl(_hid, _htotalqty);
        }
        public object dailySelectdata()
        {
            return d.selectdata();
        }
        public void AddinsertdataBal(string _addpurchaseid, string _addmaterialcode, string _addcategory, string _addmaterial, string _addsize, string _addsubcategory, string _addtotalquantity, string _addminimumquantity, string _adddate, string _addemployeename, string _addreqquantity, string _GRNID)
        {
            Domain.Returnedstock rs = new Domain.Returnedstock();
            rs.addinsertdata(_addpurchaseid, _addmaterialcode, _addcategory, _addmaterial, _addsize, _addsubcategory, _addtotalquantity, _addminimumquantity, _adddate, _addemployeename, _addreqquantity, _GRNID);
        }
        public void ReturnInsertdata(string _returnmaterialcode, string _returncategory, string _returnmaterial, string _returnsize, string _returnsubcategory, string _returntotalquantity, string _returnminimumquantity, string _returndate, string _returnemployeename, string _returnreqquantity, string _returnpurpose)
        {
            Domain.Returnedstock rs = new Domain.Returnedstock();
            rs.returninsertdata(_returnmaterialcode, _returncategory, _returnmaterial, _returnsize, _returnsubcategory, _returntotalquantity, _returnminimumquantity, _returndate, _returnemployeename, _returnreqquantity, _returnpurpose);
        }
        public void Cfeedbackdata(string _customerid, string _companyname, string _contactname, string _contactnumber, string _designation, string _reviewername, string _reviewerdate, string _meetingSpecification, string _consistencyQuality, string _identificationTraceability, string _ddlmaterialcode, string _timelyCompletion, string _transportArrangment, string _technicalSupport, string _responseUrgent, string _valueMoney, string _resolutionComplaints, string _responseSpecial, string _complaintResponse, string _knowledgeDesign)
        {
            d.Cfeedbackinsertdata(_customerid, _companyname, _contactname, _contactnumber, _designation, _reviewername, _reviewerdate, _meetingSpecification, _consistencyQuality, _identificationTraceability, _ddlmaterialcode, _timelyCompletion, _transportArrangment, _technicalSupport, _responseUrgent, _valueMoney, _resolutionComplaints, _responseSpecial, _complaintResponse, _knowledgeDesign);
        }
        public object Cfeedbackselect()
        {
            return d.ReturnstockSelectdata1();
        }

    }
}
