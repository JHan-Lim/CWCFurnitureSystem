using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Product
{
    public partial class Delete : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {
            String value = DropDownList1.SelectedValue.ToString();
            String name = "";
            String qty = "";
            String sprice = "";
            String pprice = "";
            String cat = "";
            String war = "";
            String infront = "000";

            int realValue = Int32.Parse(value);
            var query =
                    from pro in db.products
                    where pro.productId == realValue
                    select pro;


            foreach (var prod in query)
            {
                name = prod.productName;
                qty = prod.qtyOnHand.ToString();
                sprice = prod.sellingPrice.ToString();
                pprice = prod.purchasePrice.ToString();
                cat = prod.category;
                war = prod.warranty.ToString();
            }

            if (realValue > 9)
                infront = "00";
            else if (realValue > 99)
                infront = "0";
            else if (realValue < 9)
                infront = "000";
            else
                infront = "";


            txtID.Text = "P" + infront + realValue;
            Pnametxt.Text = name;
            Pqtytxt.Text = qty;
            Psellingtxt.Text = sprice;
            Ppurchasetxt.Text = pprice;
            Pcattxt.Text = cat;
            Pwarranty.Text = war;
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
                prod.productStatus = "unavailable";
                prod.description = prod.description;
                prod.productName = productName;
                prod.qtyOnHand = qty;
                prod.purchasePrice = purPrice;
                prod.sellingPrice = selPrice;
                prod.category = cat;
                prod.warranty = war;

            }

            

            db.SubmitChanges();
                string display = "Delete Successful";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                txtID.Text = "";
            Pnametxt.Text = "";
            Pqtytxt.Text = "";
            Psellingtxt.Text = "";
            Ppurchasetxt.Text = "";
            Pcattxt.Text = "";
            Pwarranty.Text = "";
            }catch(Exception ex)
            {
                
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(ex);
                sb.Append("')};");
                sb.Append("</script>");
            }
            
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}