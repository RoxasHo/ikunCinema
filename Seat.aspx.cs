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
    public partial class Seat : System.Web.UI.Page
    {
        public string movieid;
        public string timeid;
        public string hallid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
                movieid = HttpUtility.ParseQueryString(myUri.Query).Get("movieID");
                timeid = HttpUtility.ParseQueryString(myUri.Query).Get("timeTableID");
                hallid = HttpUtility.ParseQueryString(myUri.Query).Get("hallID");

                PopulateSeatDropDownList(timeid);
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

           
        }

        private void PopulateSeatDropDownList(string timeTableId)
        {
            // Clear existing items (if any)
            ddlSeat.Items.Clear();

            // Define the seat categories and their respective seat counts
            Dictionary<string, int> seatCategories = new Dictionary<string, int>
    {
        { "A", 10 },
        { "B", 10 },
        { "C", 10 },
        { "D", 10  }
    };

            // Populate the DropDownList with seat numbers
            foreach (var category in seatCategories)
            {
                for (int i = 1; i <= category.Value; i++)
                {
                    string seatNumber = category.Key + i;

                    // Check if the seat is booked for the given timeTableId
                    if (!IsSeatBooked(seatNumber, timeTableId))
                    {
                        ddlSeat.Items.Add(new ListItem(seatNumber, seatNumber));
                    }
                }
            }
        }

        private bool IsSeatBooked(string seatNumber, string timeTableId)
        {
            // Check if the seat is booked for the given timeTableId
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string checkBookingQuery = "SELECT COUNT(*) FROM BookedSeat WHERE seatName = @seatName AND timeTableId = @timeTableId";
                using (SqlCommand checkBookingCmd = new SqlCommand(checkBookingQuery, connection))
                {
                    checkBookingCmd.Parameters.AddWithValue("@seatName", seatNumber);
                    checkBookingCmd.Parameters.AddWithValue("@timeTableId", timeTableId);

                    int count = (int)checkBookingCmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        protected void Sqlds_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@movieID"].Value = (movieid);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["selectSeat"] = ddlSeat.SelectedValue;
            Session["selectTime"] = timeid;
            Session["selecthall"] = hallid;
            Response.Redirect("/Payment.aspx?timeTableID=" + timeid);
        }
    }
}