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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string guest = "Login";
            if (Session["UserID"] != null)
            {
                string getUserID = Session["UserID"].ToString();

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string checkuser = "select userName from [User] where userID ='" + getUserID + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                com.Parameters.AddWithValue("@UserID", getUserID);
                string userName = com.ExecuteScalar()?.ToString();

                NavUserName.Text = userName;
                LogoutBtn.Visible = true;
            }
            else
            {
                NavUserName.Text = guest;
                LogoutBtn.Visible = false;
            }

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("Home.aspx");

        }

        protected void Login_Click(object sender, EventArgs e)
        {

            if (Session["UserID"] != null)
            {
                Response.Redirect("UserProfile.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}