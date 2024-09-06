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
    public partial class ProductDetails : System.Web.UI.Page
    {
        public int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
                id = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("id"));

                conn.Open();
                string maxstock = "select Stock from Art where Art_ID='" + id + "'";
                SqlCommand com = new SqlCommand(maxstock, conn);
                string setstock = com.ExecuteScalar().ToString();
                AmountNumber.Attributes.Add("max", setstock);

                string myusername = Session["Who"].ToString();
                string myuserid = "select Cust_ID from Customer where Username='" + myusername + "'";
                SqlCommand useridComm = new SqlCommand(myuserid, conn);
                string mymyuserid = useridComm.ExecuteScalar().ToString();

                string mywishid = "select Wish_ID from WishList where Cust_ID='" + mymyuserid + "'";
                SqlCommand wishidComm = new SqlCommand(mywishid, conn);
                string mymywishid = wishidComm.ExecuteScalar().ToString();

                string checkhavewishlist = "select count(*) from WishList_Item where Wish_ID='" + mymywishid + "' and Art_ID='" + id + "'";
                SqlCommand checkhavewishlistcom = new SqlCommand(checkhavewishlist, conn);
                int temp2 = Convert.ToInt32(checkhavewishlistcom.ExecuteScalar().ToString());

                conn.Close();

                if (temp2 == 1)
                {
                    Wishlist.Text = "Wishlisted";
                }
                conn.Close();
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

        protected void Wish_Click(object sender, EventArgs e)
        {

            if (Session["Who"] != null)
            {


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();

                string myusername = Session["Who"].ToString();
                string myuserid = "select Cust_ID from Customer where Username='" + myusername + "'";
                SqlCommand useridComm = new SqlCommand(myuserid, conn);
                string mymyuserid = useridComm.ExecuteScalar().ToString();

                string checkwishid = "select count(*) from WishList where Cust_ID='" + mymyuserid + "'";
                SqlCommand com = new SqlCommand(checkwishid, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                conn.Close();

                if (temp == 1)
                {

                    conn.Open();
                    string mywishid = "select Wish_ID from WishList where Cust_ID='" + mymyuserid + "'";
                    SqlCommand wishidComm = new SqlCommand(mywishid, conn);
                    string mymywishid = wishidComm.ExecuteScalar().ToString();
                    conn.Close();

                    conn.Open();

                    string checkhavewishlist = "select count(*) from WishList_Item where Wish_ID='" + mymywishid + "' and Art_ID='" + id + "'";
                    SqlCommand checkhavewishlistcom = new SqlCommand(checkhavewishlist, conn);
                    int temp2 = Convert.ToInt32(checkhavewishlistcom.ExecuteScalar().ToString());

                    conn.Close();

                    if (temp2 == 1)
                    {
                        Wishlist.Text = "Wishlisted";
                    }
                    else
                    {
                        conn.Open();

                        string insertQuery2 = "insert into WishList_Item (Wish_ID,Art_ID) " +
                            "values (@wish_ID,@art_ID)";

                        SqlCommand com2 = new SqlCommand(insertQuery2, conn);
                        com2.Parameters.AddWithValue("@wish_ID", mymywishid);
                        com2.Parameters.AddWithValue("@art_ID", id);

                        com2.ExecuteNonQuery();

                        Response.Redirect("ProductDetails.aspx?id=" + id + "");

                        conn.Close();
                    }

                }

                else
                {
                    //add wishlist id
                    conn.Open();
                    string insertQuery3 = "insert into WishList (Cust_ID) " +
                        "values (@Cust_ID)";
                    SqlCommand com3 = new SqlCommand(insertQuery3, conn);
                    com3.Parameters.AddWithValue("@Cust_ID", mymyuserid);
                    com3.ExecuteNonQuery();


                    string mywishid = "select Wish_ID from WishList where Cust_ID='" + mymyuserid + "'";
                    SqlCommand wishidComm = new SqlCommand(mywishid, conn);
                    string mymywishid = wishidComm.ExecuteScalar().ToString();

                    string insertQuery2 = "insert into WishList_Item (Wish_ID,Art_ID) " +
                        "values (@wish_ID,@art_ID,)";

                    SqlCommand com2 = new SqlCommand(insertQuery2, conn);
                    com2.Parameters.AddWithValue("@wish_ID", mymywishid);
                    com2.Parameters.AddWithValue("@art_ID", id);

                    com2.ExecuteNonQuery();

                    Response.Redirect("ProductDetails.aspx?id=" + id + "");

                    conn.Close();
                }

            }

            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void AddCart_Click(object sender, EventArgs e)
        {

            if (Session["Who"] != null)
            {


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                conn.Open();

                string myusername = Session["Who"].ToString();
                string myuserid = "select Cust_ID from Customer where Username='" + myusername + "'";
                SqlCommand useridComm = new SqlCommand(myuserid, conn);
                string mymyuserid = useridComm.ExecuteScalar().ToString();

                string checkcartid = "select count(*) from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                SqlCommand com = new SqlCommand(checkcartid, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                conn.Close();

                if (temp == 1)
                {
                    conn.Open();
                    string mycartid2 = "select Cart_ID from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                    SqlCommand cartidComm2 = new SqlCommand(mycartid2, conn);
                    string mymycartid2 = cartidComm2.ExecuteScalar().ToString();
                    conn.Close();

                    conn.Open();
                    string checkstock = "select count(*) from Cart_Item where Cart_ID ='" + mymycartid2 + "' and Art_ID='" + id + "'";
                    SqlCommand checkstockcom = new SqlCommand(checkstock, conn);
                    int tempstock = Convert.ToInt32(checkstockcom.ExecuteScalar().ToString());
                    conn.Close();

                    int addamount = int.Parse(AmountNumber.Text);

                    if (tempstock == 1)
                    {
                        //add old quantity

                        conn.Open();

                        string checkquantity1 = "select Id from Cart_Item where Art_ID='" + id + "' and Cart_ID ='" + mymycartid2 + "'";
                        SqlCommand checkquantity1com = new SqlCommand(checkquantity1, conn);
                        string cartitemid = checkquantity1com.ExecuteScalar().ToString();

                        string checkquantity2 = "select Quantity from Cart_Item where Id='" + cartitemid + "'";
                        SqlCommand checkquantity2com = new SqlCommand(checkquantity2, conn);
                        int orioristock = int.Parse(checkquantity2com.ExecuteScalar().ToString());

                        int totalstock = addamount + orioristock;
                        string stringstock = totalstock.ToString();

                        SqlCommand updatestock = new SqlCommand("UPDATE Cart_Item SET Quantity=@Quantity WHERE Id=@Id", conn);
                        updatestock.Parameters.AddWithValue("Quantity", stringstock);
                        updatestock.Parameters.AddWithValue("@Id", cartitemid);
                        updatestock.ExecuteNonQuery();

                        string maxstock = "select Stock from Art where Art_ID='" + id + "'";
                        SqlCommand maxstockcom = new SqlCommand(maxstock, conn);
                        int nummaxstock = int.Parse(maxstockcom.ExecuteScalar().ToString());
                        int minamount = int.Parse(AmountNumber.Text);
                        int updatestockquantity = nummaxstock - minamount;

                        SqlCommand updateartstock = new SqlCommand("UPDATE Art SET Stock=@Stock WHERE Art_ID=@Art_ID", conn);
                        updateartstock.Parameters.AddWithValue("@Stock", updatestockquantity);
                        updateartstock.Parameters.AddWithValue("@Art_ID", id);
                        updateartstock.ExecuteNonQuery();

                        conn.Close();
                        Response.Redirect("Gallery.aspx");
                    }
                    else
                    {
                        //start insert new
                        conn.Open();
                        string mycartid = "select Cart_ID from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                        SqlCommand cartidComm = new SqlCommand(mycartid, conn);
                        string mymycartid = cartidComm.ExecuteScalar().ToString();

                        string insertQuery2 = "insert into Cart_Item (Cart_ID,Art_ID,Quantity) " +
                            "values (@cart_ID,@art_ID,@quantity)";

                        SqlCommand com2 = new SqlCommand(insertQuery2, conn);
                        com2.Parameters.AddWithValue("@cart_ID", mymycartid);
                        com2.Parameters.AddWithValue("@art_ID", id);
                        com2.Parameters.AddWithValue("@quantity", AmountNumber.Text);

                        com2.ExecuteNonQuery();

                        string maxstock = "select Stock from Art where Art_ID='" + id + "'";
                        SqlCommand maxstockcom = new SqlCommand(maxstock, conn);
                        int nummaxstock = int.Parse(maxstockcom.ExecuteScalar().ToString());
                        int minamount = int.Parse(AmountNumber.Text);
                        int updatestockquantity = nummaxstock - minamount;

                        SqlCommand updateartstock = new SqlCommand("UPDATE Art SET Stock=@Stock WHERE Art_ID=@Art_ID", conn);
                        updateartstock.Parameters.AddWithValue("@Stock", updatestockquantity);
                        updateartstock.Parameters.AddWithValue("@Art_ID", id);
                        updateartstock.ExecuteNonQuery();

                        conn.Close();
                        Response.Redirect("Gallery.aspx");
                    }



                }

                else
                {
                    conn.Open();
                    string insertQuery3 = "insert into Cart (Cust_ID,Paid_Status) " +
                        "values (@Cust_ID, @Paid_Status)";
                    SqlCommand com3 = new SqlCommand(insertQuery3, conn);
                    com3.Parameters.AddWithValue("@Cust_ID", mymyuserid);
                    com3.Parameters.AddWithValue("@Paid_Status", "Unpaid");
                    com3.ExecuteNonQuery();

                    string mycartid = "select Cart_ID from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                    SqlCommand cartidComm = new SqlCommand(mycartid, conn);
                    string mymycartid = cartidComm.ExecuteScalar().ToString();

                    string insertQuery2 = "insert into Cart_Item (Cart_ID,Art_ID,Quantity) " +
                        "values (@cart_ID,@art_ID,@quantity)";

                    SqlCommand com2 = new SqlCommand(insertQuery2, conn);
                    com2.Parameters.AddWithValue("@cart_ID", mymycartid);
                    com2.Parameters.AddWithValue("@art_ID", id);
                    com2.Parameters.AddWithValue("@quantity", AmountNumber.Text);

                    com2.ExecuteNonQuery();

                    string maxstock = "select Stock from Art where Art_ID='" + id + "'";
                    SqlCommand maxstockcom = new SqlCommand(maxstock, conn);
                    int nummaxstock = int.Parse(maxstockcom.ExecuteScalar().ToString());
                    int minamount = int.Parse(AmountNumber.Text);
                    int updatestockquantity = nummaxstock - minamount;

                    SqlCommand updateartstock = new SqlCommand("UPDATE Art SET Stock=@Stock WHERE Art_ID=@Art_ID", conn);
                    updateartstock.Parameters.AddWithValue("@Stock", updatestockquantity);
                    updateartstock.Parameters.AddWithValue("@Art_ID", id);
                    updateartstock.ExecuteNonQuery();


                    conn.Close();
                    Response.Redirect("Gallery.aspx");
                }

            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
    }
}