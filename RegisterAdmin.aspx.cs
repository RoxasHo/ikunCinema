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
    public partial class RegisterAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string getUserID = Session["UserID"].ToString();
                if (Passcode.Text == "admin")
                {
                    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                    {
                        conn.Open();

                        // Use parameterized query to prevent SQL injection
                        string addrole = "UPDATE [User] SET userRole = 'admin' WHERE userID = @UserID";

                        using (SqlCommand com = new SqlCommand(addrole, conn))
                        {
                            // Add parameters to the query
                            com.Parameters.AddWithValue("@UserID", getUserID);

                            // Execute the query
                            com.ExecuteNonQuery();
                            Response.Redirect("Administration.aspx");
                        }
                    }
                }
            }

        }
    }
}