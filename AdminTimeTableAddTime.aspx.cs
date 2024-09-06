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
    public partial class AdminTimeTableAddTime : System.Web.UI.Page
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

        static string GenerateRandomId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            Random random = new Random();
            string id = "";

            // Keep generating new IDs until a unique one is found
            while (true)
            {
                id = "T" + random.Next(1000, 10000).ToString("D4");
                string checkid = "SELECT COUNT(*) FROM [TimeTable] WHERE timeTableID='" + id + "'";
                SqlCommand com = new SqlCommand(checkid, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                if (temp == 0)
                {
                    // If the ID doesn't exist, break out of the loop
                    break;
                }
            }

            conn.Close();
            return id;
        }

        protected void MovieSubmit_Click(object sender, EventArgs e)
        {
            if (Calendar1.SelectedDate == DateTime.MinValue)
            {
                Label2.Text = "Please select a date";
            }
            else
            {
                string generatedId = GenerateRandomId();
                DateTime selectedDate = Calendar1.SelectedDate;
                DateTime selectedDateTime = selectedDate.Add(TimeSpan.Parse(MovieTime.Text));

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                // Check for overlapping schedules
                SqlCommand checkOverlapCmd = new SqlCommand("SELECT COUNT(*) FROM [TimeTable] " +
                                                            "WHERE hallID = @hallID AND date = @date AND " +
                                                            "ABS(DATEDIFF(minute, startTime, @startTime)) <= 120", conn);
                checkOverlapCmd.Parameters.AddWithValue("@hallID", HallDropDown.SelectedValue);
                checkOverlapCmd.Parameters.AddWithValue("@date", selectedDateTime.Date);
                checkOverlapCmd.Parameters.AddWithValue("@startTime", selectedDateTime.TimeOfDay);

                int overlappingSchedules = (int)checkOverlapCmd.ExecuteScalar();

                if (overlappingSchedules > 0)
                {
                    Label1.Text = "The selected time has already been scheduled.";
                }
                else
                {
                    // Insert the new schedule
                    SqlCommand insertCmd = new SqlCommand("INSERT INTO [TimeTable] (timeTableID, movieID, startTime, hallID, date) " +
                                                          "VALUES (@timeTableID, @movieID, @startTime, @hallID, @date)", conn);
                    insertCmd.Parameters.AddWithValue("@timeTableID", generatedId);
                    insertCmd.Parameters.AddWithValue("@movieID", id);
                    insertCmd.Parameters.AddWithValue("@startTime", selectedDateTime.TimeOfDay);
                    insertCmd.Parameters.AddWithValue("@hallID", HallDropDown.SelectedValue);
                    insertCmd.Parameters.AddWithValue("@date", selectedDateTime.Date);

                    insertCmd.ExecuteNonQuery();
                    conn.Close();

                    Response.Redirect("/AdminTimeTableDetail.aspx?id=" + id);
                }
            }
        }

        protected void ValidateCalendarSelection(object source, ServerValidateEventArgs args)
        {
            // Validate that the selected date is not the default value (01/01/0001)
            args.IsValid = Calendar1.SelectedDate != DateTime.MinValue;
        }
    }
}