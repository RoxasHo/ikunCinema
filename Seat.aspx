<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Seat.aspx.cs" Inherits="CinemaTicketingSystem.Seat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="adminHome">
        <div class="manageMovie">
            <asp:DataList ID="DataList2" runat="server" RepeatColumns="4" DataKeyField="movieID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="movie-container">
                        <div class="movie-item2">
                            <img src="Image/<%# Eval("movieID") %>.jpg" style="width: 20vw; height: 30vw; margin-top: 10px;" />
                        </div>
                        <div class="movie-info2">
                            <p style="font-size: 48px; line-height: 1; margin-bottom: 10px;"><%# Eval("movieName") %></p>
                            <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-clock-o" aria-hidden="true"></i> : <%# Eval("movieTime") %>min</p>
                            <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-volume-up" aria-hidden="true"></i> : <%# Eval("movieLanguage") %></p>
                            <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-commenting" aria-hidden="true"></i> : <%# Eval("movieSubtitle") %></p>
                            <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-tag" aria-hidden="true"></i> : <%# Eval("movieGenre") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="Label1" runat="server" Style="padding: 2em;" Text="Time Table" CssClass="adminheader"></asp:Label>
        </div>
            
        <div class="margintimetable">
            <div class="login">
                <table style="width: 100%">
                    <tr>
                        <td style="height: 32px; font-size: x-large; text-align:left">Select Seat</td>
                    </tr>
                    <tr>
                        <td style="height: 14px; font-size: large; text-align:left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlSeat" runat="server">
                                <asp:ListItem Text="Select a Seat" Value="" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please select seat" ControlToValidate="ddlSeat" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="MovieSubmit" runat="server" style="font-size: large; margin-top: 10px;" class="w3-button w3-block w3-black" Text="Submit" OnClick="Button1_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>


            
            
        </div>

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [TimeTable] WHERE ([movieID] = @movieID)" OnSelecting="Sqlds_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="movieID" Type="String"/>
                </SelectParameters>  
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Movie] WHERE ([movieID] = @movieID)" OnSelecting="Sqlds_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="movieID" Type="String"/>
                </SelectParameters>  
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>


