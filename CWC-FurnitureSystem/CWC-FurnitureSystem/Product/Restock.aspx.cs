using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Product
{
    public partial class Restock : System.Web.UI.Page
    {

        private String prodID = "";

        DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                generateGrid();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try { 
            searchProduct();
            }catch(Exception ex)
            {
                String display = "Please Fill In The Quantity !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }

        }

        private void searchProduct()
        {
            try { 
            String value = TextBox1.Text.ToString();
            int realValue = Int32.Parse(value);



            GridView1.DataSource = from p in db.products
                                   where p.productStatus == "available"
                                   where p.qtyOnHand <= realValue
                                   select new { p.productId, ProductName = p.productName, Quantity = p.qtyOnHand, SellingPrice = p.purchasePrice, Warranty = p.warranty };
            GridView1.DataBind();
            }
            catch (Exception ep)
            {
                
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ep + "');", true);

            }

        }

        public void generateGrid()
        {
           
           
            GridView1.DataSource = from p in db.products
                                   where p.productStatus == "available"
                                   select new { p.productId, ProductName = p.productName, Quantity = p.qtyOnHand, SellingPrice = p.sellingPrice, Warranty = p.warranty };
            GridView1.DataBind();

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            if(TextBox1.Text.Length <= 0)
                generateGrid();
            else
            {
                searchProduct();
            }
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
            String prodName = row.Cells[2].Text;
            String purPrice = row.Cells[4].Text;
            prodID = row.Cells[1].Text;
            txtPid.Text = prodID;
            txtPname.Text = prodName;
            txtPrice.Text = purPrice;

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String p = DropDownList1.SelectedValue.ToString();
            int sid = Int32.Parse(p);

            var query =
                       from s in db.suppliers
                       where s.supplierId == sid
                       select s;

            foreach (supplier s in query)
            {
                String sname = s.supplierName.ToString();
                txtSname.Text = sname;

            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {


            try {
                if (txtPid != null && txtSname != null)
                {
                    String pid = txtPid.Text.ToString();
                    String stringPid = convertStrToId(pid);
                    String purPrice1 = txtPrice.Text.ToString();
                    decimal purchaseP = Convert.ToDecimal(purPrice1);
                    int productID = Int32.Parse(stringPid);
                    String quantity = txtQty.Text.ToString();
                    int qty = Int32.Parse(quantity);
                    int purid;
                    decimal allTotal = purchaseP * qty;


                    var query =
                         from s in db.products
                         where s.productId == productID
                         select s;

                    foreach (product prod in query)
                    {
                        prod.productId = prod.productId;
                        prod.url = prod.url;
                        prod.productStatus = prod.productStatus;
                        prod.description = prod.description;
                        prod.productName = prod.productName;
                        prod.qtyOnHand = prod.qtyOnHand + qty;
                        prod.purchasePrice = prod.purchasePrice;
                        prod.sellingPrice = prod.sellingPrice;
                        prod.category = prod.category;
                        prod.warranty = prod.warranty;

                    }

                    String StringDate = DateTime.Now.ToShortDateString();
                    DateTime nowDate = Convert.ToDateTime(StringDate);
                    String purPrice = txtPrice.Text.ToString();
                    decimal purchasePrice = Convert.ToDecimal(purPrice);
                    decimal total = qty * purchasePrice;
                    String ss = DropDownList1.SelectedValue.ToString();
                    int sid = Int32.Parse(ss);

                    purchaseOrder newPurchase = new purchaseOrder { purchaseDate = nowDate, totalAmount = total, purchaseStatus = "valid", supplier = sid };
                    db.purchaseOrders.InsertOnSubmit(newPurchase);
                    db.SubmitChanges();

                    var query2 =
                         (from p in db.purchaseOrders
                          select p.purchaseId).Max();



                    purchaseItem newItem = new purchaseItem { purchaseId = query2, productId = productID, quantity = qty, unitPurchasePrice = purchaseP, totalPurchasePrice = allTotal };
                    db.purchaseItems.InsertOnSubmit(newItem);
                    db.SubmitChanges();

                    string display = "Restock Successful !";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);



                }
            }
            catch (Exception)
            {

                string display = "Please Select Product Or Supplier First !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

            }
        }

        public static string convertIdToStr(String head, String no)
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
    }
}