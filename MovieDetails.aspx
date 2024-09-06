<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="CinemaTicketingSystem.MovieDetails" %>

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
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="6" DataKeyField="timeTableID" DataSourceID="SqlDataSource1"  HorizontalAlign="Center" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="timetable-item" style="width: 13vw; height: 9vw">
                        <p style="color: white;"><i class="fa fa-calendar" aria-hidden="true"></i> :<%# Eval("date", "{0:dd/MM/yyyy}") %></p>
                        <p style="color: white;"><i class="fa fa-clock-o" aria-hidden="true"></i> : <%# Eval("startTime") %></p>
                        <p style="color: white;"><i class="fa fa-home" aria-hidden="true"></i> : <%# Eval("hallID") %></p>
                        <div class="timetable-info">
                            <asp:LinkButton ID="SelectButton" runat="server" OnClick="SelectButton_Click" CommandArgument='<%# $"{Eval("timeTableID")}|{Eval("hallID")}" %>'>
                                <div class="noneLinkStyle adminbutton5">
                                    Select
                                </div>
                            </asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>

        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [TimeTable] WHERE ([movieID] = @movieID AND ([date] > GETDATE() OR ([date] = GETDATE() AND [startTime] > CONVERT(TIME, GETDATE()))))" OnSelecting="Sqlds_Selecting">
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
