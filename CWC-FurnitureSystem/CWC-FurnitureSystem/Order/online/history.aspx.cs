using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Order.online
{
    public partial class history : System.Web.UI.Page
    {

        DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            bindHistory();
        }

        struct salesO
        {
            public int salesId { get; set; }
            public DateTime transDate { get; set; }
            public string deliveryService { get; set; }
            public string transType { get; set; }
            public decimal totalAmount { get; set; }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            bindHistory();
        }

        void bindHistory()
        {
            Guid cust = Guid.Parse(Membership.GetUser().ProviderUserKey.ToString());
            var query = from s in dc.salesOrders
                        where s.customer == cust
                        select s;

            List<salesO> pay = new List<salesO>();
            foreach (var type in query)
            {
                salesO pa = new salesO();
                pa.salesId = type.salesId;
                pa.deliveryService = "Yes";
                pa.transDate = type.salesDate;
                pa.transType = type.salesType;
                pa.totalAmount = type.totalAmount;

                var q = from d in dc.deliveries
                        where d.salesId == type.salesId
                        select d;
                if (q == null)
                    pa.deliveryService = "No";

                pay.Add(pa);

            }

            GridView1.DataSource = pay;
            GridView1.DataBind();
        }
    }
}