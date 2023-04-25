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
    public partial class verifyOtp : System.Web.UI.Page
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString);
        SqlCommand cmd = new SqlCommand();

        SqlDataReader dr;
        string qry;
        string qry1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signin_Click(object sender, EventArgs e)
        {
            cn.Open();
            string str = Session["email"].ToString();
            qry = "select * from user_mstr where email='" + str + "'";
            cmd = new SqlCommand(qry, cn);
            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();
                int otp = (int)dr["otp"];
                int chkotp = Convert.ToInt32(txtuname.Text);
                dr.Close();

                if (otp == chkotp)
                {
                    qry1 = "update user_mstr set verify=1 where email='" + str + "'";
                    cmd = new SqlCommand(qry1, cn);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("~/User/UHome.aspx");
                }
                else
                {
                    Response.Redirect("~/User/user_signin.aspx");
                }

            }
            else
            {

            }
        }
    }
}