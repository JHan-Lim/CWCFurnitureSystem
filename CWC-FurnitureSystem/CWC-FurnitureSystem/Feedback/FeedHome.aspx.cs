using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class FeedHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["roar"] != null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + Session["roar"] + "');", true);
                Session["roar"] = null;
            }
        }
    }
}