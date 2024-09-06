<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="CinemaTicketingSystem.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%; height: 720px;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: x-large; text-align:left; font-weight: bold;">PAYMENT</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">NAME</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="txtName" runat="server" style="font-size: large" Width="100%" placeholder="Enter your name..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your name." ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">CONTACT NUMBER</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="txtContactNumber" runat="server" style="font-size: large" Width="100%" placeholder="Enter contact number..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your contact number." ControlToValidate="txtContactNumber" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtContactNumber" ValidationExpression="\d{2,3}-\d{7,8}" ForeColor="Red">Please enter valid phone number format with &#39;-&#39;</asp:RegularExpressionValidator>  
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large; height: 38px;">EMAIL</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="txtEmail" runat="server" style="font-size: large" Width="100%" placeholder="Enter email..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px">
                         <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="red" ErrorMessage="Please enter your email address." ControlToValidate="txtEmail"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" runat="server" ForeColor="Red"
                            ErrorMessage="Please enter the valid format of email." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">PAYMENT METHOD</td>
                </tr>
                <tr>
                    <td style="font-size: x-large; height: 49px;">
                        
                        <asp:DropDownList ID="DropDownPayment" runat="server" Width="251px">
                            <asp:ListItem>Mastercard</asp:ListItem>
                            <asp:ListItem>Visa</asp:ListItem>
                            <asp:ListItem>FPX</asp:ListItem>
                            <asp:ListItem>TnG</asp:ListItem>
                        </asp:DropDownList>
                        
                    </td>
                     <tr>
                    <td style="font-size: large; height: 56px;">CARD NUMBER</td>
                         <td style="font-size: x-large; height: 56px;">
                        
                    </td>
                </tr>
                </tr>
                <tr>
                    <td style="height: 38px;">                        <asp:TextBox ID="txtCardNum" runat="server" style="font-size: large" Width="100%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCardNum" runat="server" ForeColor="red" ErrorMessage="Please enter your card number." ControlToValidate="txtCardNum"></asp:RequiredFieldValidator><br />
                         <asp:RegularExpressionValidator ID="revCardNum" runat="server" ForeColor="red" ValidationExpression="(^4[0-9]{12}(?:[0-9]{3})?$)|(^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$)" ErrorMessage="Please enter valid Visa/Master Card number format." ControlToValidate="txtCardNum"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table style="width:100%;">
                            <tr>
                                <td style="height: 66px; width: 132px"><asp:Button ID="MovieSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="CONFIRM
                            " Width="141px" OnClick="MovieSubmit_Click" /></td>
                               <td style="height: 66px; width: 132px"><asp:Button ID="Button1" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="CANCEL
                            " Width="141px" OnClick="Button1_Click" /></td>
                                <td style="height: 66px"></td>
                            </tr>
                            
                        </table></td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
</asp:Content>