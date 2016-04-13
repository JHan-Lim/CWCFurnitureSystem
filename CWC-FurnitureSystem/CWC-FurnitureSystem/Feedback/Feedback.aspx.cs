using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Threading;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class Feedback : System.Web.UI.Page
    {
        static DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            String feedback = txtFeedback.Text.ToString();
            String cust = Membership.GetUser().ProviderUserKey.ToString();
            Guid realCust = Guid.Parse(cust);
            feedback newFeedback = new feedback { customer = realCust, feedbackDate = DateTime.Now, feedbackContent = feedback, feedbackStatus = "pending" };
            db.feedbacks.InsertOnSubmit(newFeedback);
            db.SubmitChanges();
            String take = "Feedback Submitted !";
            Session["take"] = take;

            if (Roles.IsUserInRole("customer"))
                Response.Redirect("FeedHome.aspx");
            else
                Response.Redirect("FeedbackHome.aspx");
        }

        protected void txtFeedback_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {

        }
    }
}