using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;
using System.IO;
using System.Data;

namespace masterpage1
{
    public partial class Payment : System.Web.UI.Page
    {
        public int cart_id;
        DateTime today = DateTime.Today;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {

            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        double totalUnitPrice = 0.0;
        int totalQty = 0;
        double totalPrice = 0.0;
        double subtotal = 0.0;
        //to load each row
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                subtotal = 0.0;
                totalUnitPrice = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Art_Price"));
                totalQty = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Quantity"));

                subtotal = totalUnitPrice * totalQty;
                totalPrice += subtotal;
                e.Row.Cells[4].Text = subtotal.ToString("RM0.00");
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[3].Text = "Total";
                e.Row.Cells[3].Font.Bold = true;

                e.Row.Cells[4].Text = totalPrice.ToString("RM0.00");
                e.Row.Cells[4].Font.Bold = true;
            }
            Session["amount"] = totalPrice;
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            string amount = Session["amount"].ToString();
            string cart_id = Session["CARTID"].ToString();
            con1.Open();
            SqlCommand com = new SqlCommand("UPDATE CART SET Paid_Status = 'Paid' WHERE Cart_ID=@Cart_ID", con1);
            com.Parameters.AddWithValue("@Cart_ID", cart_id);
            com.ExecuteNonQuery();
            con1.Close();
            con1.Open();
            string insertQuery1 = "insert into Payment (Payment_Date,Amount,Cart_ID) " +
                "values (@Payment_Date,@Amount,@Cart_ID)";
            SqlCommand com1 = new SqlCommand(insertQuery1, con1);
            com1.Parameters.AddWithValue("@Payment_Date", today);
            com1.Parameters.AddWithValue("@Amount", amount);
            com1.Parameters.AddWithValue("@Cart_ID", cart_id);
            com1.ExecuteNonQuery();
            con1.Close();
            Session.Remove("amount");

            string name = txtFName.Text + " " + txtLName.Text;
            string shipAdd1 = txtAdd.Text;
            string shipAdd2 = txtPostcode.Text + " " + txtCity.Text + "," + ddlState.Text;
            string phoneNum = txtPhone.Text;
            string date = DateTime.Now.ToString();
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[5] { new DataColumn("Image"), new DataColumn("Art_Name"), new DataColumn("Art_Price"), new DataColumn("Quantity"), new DataColumn("Subtotal") });

            Session["Name"] = name;
            Session["ShipAdd1"] = shipAdd1;
            Session["ShipAdd2"] = shipAdd2;
            Session["PhoneNum"] = phoneNum;
            Session["Date"] = date;
            Session["GridData"]=dt;

            using (MailMessage mail = new MailMessage())
            {
                StringWriter sw = new StringWriter();
                HtmlTextWriter htw = new HtmlTextWriter(sw);
                Server.Execute("Email.aspx", htw);

                mail.From = new MailAddress("drawdraw501@gmail.com");
                mail.To.Add(txtEmail.Text);
                mail.Subject = "Thanks for make purchase from Draw Draw Gallery";
                mail.Body = sw.ToString();
                mail.IsBodyHtml = true;
                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new System.Net.NetworkCredential("drawdraw501@gmail.com", "ddraw@501");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Payment successful. Thanks for your purchase.'); window.location.href='Invoice.aspx';", true);
                }
            }

        }
        protected void txtCardNum1_TextChanged(object sender, EventArgs e)
        {
        }

    }
}