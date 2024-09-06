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
    public partial class Cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
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
                    string mycartid = "select Cart_ID from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                    SqlCommand cartidComm = new SqlCommand(mycartid, conn);
                    string mymycartid = cartidComm.ExecuteScalar().ToString();
                    Session["CARTID"] = mymycartid;

                    conn.Close();
                }

                else
                {
                    conn.Open();
                    string insertQuery3 = "insert into Cart (Cust_ID,Paid_Status) " +
                        "values (@Cust_ID,@Paid_Status)";
                    SqlCommand com3 = new SqlCommand(insertQuery3, conn);
                    com3.Parameters.AddWithValue("@Cust_ID", mymyuserid);
                    com3.Parameters.AddWithValue("@Paid_Status", "Unpaid");
                    com3.ExecuteNonQuery();

                    string mycartid = "select Cart_ID from Cart where Paid_Status = 'Unpaid' and Cust_ID='" + mymyuserid + "'";
                    SqlCommand cartidComm = new SqlCommand(mycartid, conn);
                    string mymycartid = cartidComm.ExecuteScalar().ToString();
                    Session["CARTID"] = mymycartid;

                    conn.Close();
                }

            }

            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void BtnBrowse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void BtnPay_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        double totalUnitPrice = 0.0;
        int totalQty = 0;
        double totalPrice = 0.0;
        double subtotal = 0.0;

        //to load each row
        protected void GridView1_RowDataBound(object sender,GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                subtotal = 0.0;
                totalUnitPrice = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Art_Price"));
                totalQty = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Quantity"));

                subtotal = totalUnitPrice * totalQty;
                totalPrice += (totalUnitPrice * totalQty);
                e.Row.Cells[5].Text = subtotal.ToString("RM0.00");
                BtnPay.Visible = true;

            } else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[4].Text = "Total";
                e.Row.Cells[4].Font.Bold = true;

                e.Row.Cells[5].Text = totalPrice.ToString("RM0.00");
                e.Row.Cells[5].Font.Bold = true;
                BtnPay.Visible = true;
            }
        }
        protected void Remove_Click(object sender, EventArgs e)
        {
            int rowid = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

            string artname = GridView1.Rows[rowid].Cells[1].Text;
            int rowquantity = int.Parse(GridView1.Rows[rowid].Cells[4].Text.ToString());


            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            conn.Open();
            string findartstock = "select Stock from Art where Art_Name='" + artname + "'";
            SqlCommand findartstockcom = new SqlCommand(findartstock, conn);
            int stocknumber = int.Parse(findartstockcom.ExecuteScalar().ToString());
            conn.Close();
            int updatestock = rowquantity + stocknumber;

            conn.Open();
            SqlCommand updatestock2 = new SqlCommand("UPDATE Art SET Stock=@Stock WHERE Art_Name=@name", conn);
            updatestock2.Parameters.AddWithValue("@Stock", updatestock);
            updatestock2.Parameters.AddWithValue("@name", artname);
            updatestock2.ExecuteNonQuery();
            conn.Close();

        }


    }
}