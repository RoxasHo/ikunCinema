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
    public partial class AdminManageMovieEditDetails : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                string getUserID = Session["UserID"].ToString();
                SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn1.Open();

                string checkuser = "select userRole from [User] where userID ='" + getUserID + "'";
                SqlCommand com = new SqlCommand(checkuser, conn1);
                string userRole = com.ExecuteScalar().ToString();
                conn1.Close();
                if (userRole != "admin")
                {
                    Response.Redirect("RegisterAdmin.aspx");
                }
                else
                {
                    Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
                    id = HttpUtility.ParseQueryString(myUri.Query).Get("id");

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    conn.Open();

                    // Select the current movie details
                    string selectQuery = "SELECT movieName, movieTime, movieLanguage, movieSubtitle, movieGenre FROM [Movie] WHERE [movieID] = @movieID";
                    SqlCommand selectCmd = new SqlCommand(selectQuery, conn);
                    selectCmd.Parameters.AddWithValue("@movieID", id);

                    using (SqlDataReader reader = selectCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            if (String.IsNullOrEmpty(movieName.Text))
                            {
                                // Retrieve the current movie details from the reader
                                string currentMovieName = reader["movieName"].ToString();
                                string currentMovieTime = reader["movieTime"].ToString();
                                string currentMovieLanguage = reader["movieLanguage"].ToString();
                                string currentMovieSubtitle = reader["movieSubtitle"].ToString();
                                string currentMovieGenre = reader["movieGenre"].ToString();

                                // Create a list of possible subtitles
                                List<string> possibleSubtitles = new List<string> { "CN", "EN", "BM" };

                                // Set the CheckBoxList items based on the possible subtitles
                                foreach (ListItem item in MovieSubtitleCheckBoxList.Items)
                                {
                                    string subtitleValue = item.Value;

                                    // Check if the current subtitle is present in the currentMovieSubtitle string
                                    if (currentMovieSubtitle.Contains(subtitleValue))
                                    {
                                        item.Selected = true;
                                    }
                                    else
                                    {
                                        item.Selected = false;
                                    }
                                }

                                movieName.Text = currentMovieName;
                                movieTime.Text = currentMovieTime;
                                MovieLanguage1.SelectedValue = currentMovieLanguage;
                                MovieGenre1.SelectedValue = currentMovieGenre;
                            }
                        }
                    }

                    // Close the connection after reading
                    conn.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void MovieSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            // Assuming you have a unique identifier for the movie, replace [MovieIDColumn] with the actual column name
            SqlCommand cmd = new SqlCommand("UPDATE [Movie] SET movieName = @movieName, movieTime = @movieTime, " +
                        "movieLanguage = @movieLanguage, movieSubtitle = @movieSubtitle, movieGenre = @movieGenre " +
                        "WHERE [movieID] = @movieID", conn);

            cmd.Parameters.AddWithValue("@movieID", id); // Replace YourMovieID with the actual movie ID
            cmd.Parameters.AddWithValue("@movieName", movieName.Text);
            cmd.Parameters.AddWithValue("@movieTime", movieTime.Text);
            cmd.Parameters.AddWithValue("@movieLanguage", MovieLanguage1.SelectedValue);

            string selectedSubtitles = string.Join("/", MovieSubtitleCheckBoxList.Items.Cast<ListItem>()
                            .Where(item => item.Selected)
                            .Select(item => item.Value));
            cmd.Parameters.AddWithValue("@movieSubtitle", selectedSubtitles);

            cmd.Parameters.AddWithValue("@movieGenre", MovieGenre1.SelectedValue);

            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("AdminManageMovieSelectMovie.aspx");
        }

        protected void Sqlds_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@movieID"].Value = (id);
        }
    }
}