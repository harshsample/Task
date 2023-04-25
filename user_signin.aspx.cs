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
    public partial class user_signin : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        string qry;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void btn_signin1_Click(object sender, EventArgs e)
        {
            cn.Open();

            qry = "select * from user_mstr where email='" + txtemail.Text + "' and pass='" + txtpass.Text + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();


            if (dr.HasRows)
            {
                dr.Read();
                Session["uname"] = dr["uname"];
                Session["email"] = txtemail.Text;
               
                Session["uid"] = dr["uid"];

                int verify = Convert.ToInt32(dr["verify"]);

                if (verify == 0)
                {
                    Response.Redirect("~/verifyOtp.aspx");
                }
                else
                {
                    Response.Redirect("~/UHome.aspx");
                }

            }
            cn.Close();
        }
    }
}