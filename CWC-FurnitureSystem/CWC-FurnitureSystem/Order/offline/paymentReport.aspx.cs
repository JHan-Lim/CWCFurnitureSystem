using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Order.offline
{
    public partial class paymentReport : System.Web.UI.Page
    {
        DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = DateTime.Now.ToShortDateString();
            lblCust.Text = Membership.GetUser().UserName;
        }

        struct payment
        {
            public int paymentId { get; set; }
            public DateTime paymentDate { get; set; }
            public string paymentType { get; set; }
            public string customer { get; set; }
            public decimal paymentAmount { get; set; }
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            string date1 = txtFrom.Text;
            if(date1.Length > 0)
            {
                DateTime dt = Convert.ToDateTime(date1);
                date.Text = dt.ToString("MMMM") + " " + dt.Year;

                var query = from p in dc.payments
                            where p.paymentDate.Month == dt.Month
                            where p.paymentDate.Year == dt.Year
                            select new { p.paymentId, p.paymentDate, p.paymentType, p.salesOrder.customer, p.paymentAmount };
                List<payment> pay = new List<payment>();
                foreach (var type in query)
                {
                    payment pa = new payment();
                    pa.paymentId = type.paymentId;
                    pa.paymentDate = type.paymentDate;
                    pa.paymentType = type.paymentType;
                    pa.paymentAmount = type.paymentAmount;
                    pa.customer = Membership.GetUser(type.customer).UserName;
                    pay.Add(pa);

                }

                GridView1.DataSource = pay;
                GridView1.DataBind();

                try
                {
                    decimal total = (from p in dc.payments
                                     where p.paymentDate.Month == dt.Month
                                     where p.paymentDate.Year == dt.Year
                                     select p.paymentAmount).Sum();

                    GridView1.FooterRow.Cells[4].Text = "Grand Total";
                    GridView1.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
                    GridView1.FooterRow.Cells[5].Text = total.ToString("N2");
                    GridView1.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
                }
                catch
                {

                }
            }
        }
    }
}