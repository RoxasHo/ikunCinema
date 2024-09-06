<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminManageMovieEditDetails.aspx.cs" Inherits="CinemaTicketingSystem.AdminManageMovieEditDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
                <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: large; text-align:left">EDIT MOVIE</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Name</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="movieName" runat="server" style="font-size: large" Width="100%" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter Movie Name" ControlToValidate="MovieName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Time</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="movieTime" runat="server" style="font-size: large" Width="100%" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="MovieTime" runat="server" ForeColor="Red"
                            ErrorMessage="Only Numbers allowed" ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter Movie Time" ControlToValidate="MovieTime" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Language</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:DropDownList ID="MovieLanguage1" runat="server" style="font-size: large" Width="100%">
                            <asp:ListItem Text="Select a Language" Value="" />
                            <asp:ListItem Value="Chinese">Chinese</asp:ListItem>
                            <asp:ListItem Value="English">English</asp:ListItem>
                            <asp:ListItem Value="Malay">Malay</asp:ListItem>
                            <asp:ListItem Value="Japanese">Japanese</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Select Movie Language" ControlToValidate="MovieLanguage1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Subtitle</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:CheckBoxList ID="MovieSubtitleCheckBoxList" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="CN" Value="CN" />
                            <asp:ListItem Text="EN" Value="EN" />
                            <asp:ListItem Text="BM" Value="BM" />
                        </asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Genre</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:DropDownList ID="MovieGenre1" runat="server" style="font-size: large" Width="100%">
                            <asp:ListItem Text="Select a Genre" Value="" />
                            <asp:ListItem Value="Action">Action</asp:ListItem>
                            <asp:ListItem Value="Horror">Horror</asp:ListItem>
                            <asp:ListItem Value="Animation">Animation</asp:ListItem>
                            <asp:ListItem Value="Drama">Drama</asp:ListItem>
                            <asp:ListItem Value="Fantasy">Fantasy</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select Movie Genre" ControlToValidate="MovieGenre1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="MovieSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="EDIT" OnClick="MovieSubmit_Click" />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Movie] WHERE ([movieID] = @movieID)" OnSelecting="Sqlds_Selecting">
        <SelectParameters>
            <asp:Parameter Name="movieID" Type="String"/>
        </SelectParameters>  
    </asp:SqlDataSource>
</asp:Content>
