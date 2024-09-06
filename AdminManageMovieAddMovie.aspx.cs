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
    public partial class AdminManageMovieAddMovie : System.Web.UI.Page
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

        static string GenerateRandomId()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            Random random = new Random();
            string id = "";

            // Keep generating new IDs until a unique one is found
            while (true)
            {
                id = "M" + random.Next(1000, 10000).ToString("D4");
                string checkid = "SELECT COUNT(*) FROM [Movie] WHERE movieID='" + id + "'";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            string generatedId = GenerateRandomId();

            if (MovieImg.HasFile)
            {
                string str = MovieImg.FileName;
                MovieImg.PostedFile.SaveAs(Server.MapPath("Image/" + str));
                string imgpath = "Image/" + str.ToString();

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                SqlCommand cmd = new SqlCommand("insert into [Movie] (movieID,movieName,movieTime,movieLanguage,movieSubtitle,movieGenre,movieImage) " +
                            "values (@movieID,@movieName,@movieTime,@movieLanguage,@movieSubtitle,@movieGenre,@movieImage)", conn);
                cmd.Parameters.AddWithValue("@movieID", generatedId);
                cmd.Parameters.AddWithValue("@movieName", MovieName.Text);
                cmd.Parameters.AddWithValue("@movieTime", MovieTime.Text);
                cmd.Parameters.AddWithValue("@movieLanguage", MovieLanguage1.SelectedValue);

                string selectedSubtitles = string.Join("/", MovieSubtitleCheckBoxList.Items.Cast<ListItem>()
                                    .Where(item => item.Selected)
                                    .Select(item => item.Value));
                cmd.Parameters.AddWithValue("@movieSubtitle", selectedSubtitles);

                cmd.Parameters.AddWithValue("@movieGenre", MovieGenre1.SelectedValue);
                cmd.Parameters.AddWithValue("@movieImage", imgpath);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
            }
            Response.Redirect("AdminManageMovieSelectMovie.aspx");
        }
    }
}