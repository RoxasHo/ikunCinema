using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CinemaTicketingSystem
{
    public partial class MovieDetails : System.Web.UI.Page
    {
        public string id;
        protected void Page_Load(object sender, EventArgs e)
        {
            Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
            id = HttpUtility.ParseQueryString(myUri.Query).Get("id");
        }

        protected void Sqlds_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@movieID"].Value = (id);
        }

        protected void SelectButton_Click(object sender, EventArgs e)
        {
            LinkButton selectButton = (LinkButton)sender;
            string arguments = selectButton.CommandArgument;

            string[] argsArray = arguments.Split('|');

            if (argsArray.Length >= 2)
            {
                string timeTableID = argsArray[0];
                string hallID = argsArray[1];

                Response.Redirect("/Seat.aspx?movieID=" + id + "&timeTableID=" + timeTableID + "&hallID=" + hallID);
            }

            

        }
    }
}