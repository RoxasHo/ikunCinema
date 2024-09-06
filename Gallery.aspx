<%@ Page Title="HOME" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="masterpage1.About" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width:90%;" class="w3-content w3-center w3-main w3-padding">

        <form >

            <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9);" class="w3-padding-large w3-padding-32 w3-margin-top ">
                    
            <h1 style="text-align:center">Gallery</h1>
            <hr style="width:100%;border:5px solid black" class="w3-round">
            <br />


            <asp:DataList  ID="dl" runat="server" RepeatColumns="4" DataKeyField="Art_ID" DataSourceID="SqlDataSource2" HorizontalAlign="Center" RepeatDirection="Horizontal">
                <ItemTemplate >
                    <table  style="cursor: pointer;border: solid 1px gray;background: rgba(191, 191, 191, 0.5);" class=" w3-hover-light-blue">
                        
                        <tr >

                            <td rowspan="2">
                                <a href="/ProductDetails.aspx?id=<%# Eval("Art_ID") %>">
                                <img src="<%#Eval("Image") %>"" height="200" width="200"/>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                        <tr></tr>
                        <tr>
                            <td style="text-align:center" >
                                <h3>
                                    Name: <%#Eval("Art_Name") %>
                                </h3>
                                <h4 style="color:gray">
                                    Artist: <%#Eval("Username") %>
                                </h4>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT C.Username, * 
FROM Art as A
INNER JOIN Artist as T ON A.Artist_ID = T.Artist_ID
INNER JOIN Customer as C ON T.Artist_ID = C.Artist_ID">
                        </asp:SqlDataSource>
        
            </div>
            
        </form>

    </div>

</asp:Content>