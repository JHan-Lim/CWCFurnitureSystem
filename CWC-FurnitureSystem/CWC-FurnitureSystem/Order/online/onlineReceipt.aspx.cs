using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Net;
using System.IO;
using System.Web.Security;
using System.Data.Linq;

namespace CWC_FurnitureSystem.Order.online
{
    public partial class onlineReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                postToPayPal();
            }
        }

        DataClasses1DataContext dc = new DataClasses1DataContext();
        Dictionary<string, string> results = new Dictionary<string, string>();
        void postToPayPal()
        {
            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues("https://www.sandbox.paypal.com/cgi-bin/webscr", new NameValueCollection()
                {
                   { "cmd", "_notify-synch" },
                   { "tx", Request.QueryString["tx"]},
                   { "at", "uZeKNRlAHkSIxPKg3Yvy-sGOknpNP3Nl_d7ujrqqT2ypAzllie4DWwv_-BC" }
                });

                string strResponse = System.Text.Encoding.UTF8.GetString(response);

                lblAddr.Text = strResponse;
                
                if (strResponse != "")
                {
                    StringReader reader = new StringReader(strResponse);
                    string line = reader.ReadLine();

                    if (line == "SUCCESS")
                    {

                        while ((line = reader.ReadLine()) != null)
                        {
                            results.Add(line.Split('=')[0], line.Split('=')[1]);

                        }

                        Boolean duplicate = false;
                        if (Session["auth_id"] != null)
                        {
                            if(Session["auth_id"].ToString().Equals(Request.QueryString["tx"]))
                                duplicate = true;
                        }
                        else
                        {
                            Session["auth_id"] = Request.QueryString["tx"];
                        }

                        if(!duplicate)
                            updateDatabase();

                        bindDetails();
                    }
                    else if (line == "FAIL")
                    {
                        // Log for manual investigation
                        Response.Write("<html><body><h1>Unable to retrive transaction detail</h1></body></html>");
                    }
                }
                else
                {
                    //unknown error
                    Response.Write("<body><h1>ERROR. Please contact our customer support</h1></body>");
                }
            }
        }

        void updateDatabase()
        {
            addSales();
            addSalesItem();
            updateQty();
            addPayment();
            addDelivery();
        }

        private void addSales()
        {
            salesOrder s = new salesOrder();
            s.salesDate = DateTime.Now;
            s.salesType = "online";
            s.totalAmount = (decimal)(double.Parse(results["mc_gross"])) * 2;
            s.salesStatus = "unpaid";
            
            s.customer = Guid.Parse(Membership.GetUser().ProviderUserKey.ToString());
            s.staff = null;

            dc.salesOrders.InsertOnSubmit(s);
            // Submit the change to the database.
            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private void addSalesItem()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            int numItem = int.Parse(results["num_cart_items"]);

            for (int i = 0; i < numItem; i++)
            {
                    salesItem si = new salesItem();
                    int key = i + 1;
                    int proId = int.Parse(results["item_number" + key]);
                    product pro = (from p in dc.products
                              where p.productId == proId
                              select p).Single();
                    si.salesId = salesId;
                    si.productId = proId;
                    si.quantity = int.Parse(results["quantity" + key]);
                    si.unitPrice = pro.sellingPrice;
                    si.totalPrice = pro.sellingPrice * si.quantity;

                    dc.salesItems.InsertOnSubmit(si);

                    try
                    {
                        dc.SubmitChanges();
                    }
                    catch (DuplicateKeyException ex)
                    {
                        dc = new DataClasses1DataContext();
                        salesItem dup = (from sa in dc.salesItems
                                         where sa.salesId == salesId
                                         where sa.productId == proId
                                         select sa).Single();
                        dup.quantity += si.quantity;
                        dup.totalPrice += si.totalPrice;

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);

                    }

                }


            }

        private void updateQty()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            int numItem = int.Parse(results["num_cart_items"]);

            for (int i = 0; i < numItem; i++)
            {
                int key = i + 1;
                int id = int.Parse(results["item_number" + key]);
                int qty = int.Parse(results["quantity" + key]);

                var query =
                        from p in dc.products
                        where p.productId == id
                        select p;

                    foreach (product p in query)
                    {
                        p.qtyOnHand -= qty;
                    }

                    try
                    {
                        dc.SubmitChanges();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);
                    }

                }
        }

        private void addPayment()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            payment pay = new payment();
            pay.paymentType = "installment";
            pay.paymentMethod = "credit";
            pay.paymentAmount = (decimal)(double.Parse(results["mc_gross"]));
            pay.paymentDate = DateTime.Now;
            pay.salesId = salesId;

            dc.payments.InsertOnSubmit(pay);

            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private void addDelivery()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            delivery del = new delivery();
            del.description = "";
            del.deliveryAddress = results["address_street"] + ", " + results["address_zip"] + " " +
                results["address_city"] + " " + results["address_state"];
            del.deliveryAddress = del.deliveryAddress.Replace('+',' ');
            del.deliveryAddress = del.deliveryAddress.Replace("%2C",",");
            del.deliveryStatus = "pending";
            del.salesId = salesId;

            dc.deliveries.InsertOnSubmit(del);
            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private void bindDetails()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            salesOrder so = (from s in dc.salesOrders where s.salesId == salesId select s).Single();

            lblId.Text = convertIdToStr("S",salesId.ToString());
            lblDate.Text = so.salesDate.ToShortDateString();
            lblCust.Text = Membership.GetUser().UserName;
            lblType.Text = "Installment Payment";
            lblDelivery.Text = "Yes";
            lblAddr.Text = (from d in dc.deliveries
                            where d.salesId == salesId
                            select d.deliveryAddress).Single();
            lblTotal.Text = so.totalAmount.ToString("0.00");
            lblPaid.Text = (so.totalAmount / 2).ToString("0.00");
            lblUnpaid.Text = (so.totalAmount / 2).ToString("0.00");

            GridView1.DataSource = from s in dc.salesItems where s.salesId == salesId
                                   select new { s.productId, s.product.productName, s.quantity,
                                   s.unitPrice, s.totalPrice };
            GridView1.DataBind();
        }

        public static string convertIdToStr(String head, String no)
        {
            string idStr = no.PadLeft(4, '0');
            idStr = head + idStr;
            return idStr;
        }

    }

    }