using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Web.Security;

namespace CWC_FurnitureSystem.Feedback
{
    public partial class Reply : System.Web.UI.Page
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("FeedbackId");
                dt.Columns.Add("FeedbackDate");
                dt.Columns.Add("FeedbackContent");
                dt.Columns.Add("FeedbackStatus");

                var row = dt.NewRow();
                row["FeedbackId"] = (String)Session["Id"];
                row["FeedbackDate"] = (String)Session["Date"];
                row["FeedbackContent"] = (String)Session["Content"];
                row["FeedbackStatus"] = (String)Session["Status"];

                dt.Rows.Add(row);

                 DetailsView1.DataSource = dt;
                 DetailsView1.DataBind();

            }
        }

        protected void btnReply_Click(object sender, EventArgs e)
        {
            SmtpClient smtp = new SmtpClient();
            MailMessage mail = new MailMessage();
            try {
                String qihang = DetailsView1.Rows[0].Cells[1].Text;
                int id1 = int.Parse(Session["Id"].ToString());

                Guid q = (from f in db.feedbacks where f.feedbackId == id1
                         select f.customer).Single();

                string to = Membership.GetUser(q).Email;

                mail.From = new MailAddress("cwcfurnituresystem@gmail.com");
                mail.To.Add(to);
                mail.Subject = "Reply on Feedback from CWC Furniture";
                mail.Body = txtFeedback.Text;
                mail.IsBodyHtml = true;

                System.Net.NetworkCredential networkCred = new System.Net.NetworkCredential();
                networkCred.UserName = "cwcfurnituresystem@gmail.com";
                networkCred.Password = "cwcfurniture";

                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCred;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;

                smtp.Send(mail);
                String id = (String)Session["Id"];
                int fid = Int32.Parse(id);
                String content = Request.Form["txtFeedback"];
                String member = Membership.GetUser().ProviderUserKey.ToString();
                Guid cust = Guid.Parse(member);

                var query = from f in db.feedbacks
                            where f.feedbackId == fid
                            select f;

                foreach(feedback f in query)
                {

                    f.feedbackId = f.feedbackId;
                    f.feedbackDate = f.feedbackDate;
                    f.feedbackContent = f.feedbackContent;
                    f.feedbackStatus = "replied";
                    f.replyContent = content;
                    f.manager = cust;
                    db.SubmitChanges();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Email Sent Successfully.')", true);
                }


               

                
            }
            catch(Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Send Email Failed')" + ex.Message, true);
            }

            //try
            //{
            //    MailAddress fromAddress = new MailAddress();

            //    //you can specify the host name or ipadaddress of your server
            //    //Default in IIS will be localhost
            //    smtpClient.Host = "localhost";

            //    //Default port will be 25
            //    smtpClient.Port = 25;

            //    //from address will be given as a MailAddress Object
            //    message.From = new MailAddress("chanbaojoe@gmail.com");

            //    //To address collection of MailAddress
            //    message.To.Add("chanbaojoe@hotmail.com");

            //    //body can be Html or text format
            //    //specify true if it is html message
            //    message.IsBodyHtml = true;

            //    //Message subject
            //    message.Subject = "Reply from CWC Furniture";
            //    //Message body content
            //    message.Body = txtFeedback.Text;

            //    //Send SMTP mail
            //    smtpClient.Send(message);

            //    lblReply.Text = "Email Sent Successfully!";

            //}
            //catch (Exception ex)
            //{
            //    
            //}
        }

        protected void txtFeedback_TextChanged(object sender, EventArgs e)
        {

        }
    }
}