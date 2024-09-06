<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="CinemaTicketingSystem.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: x-large; text-align:left">RESET PASSWORD</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">Current Password</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="CurrentPassword" runat="server" TextMode="Password" style="font-size: large" Width="100%" placeholder="Enter Current Password..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Current Password" ControlToValidate="CurrentPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">New Password</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="NewPassword" runat="server" TextMode="Password" style="font-size: large" Width="100%" placeholder="Enter New Password..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter New Password" ControlToValidate="NewPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Confirm Password</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" style="font-size: large" Width="100%" placeholder="Enter New Password Again..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter New Password again" ControlToValidate="ConfirmPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="PasswordSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="SUBMIT" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
</asp:Content>
