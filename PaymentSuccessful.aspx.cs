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
    public partial class PaymentSuccessful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (!IsPostBack)
                {
                    // Generate the next reservation ID
                    string reservationID = GenerateRandomReservationId();
                    lblReservationID.Text = reservationID;
                    string paymentID = GenerateRandomPaymentId();
                    string name = (string)Session["Name"];
                    string userID = (string)Session["UserID"];
                    string paymentMethod = (string)Session["PaymentMethod"];
                    string timetableId = (string)Session["selectTime"];
                    string hallId = (string)Session["selecthall"];
                    string seatname = (string)Session["selectSeat"];
                    string seatID = GenerateRandomSeatId();
                    DateTime currentDateTime = DateTime.Now;

                    lblName.Text = name;
                    lblPaymentMethod.Text = paymentMethod;
                    lblPaymentID.Text = paymentID;
                    lblCurrentDateTime.Text = currentDateTime.ToString("yyyy-MM-dd HH:mm:ss");
                    lblAmount.Text = "20.00";
                    SqlConnection conna = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conna.Open();

                    if (!IsReservationIDDuplicate(reservationID))
                    {
                        string insertQuery = "insert into [Payment] (paymentID,reservationID,userID,paymentMethod,totalAmount,dateTime) " +
                                             "values (@paymentID,@reservationID,@userID,@paymentMethod,@totalAmount,@dateTime)";

                        SqlCommand coma = new SqlCommand(insertQuery, conna);
                        coma.Parameters.AddWithValue("@paymentID", paymentID);
                        coma.Parameters.AddWithValue("@reservationID", reservationID);
                        coma.Parameters.AddWithValue("@userID", userID);
                        /*coma.Parameters.AddWithValue("@userID", userID);*/
                        coma.Parameters.AddWithValue("@paymentMethod", paymentMethod);
                        coma.Parameters.AddWithValue("@totalAmount", "20.00");

                        coma.Parameters.AddWithValue("@dateTime", currentDateTime);

                        coma.ExecuteNonQuery();

                        string insertQuery2 = "insert into [Reservation] (reservationID,userID,timeTableID,price) " +
                                             "values (@reservationID,@userID,@timeTableID,@price)";

                        SqlCommand coma2 = new SqlCommand(insertQuery2, conna);
                        coma2.Parameters.AddWithValue("@reservationID", reservationID);
                        coma2.Parameters.AddWithValue("@userID", userID);
                        coma2.Parameters.AddWithValue("@timeTableID", timetableId);
                        coma2.Parameters.AddWithValue("@price", "20.00");

                        coma2.ExecuteNonQuery();

                        string insertQuery3 = "insert into [BookedSeat] (seatID,seatName,hallID,timeTableID,reservationID) " +
                                             "values (@seatID,@seatName,@hallID,@timeTableID,@reservationID)";

                        SqlCommand coma3 = new SqlCommand(insertQuery3, conna);
                        coma3.Parameters.AddWithValue("@seatID", seatID);
                        coma3.Parameters.AddWithValue("@seatName", seatname);
                        coma3.Parameters.AddWithValue("@hallID", hallId);
                        coma3.Parameters.AddWithValue("@timeTableID", timetableId);
                        coma3.Parameters.AddWithValue("@reservationID", reservationID);

                        coma3.ExecuteNonQuery();
                    }

                    conna.Close();



                    movieImage.ImageUrl = "https://api.qrserver.com/v1/create-qr-code/?data=" + reservationID + "&size=220x220&margin=0";

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            
        }

        static string GenerateRandomSeatId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            Random random = new Random();
            string id = "";

            // Keep generating new IDs until a unique one is found
            while (true)
            {
                id = "S" + random.Next(10000, 100000).ToString("D5");
                string checkid = "SELECT COUNT(*) FROM [BookedSeat] WHERE seatID='" + id + "'";
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

        static string GenerateRandomReservationId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            Random random = new Random();
            string id = "";

            // Keep generating new IDs until a unique one is found
            while (true)
            {
                id = "R" + random.Next(10000, 100000).ToString("D5");
                string checkid = "SELECT COUNT(*) FROM [Reservation] WHERE reservationID='" + id + "'";
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

        static string GenerateRandomPaymentId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            Random random = new Random();
            string id = "";

            // Keep generating new IDs until a unique one is found
            while (true)
            {
                id = "P" + random.Next(10000, 100000).ToString("D5");
                string checkid = "SELECT COUNT(*) FROM [Payment] WHERE paymentID='" + id + "'";
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

        private bool IsReservationIDDuplicate(string reservationID)
        {


            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Reservation WHERE reservationID = @ReservationID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ReservationID", reservationID);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }
    }
}