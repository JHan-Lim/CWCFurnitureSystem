using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace CWC_FurnitureSystem.Delivery
{
    public partial class Delivery : System.Web.UI.Page
         
    {

       

        static DataClasses1DataContext db = new DataClasses1DataContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindDriver();
                generateGrid();
            }
        }

        void bindDriver()
        {
            //bind driver dropdownlist behind code easier than using linqdatasource
            //and for driver, using username as primary key.
            ddlDriver.DataSource = Roles.GetUsersInRole("driver");
            ddlDriver.DataBind();



        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            searchDelivery();
        }

        protected void searchDelivery()
        {
            try {
                String value = txtDeliveryID.Text.ToString();
                String next = convertStrToId(value);
                int realValue = Int32.Parse(next);

                GridView1.DataSource = from p in db.deliveries
                                       where p.deliveryId == realValue
                                       select new { p.deliveryId, p.description, p.deliveryAddress, p.deliveryStatus, p.salesId };
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No Valid Search.')"+ ex.ToString(), true);
                generateGrid();
            }
        }

        protected void generateGrid()
        {
            GridView1.DataSource = from p in db.deliveries
                                   where p.deliveryStatus == "pending"
                                   select new { p.deliveryId, p.description, p.deliveryAddress, p.deliveryStatus, p.salesId };

            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;

            if (txtDeliveryID.Text.Length <= 0)
                generateGrid();
            else
            {
                searchDelivery();
            }
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
            String did = row.Cells[1].Text;
            Session["name"] = did;

        }


        public static string convertIdToStr(String head, String no)
        {
            string idStr = no.PadLeft(4, '0');
            idStr = head + idStr;
            return idStr;
        }
        public static String convertStrToId(String id)
        {
            string idStr = id.Substring(1);
            idStr = int.Parse(idStr).ToString();
            return idStr;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
           
            string schedule = Calendar1.SelectedDate.ToShortDateString() + " " + ddlTime.SelectedValue.ToString();
            DateTime thedate = DateTime.Parse(schedule);
            try {
                if (getT(thedate) == true)
                {
                    String didd = (string)(Session["name"]);
                    string diddd = convertStrToId(didd);

                    int did = Int32.Parse(diddd);
                    String driver = ddlDriver.Text;
                    String fakeDriver = Membership.GetUser(driver).ProviderUserKey.ToString();
                    Guid realDriver = Guid.Parse(fakeDriver);
                    deliverySchedule ds = new deliverySchedule { deliveryDate = thedate, driverId = realDriver, deliveryId = did };
                    db.deliverySchedules.InsertOnSubmit(ds);
                    db.SubmitChanges();

                    delivery del = (from d in db.deliveries
                                    where d.deliveryId == did
                                    select d).Single();

                    del.deliveryStatus = "completed";
                    db.SubmitChanges();
                    String dialog = "Delivery Successfully Added !";
                    Session["take2"] = dialog;
                    Response.Redirect("DeliveryHome.aspx");
                }
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Delivery Failure.')" + ex.Message, true);
            }



        }

        public Boolean getT(DateTime date)
        {

            var query = from g in db.deliverySchedules
                        select g.driverId;

            for (int i = 0; i < query.Count(); i++)
            {

                var query1 = from g in db.deliverySchedules
                            select g.deliveryDate;

                if (query1.Equals(date))
                    return false;
                else
                    return true;
               
            }

            return true;

        }
    }



}