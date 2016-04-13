using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Web.Security;
using System.Data;

namespace CWC_FurnitureSystem.Order.offline
{
    public partial class searchOrderOffline : System.Web.UI.Page
    {

        DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setInitialGridView();
                bindSalesId();
                bindCustomer();
            }
        }

        void bindSalesId()
        {
            ddlSalesId.DataSource = from s in dc.salesOrders
                                    select s.salesId;
            ddlSalesId.DataBind();

            ddlSalesId.Items.Insert(0, new ListItem("- - -", "NA"));
        }

        void bindCustomer()
        {
            String[] users = Roles.GetUsersInRole("customer");
            String[] front = { "- - -" };
            String[] arr = front.Union(users).ToArray();
            ddlCust.DataSource = arr;
            ddlCust.DataBind();
        }

        protected void OnPaging1(object sender, GridViewPageEventArgs e)
        {
            gvSearch.PageIndex = e.NewPageIndex;
            if(ViewState["searchTable"] != null)
            {

                gvSearch.DataSource = (DataTable)ViewState["searchTable"];
                gvSearch.DataBind();
            }
        }

        //struct sales
        //{
        //    public int salesId { get; set; }
        //    public DateTime salesDate { get; set; }
        //    public string salesType { get; set; }
        //    public decimal totalAmount { get; set; }
        //    public string salesStatus { get; set; }
        //    public string customer { get; set; }
        //    public string staff { get; set; }

        //    public sales(int salesId,
        //    DateTime salesDate,
        //    string salesType,
        //    decimal totalAmount,
        //    string salesStatus,
        //    string customer,
        //    string staff)
        //    {
        //        this.salesId = salesId;
        //        this.salesDate = salesDate;
        //        this.salesType = salesType;
        //        this.totalAmount = totalAmount;
        //        this.salesStatus = salesStatus;
        //        this.customer = customer;
        //        this.staff = staff;
        //    }

            
        //}

        private void setInitialGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("SalesID", typeof(int)));
            dt.Columns.Add(new DataColumn("SalesDate", typeof(DateTime)));
            dt.Columns.Add(new DataColumn("SalesType", typeof(string)));
            dt.Columns.Add(new DataColumn("totalAmount", typeof(decimal)));
            dt.Columns.Add(new DataColumn("SalesStatus", typeof(string)));
            dt.Columns.Add(new DataColumn("Customer", typeof(string)));
            dt.Columns.Add(new DataColumn("Staff", typeof(string)));
            
            ViewState["searchTable"] = dt;

            bindGridView((from o in dc.salesOrders
                          select o).ToList());
        }

        void bindGridView(List<salesOrder> salesD)
        {
            List<salesOrder> sales = salesD;
            
            if(ViewState["searchTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["searchTable"];
                dt.Clear();
                foreach (salesOrder s in sales)
                {
                    DataRow dr = dt.NewRow();
                    dr["SalesID"] = s.salesId;
                    dr["SalesDate"] = s.salesDate;
                    dr["SalesType"] = s.salesType;
                    dr["totalAmount"] = s.totalAmount;
                    dr["SalesStatus"] = s.salesStatus;
                    string cust = "";
                    if (s.customer != null)
                        cust = Membership.GetUser(s.customer).UserName;

                    string staff = "";
                    if (s.staff != null)
                        staff = Membership.GetUser(s.staff).UserName;

                    dr["Customer"] = cust;
                    dr["Staff"] = staff;
                    dt.Rows.Add(dr);

                }

                ViewState["searchTable"] = dt;

                gvSearch.DataSource = dt;
                gvSearch.DataBind();

            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            int salesId = int.Parse(gvSearch.SelectedDataKey.Value.ToString());
            gvSalesItem.DataSource = from s in dc.salesItems
                                     join o in dc.salesOrders
                                     on s.salesId equals o.salesId
                                     where o.salesId == salesId
                                     select new
                                     {
                                         s.productId,
                                         s.product.productName,
                                         s.quantity,
                                         s.unitPrice,
                                         s.totalPrice
                                     };
            gvSalesItem.DataBind();
            salesIDLbl.Text = addOrderOffline.convertIdToStr("S", salesId.ToString());
            mp1.Show();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ddlSalesId.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
            ddlType.SelectedIndex = 0;
            ddlCust.SelectedIndex = 0;
            txtFrom.Text = "";
            txtTo.Text = "";
            txtMin.Text = "";
            txtMax.Text = "";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string sales = ddlSalesId.Text;
            string status = ddlStatus.Text;
            string type = ddlType.Text;
            string cust = ddlCust.Text;
            string from = Request.Form[txtFrom.UniqueID];
            string to = Request.Form[txtTo.UniqueID];
            string min = txtMin.Text;
            string max = txtMax.Text;

            IQueryable<salesOrder> so = dc.salesOrders;
            int num1;

            if (int.TryParse(sales,out num1))
            {
                so = so
                    .Where(s => s.salesId == int.Parse(sales));
            }
            if (status.Equals("Paid",StringComparison.OrdinalIgnoreCase) ||
                status.Equals("Unpaid", StringComparison.OrdinalIgnoreCase))
            {
                status = status.ToLower();
                so = so
                    .Where(s => s.salesStatus.Equals(status));
            }
            
            if (type.Equals("Online", StringComparison.OrdinalIgnoreCase) ||
                type.Equals("Offline", StringComparison.OrdinalIgnoreCase))
            {
                type = type.ToLower();
                so = so
                    .Where(s => s.salesType.Equals(type));
            }
            if(Membership.GetUser(cust) != null)
            {
                Guid c = Guid.Parse(Membership.GetUser(cust).ProviderUserKey.ToString());
                so = so.Where(s => s.customer == c);
            }
            if(from.Length > 0)
            {
                DateTime dt = Convert.ToDateTime(from);
                so = so.Where(s => s.salesDate >= dt);
            }
            if (to.Length > 0)
            {
                DateTime dt = Convert.ToDateTime(to);
                so = so.Where(s => s.salesDate <= dt);
            }
            if (!string.IsNullOrEmpty(min))
            {
                decimal minD = decimal.Parse(min);
                so = so.Where(s => s.totalAmount >= minD);
            }
            if (!string.IsNullOrEmpty(max))
            {
                decimal maxD = decimal.Parse(max);
                so = so.Where(s => s.totalAmount <= maxD);
            }

            bindGridView(so.ToList());
        }
    }
}