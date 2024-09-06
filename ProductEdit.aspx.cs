using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage1
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        public int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
                id = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("id"));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
        protected void Sqlds_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Art_ID"].Value = (id);
        }

        protected void ChangeAmount_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con1.Open();
            SqlCommand com = new SqlCommand("UPDATE ART SET Stock=@Stock WHERE Art_ID=@Art_ID",con1);
            com.Parameters.AddWithValue("Stock", AmountNumber.Text);
            com.Parameters.AddWithValue("@Art_ID", id);
            com.ExecuteNonQuery();
            con1.Close();
            Response.Redirect("ArtistHome.aspx");
        }
    }
}