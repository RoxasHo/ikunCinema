<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="masterpage1.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width:30%;"  class="w3-content w3-padding-large w3-margin-top ">
        <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
        <table style="width: 100%">
                  <tr>
                      <td class="w3-center" style="height: 26px; font-size: xx-large;"><strong>Profile</strong></td>
                  </tr>
                  <tr>
                      <td style="font-size: medium; height: 34px;"></td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">Name</td>
                  </tr>
                  <tr>
                      <td >
                          <asp:Label ID="ProfileName" runat="server" style="font-size: x-large" Text="Name"></asp:Label>
                      </td>
                      
                  </tr>
                  <tr>
                      <td>
                          &nbsp;</td>
                  </tr>
                  
                  <tr>
                      <td style="font-size: x-large">Email</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="ProfileEmail" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your email address..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is required" ControlToValidate="ProfileEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">Contact</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="ProfileContact" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your contact number..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Contact number is required" ControlToValidate="ProfileContact" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">Address</td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">
                          <asp:TextBox ID="ProfileAddress" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your address..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Addres is required" ControlToValidate="ProfileAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Button ID="UpdateSubmit" runat="server" OnClick="Button1_Click" style="font-size: x-large" class="w3-button w3-block w3-black" Text="Update" Width="100%" />
                      </td>
                  </tr>
              </table>
            </div>
        </div>

    <div class="w3-center w3-content">

        <form >

            <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9);" class="w3-center w3-padding-large w3-padding-32 w3-margin-top ">

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

    </div>
    
    

</asp:Content>
