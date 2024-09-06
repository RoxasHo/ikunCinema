<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CinemaTicketingSystem.Register" %>
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
                        <asp:TextBox ID="RegisterID" runat="server" style="font-size: large" Width="100%" placeholder="Enter your Phone Number..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your Phone Number" ControlToValidate="RegisterID" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">User Name</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="RegisterName" runat="server" style="font-size: large" Width="100%" placeholder="Enter your User Name..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter your User Name" ControlToValidate="RegisterName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Gender</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:DropDownList ID="RegisterGender" runat="server" style="font-size: large" Width="100%">
                            <asp:ListItem Text="Select a gender" Value="" />
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please select your Gender" ControlToValidate="RegisterGender" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Email</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="RegisterEmail" runat="server" style="font-size: large" Width="100%" placeholder="Enter your Email..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter your Email" ControlToValidate="RegisterName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="height: 26px; font-size: large">Password</td>
                </tr>
                <tr>
                    <td style="height: 26px; font-size: x-large">
                        <asp:TextBox ID="RegisterPassword" runat="server" style="font-size: large" Width="100%" TextMode="Password" placeholder="Enter your password..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please enter your Password" ControlToValidate="RegisterPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="RegisterSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="Register" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
</asp:Content>

