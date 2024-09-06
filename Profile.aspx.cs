using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage1
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {
                if (!IsPostBack)
                {
                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                    conn.Open();

                    string myusername = Session["Who"].ToString();
                    string myuserid = "select Cust_ID from Customer where Username='" + myusername + "'";
                    SqlCommand useridComm = new SqlCommand(myuserid, conn);
                    string mymyuserid = useridComm.ExecuteScalar().ToString();

                    string myname = "select Username from Customer where Cust_ID='" + mymyuserid + "'";
                    SqlCommand usernameComm = new SqlCommand(myname, conn);
                    string mymyname = usernameComm.ExecuteScalar().ToString();

                    string myemail = "select Email from Customer where Cust_ID='" + mymyuserid + "'";
                    SqlCommand emailComm = new SqlCommand(myemail, conn);
                    string mymyemail = emailComm.ExecuteScalar().ToString();

                    string mycontact = "select Contact from Customer where Cust_ID='" + mymyuserid + "'";
                    SqlCommand contactComm = new SqlCommand(mycontact, conn);
                    string mymycontact = contactComm.ExecuteScalar().ToString();

                    string myaddress = "select Address from Customer where Cust_ID='" + mymyuserid + "'";
                    SqlCommand caddressComm = new SqlCommand(myaddress, conn);
                    string mymyaddress = caddressComm.ExecuteScalar().ToString();

                    ProfileName.Text = mymyname;
                    ProfileEmail.Text = mymyemail;
                    ProfileContact.Text = mymycontact;
                    ProfileAddress.Text = mymyaddress;

                    conn.Close();
                }
                

                
            }

            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            

            string mymyname = ProfileName.Text;
            string mymyemail = ProfileEmail.Text;
            string mymycontact = ProfileContact.Text;
            string mymyaddress = ProfileAddress.Text;

            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            con1.Open();

            string myuserid = "select Cust_ID from Customer where Username='" + mymyname + "'";
            SqlCommand useridComm = new SqlCommand(myuserid, con1);
            string mymyuserid = useridComm.ExecuteScalar().ToString();


            SqlCommand con2 = new SqlCommand("UPDATE Customer SET Email=@Email , Contact=@Contact , Address=@Address WHERE Cust_ID=@Cust_ID", con1);
            
            con2.Parameters.AddWithValue("@Email", mymyemail);
            con2.Parameters.AddWithValue("@Contact", mymycontact);
            con2.Parameters.AddWithValue("@Address", mymyaddress);
            con2.Parameters.AddWithValue("@Cust_ID", mymyuserid);
            con2.ExecuteNonQuery();

            con1.Close();
            Response.Redirect("Profile.aspx");
        }

        protected void back_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gallery.aspx");
        }
    }
}