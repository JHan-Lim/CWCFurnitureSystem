using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.Data.Linq;

namespace CWC_FurnitureSystem.Order.offline
{
    public partial class addOrderOffline : System.Web.UI.Page
    {

        DataClasses1DataContext dc = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindCustomer();
                lblDate.Text = DateTime.Now.ToShortDateString();
                setInitialGridView();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            ddlProductID.DataSource = from p in dc.products where p.productStatus == "available"
                                      where p.qtyOnHand > 0
                                      select p.productId;
            //ddlProductID.DataTextField = "C" + "productId";
            //ddlProductID.DataValueField = "productId";
            ddlProductID.DataBind();
            bindQty();
            bindDetails();
            mp1.Show();
        }

        protected void ddlProductID_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindQty();
            bindDetails();
            mp1.Show();
        }

        private void bindDetails()
        {
            product pro = (from p in dc.products
                           where p.productId == int.Parse(ddlProductID.Text)
                           select p).Single();
            if (pro != null)
            {
                txtName.Text = pro.productName;
                txtPrice.Text = "RM " + pro.sellingPrice.ToString("0.00");
                txtCategory.Text = pro.category;
                txtWarranty.Text = pro.warranty.ToString();
                price.Value = pro.sellingPrice.ToString("0.00");
                Image2.ImageUrl = pro.url;
            }

        }

        private void bindQty()
        {
            
            int qty = (from p in dc.products
                      where p.productId == int.Parse(ddlProductID.Text)
                      select p.qtyOnHand).First();
            qty = qty - getQtyChoose(ddlProductID.Text);

            List<int> number = new List<int>();
            for(int i=1;i<= qty; i++)
            {
                number.Add(i);
            }

            ddlQty.DataSource = number;
            ddlQty.DataBind();
        }

        private void bindCustomer()
        {
            ddlCust.DataSource = Roles.GetUsersInRole("customer");
            ddlCust.DataBind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (isItemNotEmpty())
            {
                txtTotalAmount.Text = txtTotal.Text;
                txtPaid.Text = txtTotal.Text;
                paidPrice.Value = txtTotal.Text;
                if (!ddlType.Text.Equals("Full Payment"))
                {
                    double paid = (double.Parse(txtTotal.Text) / 2);
                    paidPrice.Value = paid.ToString("0.00");
                    txtPaid.Text = paid.ToString("0.00");
                }
                txtReceived.Text = "";
                txtChange.Text = "";


                ModalPopupExtender1.Show();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select at least one item to purchase')", true);
            }
        }

        protected void btnConfirm1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                addSales();
                addSalesItem();
                updateQty();
                addPayment();
                if(rblDelivery.Text.Equals("Yes"))
                    addDelivery();

                int salesId = (from s in dc.salesOrders select s.salesId).Max();
                Session["id"] = convertIdToStr("S",salesId.ToString());
                Session["customer"] = ddlCust.Text;
                Session["type"] = ddlType.Text;
                Session["staff"] = Membership.GetUser().UserName;
                Session["delivery"] = rblDelivery.Text;
                if (rblDelivery.Text.Equals("Yes"))
                {
                    Session["address"] = TextBox2.Text + ", " + TextBox3.Text + ", " +
                    TextBox4.Text + " " + TextBox1.Text + " " + ddlState.Text;
                }
                else
                {
                    Session["address"] = "None";
                }
                Session["total"] = txtTotal.Text;
                Session["dataTableReport"] = ViewState["CurrentTable"];
                Response.Redirect("~/Order/offline/offlineReceipt.aspx");
            }
        }

        private void addSales()
        {
            salesOrder s = new salesOrder();
            s.salesDate = DateTime.Now;
            s.salesType = "offline";
            s.totalAmount = (decimal)(double.Parse(txtTotalAmount.Text));
            s.salesStatus = "unpaid";
            if (ddlType.Text.Equals("Full Payment"))
                s.salesStatus = "paid";

            s.customer = Guid.Parse(Membership.GetUser(ddlCust.Text).ProviderUserKey.ToString());
            s.staff = Guid.Parse(Membership.GetUser().ProviderUserKey.ToString());

            dc.salesOrders.InsertOnSubmit(s);
            // Submit the change to the database.
            try
            {
                dc.SubmitChanges();
            }catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }

        private void addSalesItem()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();

            if(ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                int count = dt.Rows.Count;

                for(int i = 0; i < count; i++)
                {
                    salesItem si = new salesItem();
                    int proId = int.Parse(convertStrToId(dt.Rows[i][0].ToString()));
                    si.salesId = salesId;
                    si.productId = proId;
                    si.quantity = int.Parse(dt.Rows[i][2].ToString());
                    si.unitPrice = (decimal)(double.Parse(dt.Rows[i][3].ToString()));
                    si.totalPrice = (decimal)(double.Parse(dt.Rows[i][4].ToString()));

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
                        dup.quantity += int.Parse(dt.Rows[i][2].ToString());
                        dup.totalPrice += (decimal)(double.Parse(dt.Rows[i][4].ToString()));
                        
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);

                    }

                }


            }

        }

        private void updateQty()
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                int count = dt.Rows.Count;

                for (int i = 0; i < count; i++)
                {
                    int id = int.Parse(convertStrToId(dt.Rows[i][0].ToString()));
                    int qty = int.Parse(dt.Rows[i][2].ToString());

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
        }

        private void addPayment()
        {
            int salesId = (from s in dc.salesOrders select s.salesId).Max();
            payment pay = new payment();
            pay.paymentType = "installment";
            if (ddlType.Text.Equals("Full Payment"))
                pay.paymentType = "full";
            pay.paymentMethod = "cash";
            pay.paymentAmount = (decimal)double.Parse(txtPaid.Text);
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
            del.deliveryAddress = TextBox2.Text + ", " + TextBox3.Text + ", " + 
                TextBox4.Text + " " + TextBox1.Text + " " + ddlState.Text;
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

        private Boolean isItemNotEmpty()
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                if (dtCurrentTable.Rows.Count > 0)
                    return true;
            }

            return false;
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            double num1;
            if (double.TryParse(ddlQty.Text,out num1))
            {

                String productId = ddlProductID.Text;
                String productName = txtName.Text;
                String qty = ddlQty.Text;
                String unitPrice = price.Value;
                String amount = (double.Parse(qty) * double.Parse(price.Value)).ToString("0.00");

                if (ViewState["CurrentTable"] != null)
                {
                    DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                    DataRow drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["Product ID"] = convertIdToStr("P", productId);
                    drCurrentRow["Product Name"] = productName;
                    drCurrentRow["Quantity"] = qty;
                    drCurrentRow["Unit Price(RM)"] = unitPrice;
                    drCurrentRow["Amount(RM)"] = amount;
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    ViewState["CurrentTable"] = dtCurrentTable;

                    GridView1.DataSource = dtCurrentTable;
                    GridView1.DataBind();

                    txtTotal.Text = calculateTotal(dtCurrentTable).ToString("0.00");
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int index = GridView1.SelectedIndex;
            if(index != -1) {
                if(ViewState["CurrentTable"] != null)
                {
                    DataTable dt = (DataTable)ViewState["CurrentTable"];
                    dt.Rows[index].Delete();

                    ViewState["CurrentTable"] = dt;

                    GridView1.DataSource = dt;
                    GridView1.DataBind();

                    calculateTotal(dt);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select an item to delete')", true);

            }


        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = (DataTable)ViewState["CurrentTable"];
            GridView1.DataBind();
        }

        private void setInitialGridView()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("Product ID", typeof(string)));
            dt.Columns.Add(new DataColumn("Product Name", typeof(string)));
            dt.Columns.Add(new DataColumn("Quantity", typeof(string)));
            dt.Columns.Add(new DataColumn("Unit Price(RM)", typeof(string)));
            dt.Columns.Add(new DataColumn("Amount(RM)", typeof(string)));
            

            ViewState["CurrentTable"] = dt;

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private int getQtyChoose(String productId)
        {
            if (ViewState["CurrentTable"] != null)
            {
                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                int rowCount = dtCurrentTable.Rows.Count;
                int qty = 0;
                for(int i = 0; i < rowCount; i++)
                {
                    string id = dtCurrentTable.Rows[i][0].ToString();
                    id = convertStrToId(id);
                    if (id.Equals(productId)){
                        int quantity = int.Parse(dtCurrentTable.Rows[i][2].ToString());
                        qty += quantity;
                    }
                }

                return qty;
            }

            return 0;
        }

        private double calculateTotal(DataTable dt)
        {
            int rowCount = dt.Rows.Count;
            double total = 0.0;
            for (int i = 0; i < rowCount; i++)
            {
                double num1;
                if (double.TryParse(dt.Rows[i][4].ToString(), out num1))
                {
                    double amount = double.Parse(dt.Rows[i][4].ToString());
                    total += amount;
                }
            }

            return total;
            
        }

        public static string convertIdToStr(String head,String no)
        {
            string idStr = no.PadLeft(4, '0');
            idStr = head + idStr;
            return idStr;
        }

        public static String convertStrToId(String id)
        {
            string idStr = id.Substring(1);
            idStr = int.Parse(idStr).ToString();

            return idStr;
        }

        
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rblDelivery.Text.Equals("Yes"))
            {
                if (TextBox2.Text.Length <= 0)
                {
                    args.IsValid = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Address1 cannot be empty')", true);
                }
                else
                    args.IsValid = true;
            }
            else
            { 
                args.IsValid = true;
            }
            ModalPopupExtender1.Show();
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rblDelivery.Text.Equals("Yes"))
            {
                if (TextBox1.Text.Length <= 0)
                {
                    args.IsValid = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('City cannot be empty')", true);
                }
                else
                    args.IsValid = true;
            }
            else
            {
                args.IsValid = true;
            }
            ModalPopupExtender1.Show();
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (rblDelivery.Text.Equals("Yes"))
            {
                if (TextBox4.Text.Length <= 0)
                {
                    args.IsValid = false;
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Postal Code cannot be empty')", true);
                }
                else
                {
                    int num1;
                    if(TextBox4.Text.Length == 5 && int.TryParse(TextBox4.Text,out num1))
                    {
                        args.IsValid = true;
                    }
                    else
                    {
                        args.IsValid = false;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Postal Code must be 5 digit')", true);

                    }
                }
                    
            }
            else
            {
                args.IsValid = true;
            }
            ModalPopupExtender1.Show();

        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if(txtReceived.Text.Length > 0)
            {
                double change = double.Parse(txtReceived.Text) - double.Parse(txtPaid.Text);
                txtChange.Text = change.ToString("0.00");
            }
            ModalPopupExtender1.Show();
        }

    }
}