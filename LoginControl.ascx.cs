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
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();

            string checkuser = "select count(*) from Customer where Username='" + LoginName.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            conn.Close();
            if (temp == 1)
            {
                conn.Open();
                string checkPasswordQuery = "Select password from Customer where Username='" + LoginName.Text + "'";
                SqlCommand passComm = new SqlCommand(checkPasswordQuery, conn);
                string password = passComm.ExecuteScalar().ToString().Replace(" ", "");
                if (password == LoginPassword.Text)
                {
                    Session["Who"] = LoginName.Text;
                    Response.Write("Password is correct");
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    Response.Write("Password is incorrect");
                    Label1.Text = "Password is incorrect";
                }
            }
            else
            {
                Response.Write("Username is incorrect");
                Label1.Text = "Username is incorrect";
            }
        }
    }
}