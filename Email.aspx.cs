using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage1
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {
                lblName.Text = Session["Name"].ToString();
                lblName1.Text = Session["Name"].ToString();
                lblAdd1.Text = Session["ShipAdd1"].ToString();
                lblAdd2.Text = Session["ShipAdd2"].ToString();
                lblPhoneNum.Text = Session["PhoneNum"].ToString();
                lblDate.Text = Session["Date"].ToString();
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

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                subtotal = 0.0;
                totalUnitPrice = Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Art_Price"));
                totalQty = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Quantity"));

                subtotal = totalUnitPrice * totalQty;
                totalPrice += subtotal;
                e.Row.Cells[3].Text = subtotal.ToString("RM0.00");
            }
            else if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Total";
                e.Row.Cells[2].Font.Bold = true;

                e.Row.Cells[3].Text = totalPrice.ToString("RM0.00");
                e.Row.Cells[3].Font.Bold = true;
            }
        }
    }
}