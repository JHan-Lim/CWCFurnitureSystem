using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Cryptography;
using System.Runtime.InteropServices;



namespace CWC_FurnitureSystem.Product
{
    public partial class Return : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        
        private String warAvailable = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            String asd = Membership.GetUser().UserName.ToString();
            lblStaff.Text = asd;

        }



        protected void search_Click(object sender, EventArgs e)
        {

            try { 
                String StringDate = DateTime.Now.ToShortDateString();
                DateTime nowDate = Convert.ToDateTime(StringDate);
                String id = DropDownList2.Text;
                String id1 = DropDownList3.Text;
                int salesID = Int32.Parse(id);
                int productID = Int32.Parse(id1);

                String Pname = "";
                String Pqty = "";
                String price = "";
                String total = "";
                String war = "";
                String date = "";
                String Stringyear = "";
                
                


                
                var query =
                        from s in db.salesItems
                        where s.productId == productID
                        where s.salesId == salesID
                        select s;

                foreach (salesItem s in query)
                {
                    Pname = s.product.productName;
                    war = s.product.warranty.ToString();
                    date = s.salesOrder.salesDate.ToString("dd/MMMM/yyyy");
                    Stringyear = s.salesOrder.salesDate.ToString("yyyy");  
                    Pqty = s.quantity.ToString();
                    price = s.unitPrice.ToString();
                    total = s.unitPrice.ToString();

                }
                DateTime thedate = Convert.ToDateTime(date);

                int year = Int32.Parse(Stringyear);   
                int warranty = Int32.Parse(war);

                if ((nowDate - thedate).TotalDays <= (warranty*365))
                    warAvailable = "available";
                else
                    warAvailable = "unavailable";

                lblname.Text = Pname;
                lblqty.Text = Pqty;
                lbltotal.Text = total;
                lblunit.Text = price;
                lbldate.Text = date;
                lblwar.Text = warAvailable;


            }
            catch (Exception)
            {
                string display = "No Such Data !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }

            {
               
            }
        }

        protected void returnBtn_Click(object sender, EventArgs e)
        {

            String detect = lblwar.Text;
            if (detect == "available")
            {
                try
                {
                    String sid = DropDownList2.Text;
                    String pid = DropDownList3.Text;
                    int salesID1 = Int32.Parse(sid);
                    int productID1 = Int32.Parse(pid);


                    String StringDate = DateTime.Now.ToShortDateString();
                    DateTime nowDate = Convert.ToDateTime(StringDate);
                    String descrip = descArea.Text.ToString();
                    String return1 = warAvailable;
                    String asd = Membership.GetUser().ProviderUserKey.ToString();
                    Guid handle = Guid.Parse(asd);

                    returnInward newReturn = new returnInward
                    {
                        returnDate = nowDate,
                        salesId = salesID1,
                        productId = productID1,
                        description = descrip,
                        returnStatus = "valid",
                        staff = handle
                    };
                    db.returnInwards.InsertOnSubmit(newReturn);
                    db.SubmitChanges();
                    string display = "Return Successful !";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    lblname.Text = "";
                    lblqty.Text = "";
                    lbltotal.Text = "";
                    lblunit.Text = "";
                    lbldate.Text = "";
                    lblwar.Text = "";
                   


                }
                catch (Exception ex)
                {

                    string display = "Please Fill In All The Field !";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);


                }
            }
            else if(detect == "unavailable")
            {
                string display = "This Stock Is Out Of Warranty !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }

        }
    }
}