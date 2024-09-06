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
    public partial class AdminTimeTableDetailaspx : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            id = HttpUtility.ParseQueryString(myUri.Query).Get("id");

            if (Session["UserID"] != null)
            {
                string getUserID = Session["UserID"].ToString();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string checkuser = "select userRole from [User] where userID ='" + getUserID + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                string userRole = com.ExecuteScalar().ToString();
                conn.Close();
                if (userRole != "admin")
                {
                    Response.Redirect("RegisterAdmin.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void Sqlds_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@movieID"].Value = (id);
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdminTimeTableAddTime.aspx?id=" + id);
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            LinkButton deleteButton = (LinkButton)sender;
            string timeTableID = deleteButton.CommandArgument;

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Use a parameterized query to avoid SQL injection
                string deleteQuery = "DELETE FROM [TimeTable] WHERE [timeTableID] = @timeTableID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, conn))
                {
                    // Add the parameter
                    cmd.Parameters.AddWithValue("@timeTableID", timeTableID);

                    // Execute the DELETE query
                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("/AdminTimeTableDetail.aspx?id=" + id);
        }

    }
}