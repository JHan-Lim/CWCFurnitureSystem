using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class DeleteFeedback : System.Web.UI.Page
    {

        DataClasses1DataContext db = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search_Click(object sender, EventArgs e)
        {
            String take = DropDownList1.Text;
            int select1 = Int32.Parse(take);
            String content = "";
            DateTime date;
            String reply;
            String status;


            var query =
                 from d in db.feedbacks
                 where d.feedbackId == select1
                 select d;

            foreach (var feed in query)
            {
                content = feed.feedbackContent;
                date = feed.feedbackDate;
                reply = feed.replyContent;
                status = feed.feedbackStatus;

                txtdate.Text = date.ToString();
                Dcontenttxt.Text = content.ToString();
                Dstatustxt.Text = status.ToString();
            }



            

        }

        protected void AddSubmit1_Click(object sender, EventArgs e)
        {

            String take = DropDownList1.Text;
            int select1 = Int32.Parse(take);

            var item = db.feedbacks.Where(feed => feed.feedbackId == select1).Single();
            db.feedbacks.DeleteOnSubmit(item);
            db.SubmitChanges();

            txtdate.Text = "";
            Dcontenttxt.Text = "";
            Dstatustxt.Text = "";

            string display = "Delete Successful";
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

        }
    }
}