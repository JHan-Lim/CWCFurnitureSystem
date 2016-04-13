using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Delivery
{
    public partial class DeliveryHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["take2"] != null)
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Feedback Submitted!')", true);
            Session["take2"] = null;
        }
    }
}