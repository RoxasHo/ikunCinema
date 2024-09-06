<%@ Page Title="MY CART" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="masterpage1.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        table{
            table-layout:fixed;
            width:80%;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>

    <div style="width:90%;" class="w3-content w3-center w3-main w3-padding">
    <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9);" class="w3-padding-large w3-padding-32 w3-margin-top ">

    <h1>MY CART LIST</h1>
    <asp:GridView style="width:100%; font-size:medium; background-color:cornsilk" ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataKeyNames="Cart_ID,Id,Art_ID1,Cust_ID1" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
            <asp:ImageField DataImageUrlField="image" HeaderText="Image">
            <ControlStyle Height="100px" Width="100px"></ControlStyle>
            <ItemStyle Height="200px" Width="200px"></ItemStyle>
            </asp:ImageField>
            <asp:BoundField DataField="Art_Name" HeaderText="Art Name" SortExpression="Art_Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Art_Price" DataFormatString="{0:C}" HeaderText="Art Price" SortExpression="Art_Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            
            <asp:TemplateField HeaderText="Subtotal" SortExpression="Subtotal">
                <ItemTemplate>
                    <asp:TextBox ID="txtsubtotal" runat="server" Width="100px" BorderStyle="None" BackColor="Cornsilk" ReadOnly="true"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
                
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="LinkButton1" runat="server" CausesValidation="False" OnClick="Remove_Click" CommandName="Delete" Text="Remove"></asp:Button>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="Select C.Username,I.Quantity, * FROM Cart as T
INNER JOIN Cart_Item as I ON I.Cart_ID = T.Cart_ID
INNER JOIN Art as A ON A.Art_ID=I.Art_ID
INNER JOIN Customer as C ON T.Cust_ID = C.Cust_ID
 WHERE ([Username] = @Username) AND Paid_Status = 'Unpaid'" 
        DeleteCommand="Delete FROM Cart_Item WHERE Id=@Id">
    <SelectParameters>
     <asp:SessionParameter DefaultValue="" Name="username" SessionField="Who" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
        <br />
        <table class="auto-style1">
            <tr>
                <td style="text-align:right">
                    <asp:Button ID="BtnBrowse" runat="server" OnClick="BtnBrowse_Click" Text="Browse More" Height="50px" Font-Size="Large" />
                </td>
                <td style="text-align:left">
                    <asp:Button ID="BtnPay" runat="server" OnClick="BtnPay_Click" Text="Checkout" Height="50px" Font-Size="Large" Visible="false"/>
                </td>
            </tr>
        </table>
        </div>
    </div>
</asp:Content>