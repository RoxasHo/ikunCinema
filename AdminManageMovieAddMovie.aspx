<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdminManageMovieAddMovie.aspx.cs" Inherits="CinemaTicketingSystem.AdminManageMovieAddMovie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: x-large; text-align:left">ADD MOVIE</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Name</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:TextBox ID="MovieName" runat="server" style="font-size: large" Width="100%" placeholder="Enter Movie Name..."></asp:TextBox>
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
                        <asp:TextBox ID="MovieTime" runat="server" style="font-size: large" Width="100%" placeholder="Enter Movie Time..."></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="MovieTime" runat="server" ForeColor="Red"
                            ErrorMessage="Only Numbers allowed" ValidationExpression="\d+" Display="Dynamic" InitialValue="">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter Movie Time" ControlToValidate="MovieTime" ForeColor="Red" ></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter Movie Language" ControlToValidate="MovieLanguage1" ForeColor="Red"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please enter Movie Genre" ControlToValidate="MovieGenre1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: large">Movie Image</td>
                </tr>
                <tr>
                    <td style="font-size: x-large">
                        <asp:FileUpload ID="MovieImg" runat="server" />
                        <asp:RequiredFieldValidator ID="FileRFV" runat="server" ControlToValidate="MovieImg" ErrorMessage="Please Insert Image" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="MovieSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="ADD" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
          </div>  
        </form>
      </div>
    </div>
</asp:Content>