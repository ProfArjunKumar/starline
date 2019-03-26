using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DAL;

namespace BLL
{
    public class DailyConsumption
    {
        public DataTable GetCategories()
        {
            database objdc = new database();
            return objdc.GetCategories();
        }
        public DataTable GetCategoriesEnquiryPage()
        {
            database objdc = new database();
            return objdc.GetCategories();
        }
        public DataTable GetCategories1()
        {
            database objdc = new database();
            return objdc.GetCategories1();
        }
        public DataTable GetSuplierNames()
        {
            database objdc = new database();
            return objdc.GetSuplierNames();
        }
        public DataTable Getmaterialcode(string categoryname)
        {
            database objdc = new database();
            return objdc.Getmaterialcode(categoryname);
        }
        public DataTable Getmaterialdetails(string id, string CategoryName)
        {
            database details = new database();
            return details.GetMaterialDetails(id, CategoryName);
        }
        public DataTable Getdailypostdata(string CategoryName)
        {
            database details = new database();
            return details.Getdataback(CategoryName);
        }
        public DataTable purchaseordergetmaterialdetails(string materialcode)
        {
            database details = new database();
            return details.purchaseorderGetDetails(materialcode);
        }
        public DataTable getallsuppliers()
        {
            database get = new database();
            return get.GetAllSupplier();
        }
        public DataTable SubtractQuantityLevel(string SubtractMaterialcode, string SubtracTotalQty)
        {
            database SubtractQty = new database();
            return SubtractQty.SubtractQuantity(SubtractMaterialcode, SubtracTotalQty);
        }
        public DataTable purchaseordergetmaterialdetails()
        {
            throw new NotImplementedException();
        }
    }
}
