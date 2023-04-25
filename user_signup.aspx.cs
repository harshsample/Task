using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Reflection.Emit;
using System.Xml.Linq;

namespace Task_otobit
{
    public partial class user_signup : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        string qry;
        SqlDataReader dr;
        string randomCode;
        string mailid;
        string fname;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            DateTime d1 = DateTime.Now;
            string cdate = d1.ToString();
            string d2 = cdate.Substring(0, 10);



            if (FileUpload1.HasFiles)
            {
                if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/jpg")
                {
                    if (FileUpload1.PostedFile.ContentLength < 50000)
                    {
                        fname = FileUpload1.FileName;
                        FileUpload1.SaveAs(Server.MapPath("~/image/" + fname));
                        Image1.ImageUrl = "~/Admin/image/" + fname;
                        Label2.Text = "File Uploded..";

                    }
                    else
                    {
                        Label2.Text = "File is too Large..";

                    }
                }
                else
                {
                    Label2.Text = "Select Image File...";

                }
            }
            else
            {
                Label2.Text = "Select File ...";
            }


            cn.Open();
            qry = "select * from user_mstr where email='" + txtemail.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Read();
                Label1.Text = "This User is Alredy exists try to Sign Up with another Email ";
            }

            else
            {

                Random rand = new Random();
                randomCode = (rand.Next(999999).ToString());

                MailMessage mail = new MailMessage();


                mailid = txtemail.Text;
                mail.To.Add(mailid);
                mail.From = new MailAddress("ranaharsh020@gmail.com");
                mail.Subject = "Task";
                string Body = "<b>Your OTP is </b>" + randomCode;
                mail.Body = Body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();


                smtp.Host = "smtp.gmail.com";
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("ranaharsh020@gmail.com", "tapaqztbkrulxnzn");
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Send(mail);
                cn.Close();

                cn.Open();
                qry = "insert into user_mstr values('" + txtuname.Text + "','" + txtemail.Text + "','" + txtpass.Text + "','" + randomCode + "','0','" + fname + "','" + d2 + "')";
                cmd = new SqlCommand(qry, cn);
                cmd.ExecuteNonQuery();
                cn.Close();


                Response.Redirect("~/user_signin.aspx");

            }

        }
    }
}