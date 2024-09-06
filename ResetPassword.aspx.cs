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
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userID = (string)Session["UserID"];
            string currentPassword = CurrentPassword.Text;
            string newPassword = NewPassword.Text;
            string confirmPassword = ConfirmPassword.Text;

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string checkCurrentPassword = "select count(*) from [User] where userID = '" + userID + "' AND userPassword = '" + currentPassword + "'";
            SqlCommand com = new SqlCommand(checkCurrentPassword, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                if(newPassword == confirmPassword)
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("UPDATE [User] SET userPassword = @userPassword WHERE [userID] = @userID", conn);

                    cmd.Parameters.AddWithValue("@userPassword", newPassword);
                    cmd.Parameters.AddWithValue("@userID", userID);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["UserID"] = null;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Label1.Text = "Confirm Password Incorrect";
                }
            }
            else
            {
                Label1.Text = "Current Password Incorrect";
            }


        }
    }
}