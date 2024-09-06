<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseHistory.aspx.cs" Inherits="masterpage1.PurchaseHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        table{
            table-layout:fixed;
            width:80%;
            background-color:cornsilk;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>

    

        <form>

            <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9);" class="w3-padding-large w3-padding-32 w3-margin-top ">

                        <div class="w3-center"><h1>MY PURCHASE HISTORY</h1></div>
        

                        <asp:GridView style="width:100%;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                            <Columns>
                                <asp:BoundField DataField="Payment_ID" HeaderText="Payment ID" SortExpression="Payment_ID" />
                                <asp:BoundField DataField="Payment_Date" HeaderText="Payment Date" SortExpression="Payment_Date" DataFormatString="{0:d}"/>
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Purchase_Details_btn" runat="server" CausesValidation="False" Text="View Details"  PostBackUrl='<%# "~/PurchaseDetails.aspx?id=" + Eval("Payment_ID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM Payment as P INNER JOIN Cart as T ON P.Cart_ID = T.Cart_ID  INNER JOIN Customer as C ON T.Cust_ID = C.Cust_ID WHERE ([Username] = @username) AND Paid_Status = 'Paid'">
                            <SelectParameters>
                                <asp:SessionParameter Name="username" SessionField="Who" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                        <br />
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    
                                    <asp:Button ID="back_btn" runat="server" Text="Back" OnClick="back_btn_Click"/>
                                    
                                    <br />
                                </td>
                            </tr>
                        </table>


            </div>

        </form>

  
            

</asp:Content>