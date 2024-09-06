using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaTicketingSystem
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void MovieSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string paymentMethod = DropDownPayment.SelectedValue;

            // Store values in session state
            Session["Name"] = name;
            Session["PaymentMethod"] = paymentMethod;

            Response.Redirect("PaymentSuccessful.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}