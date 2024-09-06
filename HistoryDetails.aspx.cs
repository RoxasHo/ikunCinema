using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CinemaTicketingSystem
{
    public partial class HistoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                if (Request.QueryString["id"] != null)
                {
                    // Retrieve the reservation ID from the query string
                    string reservationID = Request.QueryString["id"];

                    // Fetch payment details from the database based on the reservation ID
                    DataTable paymentData = GetPaymentDetails(reservationID);

                    // Update the labels with the fetched data
                    if (paymentData.Rows.Count > 0)
                    {
                        DataRow row = paymentData.Rows[0];

                        lblPaymentID.Text = row["paymentID"].ToString();

                        lblPaymentMethod.Text = row["paymentMethod"].ToString();
                        lblAmount.Text = row["totalAmount"].ToString();
                        lblCurrentDateTime.Text = Convert.ToDateTime(row["dateTime"]).ToString("yyyy-MM-dd HH:mm:ss");
                        lblReservationID.Text = row["reservationID"].ToString();
                        movieImage.ImageUrl = "https://api.qrserver.com/v1/create-qr-code/?data=" + reservationID + "&size=220x220&margin=0";
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            

        }

        private DataTable GetPaymentDetails(string reservationID)
        {
            DataTable dt = new DataTable();



            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                connection.Open();

                string query = "SELECT * FROM Payment WHERE reservationID = @reservationID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@reservationID", reservationID);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dt);
                    }
                }
                return dt;
            }

        }
    }
}