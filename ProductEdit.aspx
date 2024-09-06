<%@ Page Title="Product Edit" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductEdit.aspx.cs" Inherits="masterpage1.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

            

            

            
            <br />
            <table style="width: 100%">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="w3-right-align">Amount : </td>
                    <td style="width: 40%; height: 31px;">
                        <asp:TextBox ID="AmountNumber" runat="server" min="0" style="font-size: medium" TextMode="Number"></asp:TextBox>
&nbsp;
                        <asp:Button ID="ChangeAmonut" runat="server" OnClick="ChangeAmount_Click" Text="Update" style="font-size: medium"   />
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
