<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminTimeTableAddTime.aspx.cs" Inherits="CinemaTicketingSystem.AdminTimeTableAddTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: x-large; text-align:left">ADD TIME</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Start Time</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="MovieTime" runat="server" style="font-size: large" Width="100%" placeholder="Enter Movie Time..." TextMode="Time"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a time" ControlToValidate="MovieTime" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Hall ID</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:DropDownList ID="HallDropDown" runat="server" style="font-size: large" Width="100%">
                            <asp:ListItem Text="Select a Hall" Value="" />
                            <asp:ListItem Value="H001">H001</asp:ListItem>
                            <asp:ListItem Value="H002">H002</asp:ListItem>
                            <asp:ListItem Value="H003">H003</asp:ListItem>
                            <asp:ListItem Value="H004">H004</asp:ListItem>
                            <asp:ListItem Value="H005">H005</asp:ListItem>
                            <asp:ListItem Value="H006">H006</asp:ListItem>
                            <asp:ListItem Value="H007">H007</asp:ListItem>
                            <asp:ListItem Value="H008">H008</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select a hall" ControlToValidate="HallDropDown" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="MovieSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="ADD" OnClick="MovieSubmit_Click"  />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
</asp:Content>
