using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections.Generic;

namespace CWC_FurnitureSystem.Product
{
    public partial class Add : System.Web.UI.Page
    {
        static DataClasses1DataContext db = new DataClasses1DataContext();
        String filePathTo = "";

        protected void Page_Load(object sender, EventArgs e)
        {

           
            if(Session["addImgUrl"] != null)
            {

                Pnametxt.Enabled = true;
                Pqtytxt.Enabled = true;
                Ppurchasetxt.Enabled = true;
                Psellingtxt.Enabled = true;
                Pcattxt.Enabled = true;
                Pwarranty.Enabled = true;
                Pdesc.Enabled = true;
                List<ListItem> files = new List<ListItem>();
                files.Add(new ListItem("asd",Session["addImgUrl"].ToString()));
                filePathTo = Session["addImgUrl"].ToString();


                GridView1.DataSource = files;
                GridView1.DataBind();


            }


        }

        protected void Upload(object sender, EventArgs e)
        {
           
            if (FileUpload1.HasFile)
            {

                

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Product/images/") + fileName);
                Session["addImgUrl"] = "~/Product/images/" + fileName;
                Response.Redirect(Request.Url.AbsoluteUri);

                
            }

            else
            {
                string display = "Please Choose A Photo To Upload";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            
        }


        protected void AddSubmit1_Click(object sender, EventArgs e)
        {

            try { 
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
            String desc = Pdesc.Text.ToString();   
            

            product newProduct = new product { productName = productName, qtyOnHand = qty, purchasePrice = purPrice, sellingPrice = selPrice, category = cat, warranty = war, description = desc, productStatus = "available", url = filePathTo };
            db.products.InsertOnSubmit(newProduct);
            db.SubmitChanges();
                string display = "Add Successful";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            catch(Exception)
            {
                string display = "Please Fill In All The Field";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }

        }

     
    }


}