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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string checkuser = "select count(*) from [User] where userID='" + RegisterID.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Username already Exists");
                    Label1.Text = "Phone Number already Exists";
                }
                else
                {
                    try
                    {
                        SqlConnection conna = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        conna.Open();

                        string insertQuery = "insert into [User] (userID,userName,userGender,userPassword,userEmail) " +
                                "values (@userid,@username,@usergender,@userpassword,@useremail)";

                        SqlCommand coma = new SqlCommand(insertQuery, conn);
                        coma.Parameters.AddWithValue("@userid", RegisterID.Text);
                        coma.Parameters.AddWithValue("@username", RegisterName.Text);
                        coma.Parameters.AddWithValue("@usergender", RegisterGender.SelectedValue);
                        coma.Parameters.AddWithValue("@userpassword", RegisterPassword.Text);
                        coma.Parameters.AddWithValue("@useremail", RegisterEmail.Text);

                        coma.ExecuteNonQuery();

                        Response.Redirect("Login.aspx");
                        Response.Write("Registration is successful");

                        conna.Close();

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
}