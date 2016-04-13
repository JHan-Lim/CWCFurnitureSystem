using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class FeedbackStaff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Id"] = GridView1.SelectedRow.Cells[1].Text;
            Session["Date"] = GridView1.SelectedRow.Cells[2].Text;
            Session["Content"] = GridView1.SelectedRow.Cells[3].Text;
            Session["Status"] = GridView1.SelectedRow.Cells[4].Text;
            Response.Redirect("Reply.aspx");
        }
    }
}