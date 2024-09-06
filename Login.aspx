<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CinemaTicketingSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-image: url('https://as2.ftcdn.net/v2/jpg/01/54/76/07/1000_F_154760711_C3jq59wTGrNVmIyB8DI54qkdlP6QBxZD.jpg'); background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div style="margin-left: 40%;border-radius: 0 15px 15px 0;" class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 24px; font-size: xx-large; text-align:left"><strong>WELCOME</strong></td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">Login to Your Account</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">Phone Number</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="LoginID" runat="server" style="font-size: large" Width="100%" placeholder="Enter your Phone Number..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your Phone Number" ControlToValidate="LoginID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px; font-size: large">Password</td>
                </tr>
                <tr>
                    <td style="height: 26px; font-size: x-large">
                        <asp:TextBox ID="LoginPassword" runat="server" style="font-size: large" Width="100%" TextMode="Password" placeholder="Enter your password..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your Password" ControlToValidate="LoginPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="LoginSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="Login" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
      <div style="border: solid 1px gray;border-radius: 20px; margin-top: 15px;" class=" login ">
        <h2 style="font-size:18px;text-align:center">New Here? <a class="w3-text-blue" runat="server" href="Register.aspx">Create an account.</a></h2>
      </div>
    </div>
</asp:Content>
