<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Administration.aspx.cs" Inherits="CinemaTicketingSystem.Administration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="adminHome">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Cinema Movie" CssClass="adminheader"></asp:Label>
        </div>

        <div class="adminmain">
            <button type="button" class="adminbutton" onclick="window.location.href='/AdminManageMovieSelectMovie.aspx'">Manage Movies</button>
            <button type="button" class="adminbutton" onclick="window.location.href='/AdminTimeTableSelectMovie.aspx'">Time Table</button>
        </div>
    </div>
</asp:Content>
