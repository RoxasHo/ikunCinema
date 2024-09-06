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
    public partial class RegisterControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();

                string checkuser = "select count(*) from Customer where Username='" + RegisterName.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {
                    Response.Write("Username already Exists");
                }

                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
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

                        string insertQuery = "insert into Customer (Username,Password,Email,Contact,Address) " +
                                "values (@username,@password,@email,@contact,@address)";

                        SqlCommand coma = new SqlCommand(insertQuery, conn);
                        coma.Parameters.AddWithValue("@username", RegisterName.Text);
                        coma.Parameters.AddWithValue("@password", RegisterPassword.Text);
                        coma.Parameters.AddWithValue("@email", RegisterEmail.Text);
                        coma.Parameters.AddWithValue("@contact", RegisterContact.Text);
                        coma.Parameters.AddWithValue("@address", RegisterAddress.Text);

                        coma.ExecuteNonQuery();

                        string mycustomerid = "select Cust_ID from Customer where Username='" + RegisterName.Text + "'";
                        SqlCommand mycustomeridComm = new SqlCommand(mycustomerid, conn);
                        string customerid = mycustomeridComm.ExecuteScalar().ToString();

                        string insertQuery2 = "insert into Cart (Cust_ID,Paid_Status) " +
                                "values (@Cust_ID,@Paid_Status)";
                        SqlCommand com2 = new SqlCommand(insertQuery2, conn);
                        com2.Parameters.AddWithValue("@Cust_ID", customerid);
                        com2.Parameters.AddWithValue("@Paid_Status", "Unpaid");
                        com2.ExecuteNonQuery();

                        string insertQuery3 = "insert into WishList (Cust_ID) " +
                                "values (@Cust_ID)";
                        SqlCommand com3 = new SqlCommand(insertQuery3, conn);
                        com3.Parameters.AddWithValue("@Cust_ID", customerid);
                        com3.ExecuteNonQuery();

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