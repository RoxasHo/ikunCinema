<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NowShowing.aspx.cs" Inherits="CinemaTicketingSystem.NowShowing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="marginTop2 paddingbottom">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Now Showing" CssClass="nowShowheader"></asp:Label>
        </div>
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" DataKeyField="movieID" DataSourceID="SqlDataSource1" HorizontalAlign="Center" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="movie-item">
                    <img src="<%# Eval("movieImage") %>" style="width: 20vw; height: 30vw" />
                    <div class="movie-info">
                        <p style="font-size: 48px; line-height: 1; margin-top: 30%; margin-bottom: 10px;"><%# Eval("movieName") %></p>
                        <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-clock-o" aria-hidden="true"></i> : <%# Eval("movieTime") %>min</p>
                        <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-volume-up" aria-hidden="true"></i> : <%# Eval("movieLanguage") %></p>
                        <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-commenting" aria-hidden="true"></i> : <%# Eval("movieSubtitle") %></p>
                        <p style="font-size: 18px; line-height: 1; margin-top: 0; margin-bottom: 10px;"><i class="fa fa-tag" aria-hidden="true"></i> : <%# Eval("movieGenre") %></p>
                        
                        <button type="button" class="noneLinkStyle w3-button w3-block w3-black" onclick="window.location.href='/MovieDetails.aspx?id=<%# Eval("movieID") %>'" 
                            style="position: absolute; bottom: 10%; width: 80%; height: 10%;">
                            BUY NOW
                        </button>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT M.*
FROM Movie M
JOIN TimeTable TT ON M.movieID = TT.movieID
WHERE TT.date &gt; GETDATE() OR (TT.date = GETDATE() AND TT.startTime &gt; CONVERT(TIME, GETDATE()))" OnSelecting="SqlDataSource1_Selecting">
        </asp:SqlDataSource>
    </div>
</asp:Content>
