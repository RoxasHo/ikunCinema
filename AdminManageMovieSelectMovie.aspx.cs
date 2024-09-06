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
    public partial class AdminTimeTableManageMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
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
    }
}