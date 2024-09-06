using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace masterpage1
{
    public partial class ArtisRegisterControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from Customer where Username='" + RegisterName.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                Response.Write("Username already Exists");
                Label1.Text = "Username already Exists";
            }
            else
            {
                try
                {
                    SqlConnection conna = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conna.Open();


                    string insertQuery2 = "insert into Artist (Identity_No) " +
                            "values (@identity_No)";

                    SqlCommand com2 = new SqlCommand(insertQuery2, conna);
                    com2.Parameters.AddWithValue("@identity_No", RegisterIdentity.Text);

                    com2.ExecuteNonQuery();

                    string checkArtistQuery = "Select Artist_ID from Artist where Identity_No='" + RegisterIdentity.Text + "'";
                    SqlCommand passComm = new SqlCommand(checkArtistQuery, conna);
                    int artistID = int.Parse(passComm.ExecuteScalar().ToString());

                    string insertQuery = "insert into Customer (Username,Password,Email,Contact,Address,Artist_ID) " +
                            "values (@username,@password,@email,@contact,@address,@artist_ID)";

                    SqlCommand coma = new SqlCommand(insertQuery, conna);
                    coma.Parameters.AddWithValue("@username", RegisterName.Text);
                    coma.Parameters.AddWithValue("@password", RegisterPassword.Text);
                    coma.Parameters.AddWithValue("@email", RegisterEmail.Text);
                    coma.Parameters.AddWithValue("@contact", RegisterContact.Text);
                    coma.Parameters.AddWithValue("@address", RegisterAddress.Text);
                    coma.Parameters.AddWithValue("@Artist_ID", artistID);

                    coma.ExecuteNonQuery();



                    Response.Redirect("Login.aspx");
                    Response.Write("Registration is successful");

                    conn.Close();

                }
                catch (Exception ex)
                {
                    Response.Write("Error:" + ex.ToString() + "Error:");
                }
            }

            conn.Close();
        }
    }
}