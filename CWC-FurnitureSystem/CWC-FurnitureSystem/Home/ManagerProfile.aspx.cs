using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Home
{
    public partial class ManagerProfile : System.Web.UI.Page
    {
        MembershipCreateStatus result;

        protected void Page_Load(object sender, EventArgs e)
        {
           


            if (Membership.GetUser() != null)
            {
                String userName = Membership.GetUser().ToString();
                lblmanager.Text = userName;
            }
        }
  
        public string GetErrorMessage(MembershipCreateStatus status)
        {
            switch (status)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    return "Username already exists. Please enter a different user name.";

                case MembershipCreateStatus.DuplicateEmail:
                    return "A username for that e-mail address already exists. Please enter a different e-mail address.";

                case MembershipCreateStatus.InvalidPassword:
                    return "The password provided is invalid. Please enter a valid password value.";

                case MembershipCreateStatus.InvalidEmail:
                    return "The e-mail address provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidAnswer:
                    return "The password retrieval answer provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidQuestion:
                    return "The password retrieval question provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.InvalidUserName:
                    return "The user name provided is invalid. Please check the value and try again.";

                case MembershipCreateStatus.ProviderError:
                    return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                case MembershipCreateStatus.UserRejected:
                    return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

                default:
                    return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try { 
            bool isApproved = true;
            String name = txtCname.Text.ToString();
            String psw = txtCpassword.Text.ToString();
            String email = txtCemail.Text.ToString();
            String ques = DropDownList1.Text.ToString();
            String answ = txtCans.Text.ToString();
                String role = DropDownList2.Text;

            MembershipUser newUser = Membership.CreateUser(name, psw, email, ques, answ, isApproved, out result);
                string display = "Staff is created successfully";
                Roles.AddUserToRole(name, role);

                txtCname.Text = "";
                txtCpassword.Text = "";
                txtCemail.Text = "";
                txtCans.Text = "";

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            catch (Exception eg)
            {
               
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + eg + "');", true);
            }
        }
    }


}