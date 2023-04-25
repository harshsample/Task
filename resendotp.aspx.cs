using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_otobit
{
    public partial class resendotp : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string qry;
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.Open();
            qry = "select otp from user_mstr where email='" + Session["email"] + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)

            {
                dr.Read();

                MailMessage mail = new MailMessage();
                string mailid = (string)Session["email"];
                mail.To.Add(mailid);
                mail.From = new MailAddress("ranaharsh020@gmail.com");
                mail.Subject = "Your OTP";
                string Body = " your otp is" + dr["otp"];
                mail.Body = Body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();

                smtp.Host = "smtp.gmail.com";
                smtp.Credentials = new System.Net.NetworkCredential("ranaharsh020@gmail.com", "tapaqztbkrulxnzn");
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);
                Response.Redirect("verifyotp.aspx");
            }


            cn.Close();
        }
    }
}