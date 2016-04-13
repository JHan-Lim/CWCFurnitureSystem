using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class FeedbackHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["take"]!= null)
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Feedback Submitted!')", true);
            Session["take"] = null;
        }
    }
}