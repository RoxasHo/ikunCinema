using System;
using System.IO;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;


namespace CinemaTicketingSystem
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] != null)
                {
                    string userId = Session["UserID"].ToString();
                    string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string selectQuery = "SELECT userName, userGender, userPassword, userEmail FROM [User] WHERE [userID] = @userID";
                        SqlCommand selectCmd = new SqlCommand(selectQuery, connection);
                        selectCmd.Parameters.AddWithValue("@userID", userId);

                        try
                        {
                            connection.Open();
                            SqlDataReader reader = selectCmd.ExecuteReader();

                            if (reader.Read()) // Check if there are results before accessing data
                            {
                                string userName = reader["userName"].ToString();
                                string userGender = reader["userGender"].ToString();
                                string userPassword = reader["userPassword"].ToString();
                                string userEmail = reader["userEmail"].ToString();

                                // Display user details from the database
                                UserName_txt.Text = userName;
                                Gender_txt.Text = userGender;
                                Email_txt.Text = userEmail;

                                string updatedUserName = Request.QueryString["updatedUserName"];
                                string updatedGender = Request.QueryString["updatedGender"];
                                string updatedPassword = Request.QueryString["updatedPassword"];
                                string updatedEmail = Request.QueryString["updatedEmail"];

                                // Display updated user details on the profile page
                                if (!string.IsNullOrEmpty(updatedUserName))
                                {
                                    UserName_txt.Text = updatedUserName;
                                }

                                if (!string.IsNullOrEmpty(updatedGender))
                                {
                                    Gender_txt.Text = updatedGender;
                                }

                                if (!string.IsNullOrEmpty(updatedEmail))
                                {
                                    Email_txt.Text = updatedEmail;
                                }
                                // Display the profile picture if available
                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle the exception or log it
                            // For example:
                            Console.WriteLine("Error: " + ex.Message);
                        }
                    }
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}