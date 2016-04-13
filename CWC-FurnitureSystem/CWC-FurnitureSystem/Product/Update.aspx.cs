using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Product
{
    public partial class Update : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
 

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void search_Click(object sender, EventArgs e)
        {
           
            

            String value = DropDownList1.SelectedValue.ToString();
            int realValue = Int32.Parse(value);
            String name = "";
            String qty = "";
            String sprice = "";
            String pprice = "";
            String cat = "";
            String war = "";
            String infront = "";

            if (realValue > 9)
                infront = "00";
            else if (realValue > 99)
                infront = "0";
            else if (realValue < 9)
                infront = "000";
            else
                infront = "";


            
            var query =
                    from pro in db.products
                    where pro.productId == realValue
                    select pro;


            foreach (var prod in query)
            {
                name = prod.productName.ToString();
                qty = prod.qtyOnHand.ToString();
                sprice = prod.sellingPrice.ToString();
                pprice = prod.purchasePrice.ToString();
                cat = prod.category.ToString();
                war = prod.warranty.ToString();
            }

            Pnametxt.Text = name;
            Pqtytxt.Text = qty;
            Psellingtxt.Text = sprice;
            Ppurchasetxt.Text = pprice;
            Pcattxt.Text = cat;
            Pwarranty.Text = war;
           

            Pnametxt.ReadOnly = true;
            Pqtytxt.ReadOnly = true;
            Psellingtxt.ReadOnly = true;
            Ppurchasetxt.ReadOnly = true;
            Pcattxt.ReadOnly = true;
            Pwarranty.ReadOnly = true;

            Pnametxt.Enabled = false;
            Pqtytxt.Enabled = false;
            Psellingtxt.Enabled = false;
            Ppurchasetxt.Enabled = false;
            Pcattxt.Enabled = false;
            Pwarranty.Enabled = false;

        }

        protected void AddSubmit1_Click(object sender, EventArgs e)
        {

            try { 
            String value = DropDownList1.SelectedValue.ToString();
           

            int realValue = Int32.Parse(value);
            var query =
                    from pro in db.products
                    where pro.productId == realValue
                    select pro;
            String productName = Pnametxt.Text.ToString();
            String quantity = Pqtytxt.Text.ToString();
            int qty = Int32.Parse(quantity);
            String purchasePrice = Ppurchasetxt.Text.ToString();
            decimal purPrice = Convert.ToDecimal(purchasePrice);
            String sellingPrice = Psellingtxt.Text.ToString();
            decimal selPrice = Convert.ToDecimal(sellingPrice);
            String cat = Pcattxt.Text.ToString();
            String warranty = Pwarranty.Text.ToString();
            int war = Int32.Parse(warranty);
           


            foreach (var prod in query)
            {
                prod.productId = prod.productId;
                prod.url = prod.url;
                prod.productStatus = prod.productStatus;
                prod.description = prod.description;
                prod.productName = productName;
                prod.qtyOnHand = qty;
                prod.purchasePrice = purPrice;
                prod.sellingPrice = selPrice;
                prod.category = cat;
                prod.warranty = war;

            }

            db.SubmitChanges();
            string display = "Update Successful";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                Pnametxt.Text = "";
                Pqtytxt.Text = "";
                Psellingtxt.Text = "";
                Ppurchasetxt.Text = "";
                Pcattxt.Text = "";
                Pcattxt.Text = "";
                Pwarranty.Text = "";

            Pnametxt.ReadOnly = true;
            Pqtytxt.ReadOnly = true;
            Psellingtxt.ReadOnly = true;
            Ppurchasetxt.ReadOnly = true;
            Pcattxt.ReadOnly = true;
            Pwarranty.ReadOnly = true;

            Pnametxt.Enabled = false;
            Pqtytxt.Enabled = false;
            Psellingtxt.Enabled = false;
            Ppurchasetxt.Enabled = false;
            Pcattxt.Enabled = false;
            Pwarranty.Enabled = false;

            }catch(Exception ex)
            {
                String errorDisplay = "Please Fill In All The Field !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + errorDisplay + "');", true);
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            Pnametxt.ReadOnly = false;
            Pqtytxt.ReadOnly = false;
            Psellingtxt.ReadOnly = false;
            Ppurchasetxt.ReadOnly = false;
            Pcattxt.ReadOnly = false;
            Pwarranty.ReadOnly = false;


            Pnametxt.Enabled = true;
            Pqtytxt.Enabled = true;
            Psellingtxt.Enabled = true;
            Ppurchasetxt.Enabled = true;
            Pcattxt.Enabled = true;
            Pwarranty.Enabled = true;


            AddSubmit1.Visible = true;
           


        }
    }
}