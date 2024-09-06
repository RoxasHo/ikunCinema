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
    public partial class PaymentDetails : System.Web.UI.Page
    {
        public int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Who"] != null)
            {


                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
                Uri myUri = new Uri(HttpContext.Current.Request.Url.AbsoluteUri);
                id = int.Parse(HttpUtility.ParseQueryString(myUri.Query).Get("id"));
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void Sqlds_Selecting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters["@Payment_ID"].Value = (id);
        }

        protected void Back_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("PurchaseHistory.aspx");
        }
    }
}


<!--asp:DataList ID="DataList3" runat="server" RepeatColumn="4" DataKeyField="timeTableID" DataSourceID="SqlDataSource2" ForeColor="#333333" HorizontalAlign="Center" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="date-button">
                            <p1><%# Eval("dayName") %></p1>
                            <p2><%# Eval("justDay") %></p2>
                            <p3><%# Eval("justYear") %></p3>
                            <button type="button" class="noneLinkStyle w3-button w3-block w3-black" onclick="formDate" 
                            style="position: absolute; bottom: 10%; width: 80%; height: 10%;">
                            BUY NOW
                        </button>
                        </div>
                    </ItemTemplate>
                </!--asp:DataList-->

<asp:DataList ID="DataList4" runat="server" RepeatColumn="4" DataKeyField="timeTableID" DataSourceID="SqlDataSource3" ForeColor="#333333" HorizontalAlign="Center" RepeatDirection="Horizontal" >
                    <ItemTemplate>
                        <div class="time-button">
                            <p1><%# DateTime.Parse(Eval("startTime").ToString()).ToString("hh:mm") %></p1>
                            <p2><%# DateTime.Parse(Eval("startTime").ToString()).ToString("tt") %></p2>
                        </div>
                    </ItemTemplate>
                </asp:DataList>