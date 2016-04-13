using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem
{
    public partial class CWC : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Roles.IsUserInRole("customer"))
            {
                TreeView1.DataSource = SiteMapDataSourceCustomer;
                TreeView1.DataBind();
                SiteMapPath1.DataBind();
            }
            else if(Roles.IsUserInRole("manager"))
            {
                TreeView1.DataSource = SiteMapDataSourceManager;
                TreeView1.DataBind();
                SiteMapPath1.DataBind();
            }
            else if (Roles.IsUserInRole("cashier"))
            {
                TreeView1.DataSource = SiteMapDataSourceCashier;
                TreeView1.DataBind();
                SiteMapPath1.DataBind();
            }
            else if (Roles.IsUserInRole("supervisor"))
            {
                TreeView1.DataSource = SiteMapDataSourceSupervisor;
                TreeView1.DataBind();
                SiteMapPath1.DataBind();
            }

            try { 

                int count = TreeView1.Nodes[0].ChildNodes.Count;
                for(int i=0;i< count; i++)
                {
                    TreeView1.Nodes[0].ChildNodes[i].CollapseAll();
                }
            }
            catch (Exception ex)
            {

            }
        }

        
    }
}