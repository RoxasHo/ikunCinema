using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaTicketingSystem
{
    public partial class History : System.Web.UI.Page
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

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterParameters.Clear();

            if (!string.IsNullOrEmpty(txtStartDate.Text) && !string.IsNullOrEmpty(txtEndDate.Text))
            {
                // Set the filter parameters for date range
                SqlDataSource1.FilterExpression = "date >= #{0}# AND date <= #{1}#";
                SqlDataSource1.FilterParameters.Add("StartDate", TypeCode.DateTime, txtStartDate.Text);
                SqlDataSource1.FilterParameters.Add("EndDate", TypeCode.DateTime, txtEndDate.Text);
            }
            else
            {
                // Clear the filter parameters if textboxes are empty
                SqlDataSource1.FilterExpression = string.Empty;
                SqlDataSource1.FilterParameters.Clear();
            }

            // Refresh the GridView
            GridView1.DataBind();

        }


    }
}