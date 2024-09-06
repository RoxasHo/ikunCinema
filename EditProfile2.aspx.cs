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
    public partial class EditProfile2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                string getUserID = Session["UserID"].ToString();
                
                Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                // Select the current movie details
                string selectQuery = "SELECT userName, userGender, userEmail FROM [User] WHERE [userID] = @userID";
                SqlCommand selectCmd = new SqlCommand(selectQuery, conn);
                selectCmd.Parameters.AddWithValue("@userID", getUserID);

                using (SqlDataReader reader = selectCmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        if (String.IsNullOrEmpty(EditUserName.Text))
                        {
                            // Retrieve the current movie details from the reader
                            string currentusername = reader["userName"].ToString();
                            string currentgender = reader["userGender"].ToString();
                            string currentemail = reader["userEmail"].ToString();

                            // Create a list of possible subtitles

                            EditUserName.Text = currentusername;
                            EditGender.SelectedValue = currentgender;
                            EditEmail.Text = currentemail;
                        }
                    }
                }

                // Close the connection after reading
                conn.Close();
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void UpdateButton2_click(object sender, EventArgs e)
        {
            string userID = (string)Session["UserID"];

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            // Assuming you have a unique identifier for the movie, replace [MovieIDColumn] with the actual column name
            SqlCommand cmd = new SqlCommand("UPDATE [User] SET userName = @userName, userGender = @userGender, " +
                        "userEmail = @userEmail " +
                        "WHERE [userID] = @userID", conn);

            cmd.Parameters.AddWithValue("@userID", userID); // Replace YourMovieID with the actual movie ID
            cmd.Parameters.AddWithValue("@userName", EditUserName.Text);
            cmd.Parameters.AddWithValue("@userGender", EditGender.SelectedValue);
            cmd.Parameters.AddWithValue("@userEmail", EditEmail.Text);

            

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("UserProfile.aspx");
        }
    }
}