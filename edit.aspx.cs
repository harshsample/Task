using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Task_otobit
{
    public partial class edit : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string qry;
        string fname;
        string uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uid = Request.QueryString.Get("uid");
                ViewState["uid"] = Request.QueryString.Get("uid");
                if (uid != null)
                {
                    btn_updateplace.Visible = true;
                    btn_insertplace.Visible = false;



                    cn.Open();
                    qry = "select * from user_mstr where uid=" + uid;
                    cmd = new SqlCommand(qry, cn);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        dr.Read();

                        txtuname.Text = dr["uname"].ToString();
                        Image1.ImageUrl = "~/image/" + dr["image"].ToString();
                        txtemail.Text = dr["email"].ToString();
                        txtpass.Text = dr["pass"].ToString();
                       
                    }


                }
            }
        }

        protected void btn_updateplace_Click(object sender, EventArgs e)
        {

           
                btn_updateplace.Visible = false;
                btn_insertplace.Visible = true;


                if (FileUpload1.HasFiles)
                {
                    if (FileUpload1.PostedFile.ContentType == "image/jpeg" || FileUpload1.PostedFile.ContentType == "image/png" || FileUpload1.PostedFile.ContentType == "image/jpeg")
                    {
                        //if (FileUpload1.PostedFile.ContentLength < 50000)
                        //{
                            fname = FileUpload1.FileName;
                            FileUpload1.SaveAs(Server.MapPath("~/image/" + fname));
                            Image1.ImageUrl = "~/Admin/image/" + fname;
                            Label2.Text = "File Uploded..";
                            cn.Open();
                            qry = "update user_mstr set uname='" + txtuname.Text + "', email='" + txtemail.Text + "', image='" + fname + "', pass='" + txtpass.Text + "' where uid=" + ViewState["uid"].ToString();
                            cmd = new SqlCommand(qry, cn);
                            cmd.ExecuteNonQuery();

                            cn.Close();
                            Response.Redirect("~/user_profile.aspx");

                        //}
                        //else
                        //{
                        //    Label2.Text = "File is too Large..";

                        //}
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
              
              
               

            
        }
    }
}