using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CWC_FurnitureSystem.Order.offline
{
    public partial class offlineReceipt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    lblId.Text = Session["id"].ToString();
                    lblDate.Text = DateTime.Now.ToShortDateString();
                    lblCust.Text = Session["customer"].ToString();
                    lblType.Text = Session["type"].ToString();
                    lblStaff.Text = Session["staff"].ToString();
                    lblDelivery.Text = Session["delivery"].ToString();
                    lblAddr.Text = Session["address"].ToString();
                    lblTotal.Text = Session["total"].ToString();
                    DataTable dt = Session["dataTableReport"] as DataTable;
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sales Order is created successfully.<br/>Press 'Print Receipt' button to print this receipt')", true);
                }
                catch(Exception ex)
                {

                }

            }
        }
    }
}