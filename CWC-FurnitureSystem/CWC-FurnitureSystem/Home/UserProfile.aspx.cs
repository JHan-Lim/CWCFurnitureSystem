using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Home
{
    public partial class UserProfile : System.Web.UI.Page
    {
        
        MembershipUser users1;

        protected void Page_Load(object sender, EventArgs e)
        {
           
            users1 = Membership.GetUser(User.Identity.Name);

       

            if (Membership.GetUser() != null)
            {
                String userName = Membership.GetUser().ToString();
                String uEmail = Membership.GetUser().Email.ToString();
                lblWelcome.Text = userName;
                lblName.Text = userName;
                lblEmail.Text = uEmail;


            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {



        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            ChangePassword1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            try
            {

                String email = txtemail.Text;
                users1.Email = email;

                Membership.UpdateUser(users1);
                lblEmail.Text = txtemail.Text;

                string display = "Successful Change";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            catch (Exception ep)
            {
                string display = "Please Fill In All The Field !";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }



        }
    }
}