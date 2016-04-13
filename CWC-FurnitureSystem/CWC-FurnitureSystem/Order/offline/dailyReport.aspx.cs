using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Order.offline
{
    public partial class dailyReport : System.Web.UI.Page
    {

        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            CalendarExtender1.SelectedDate = DateTime.Now;
                lblDate.Text = DateTime.Now.ToShortDateString();
                lblCust.Text = Membership.GetUser().UserName;
           
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            date.Text = Request.Form[txtFrom.UniqueID];
            DateTime dt = Convert.ToDateTime(Request.Form[txtFrom.UniqueID]);
            CalendarExtender1.SelectedDate = dt.Date;
            var query = (from s in dc.salesItems
                                    where s.salesOrder.salesDate.Date == dt.Date
                                    group s by new { s.productId, s.product.productName, s.unitPrice } into g
                                    select new
                                    {
                                        g.Key.productId,
                                        g.Key.productName,
                                        g.Key.unitPrice,
                                        qtySold = g.Sum(x => x.quantity),
                                        salesAmount = g.Sum(x => x.totalPrice)
                                    }).OrderBy(x => x.productId);
            
            GridView1.DataSource = query;
            GridView1.DataBind();

            try {
                //Calculate Sum and display in Footer Row
                decimal total = (from s in dc.salesItems
                                 where s.salesOrder.salesDate.Date == dt.Date
                                 select s.totalPrice).Sum();
                int qty = (from s in dc.salesItems
                           where s.salesOrder.salesDate.Date == dt.Date
                           select s.quantity).Sum();
                GridView1.FooterRow.Cells[3].Text = "Grand Total";
                GridView1.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
                GridView1.FooterRow.Cells[4].Text = qty.ToString();
                GridView1.FooterRow.Cells[5].Text = total.ToString("N2");

                GridView1.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            }
            catch(Exception ex)
            {

            }
            
        }
    }
}