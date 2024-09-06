using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace CinemaTicketingSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from [User] where userID ='" + LoginID.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string checkPasswordQuery = "Select userPassword from [User] where userID='" + LoginID.Text + "'";
                SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                if (password == LoginPassword.Text)
                {
                    Session["UserID"] = LoginID.Text;
                    Response.Write("Password is correct");
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("Password is incorrect");
                    Label1.Text = "Password is incorrect";
                }
            }
            else
            {
                Response.Write("Username is incorrect");
                Label1.Text = "Username is incorrect";
            }
        }
    }
}