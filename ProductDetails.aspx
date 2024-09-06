<%@ Page Title="Product Detail"  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="masterpage1.ProductDetails" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="w3-content w3-center w3-main  w3-padding">

        <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.95);" class="w3-padding-large w3-padding-32 w3-margin-top ">

            <asp:DataList ID="DataList1" runat="server" DataKeyField="Art_ID" DataSourceID="SqlDataSource1" style="width: 100%">
                <ItemTemplate>
            
            <table style="width: 100%;background: rgba(255, 255, 255, 0.40)">
                <tr>
                    <td rowspan="10" style="width: 27px"><img src="<%# Eval("Image") %>"" height="400" width="400"/>&nbsp;</td>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align"><span style="font-size: xx-large">Name         : <%# Eval("Art_Name") %>
                        </span>&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align"><span style="font-size: x-large">Price      : <%#Eval("Art_Price") %></span>&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align"><span style="font-size: large">Stock       : <%#Eval("Stock") %></span>&nbsp;</td>
                </tr>
                <tr  style="width: 100%">
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align"><span style="font-size: large">Description : <%#Eval("Description") %></span>&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="height: 34px; width: 4px;">&nbsp;</td>
                    <td class="w3-left-align" style="height: 34px"></td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align">&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align">&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align">&nbsp;</td>
                </tr>
                <tr>
                    <td class="w3-left-align" style="width: 4px">&nbsp;</td>
                    <td class="w3-left-align">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 4px">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 27px"><span style="font-size: large">Artist: <%#Eval("Username") %>
                        </span></td>
                    <td style="width: 4px" >&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            </ItemTemplate>
            </asp:DataList>

            <table style="width: 100%; height: 40px;">
                <tr>
                    <td style="width: 100px; height: 31px;">
                        <asp:Button ID="Wishlist" runat="server" class="fa" Text="&#xf08a; Add to Wishlist" OnClick="Wish_Click" style="font-size: medium" Width="200px"/>
                    </td>
                    <td style="height: 31px"></td>
                    <td style="height: 31px"></td>
                    <td style="height: 31px">
                        
                    </td>
                    <td style="width: 40%; height: 31px; font-size: medium ; text-align:right">
                        <asp:Label ID="lblQty" runat="server" Text="Quantity :"></asp:Label>
                        <asp:TextBox ID="AmountNumber" runat="server" style="font-size: medium" Width="60px" min="0" TextMode="Number" Text="0"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="AddToCart" runat="server" OnClick="AddCart_Click" class="fa" Text="&#xf217; Add To Cart" style="font-size: medium" Width="200px"/>
                    </td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT C.Username, * 
FROM Art as A
INNER JOIN Artist as T ON A.Artist_ID = T.Artist_ID
INNER JOIN Customer as C ON T.Artist_ID = C.Artist_ID WHERE ([Art_ID] = @Art_ID)" OnSelecting="Sqlds_Selecting">
                <SelectParameters>
                    <asp:Parameter Name="Art_ID" Type="String"/>
                </SelectParameters>          
            </asp:SqlDataSource>

            </div>
    </div>

</asp:Content>

