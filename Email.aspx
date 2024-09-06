<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="masterpage1.WebForm8" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Invoice</title>
</head>
<body style="background-color:white">
    <form id="form1" runat="server">
        <section>
            <div>
                <h1>Invoice</h1>
                Hi, <asp:Label ID="lblName" runat="server" Text=""></asp:Label>, here is your invoice.
            </div><br />
            <div style="width:100%">
                <div style="width:47%; float:left; margin-left:3%">
                    Draw Draw Gallery<br />
                    1, Lorong Satu 1, Taman Satu,<br />
                    53300 Setapak, Kuala Lumpur<br />
                    012-3456789<br /><br />
                </div>
                <div style="width:50%; float:right">
                    <table style="width:100%">
                        <tr>
                            <td style="width:25%">Bill To :</td>
                            <td><asp:Label ID="lblName1" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:20%">Shipping Address :</td>
                            <td><asp:Label ID="lblAdd1" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:20%"></td>
                            <td><asp:Label ID="lblAdd2" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:20%">Phone Number :</td>
                            <td><asp:Label ID="lblPhoneNum" runat="server" Text=""></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width:20%">Order Date :</td>
                            <td><asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                        
                        </tr>
                    </table>
                </div>
            </div><br /><br />
        </section>
        <section>
            <div style="float:left; width:100%">
                <h3 style="text-align:center; width:100%">Purchase Details</h3>
            
                <asp:GridView ID="GridView1" runat="server" RowStyle-Width="10%" HorizontalAlign="Center" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="Art_Name" HeaderText="Art_Name" SortExpression="Art_Name" />
                        <asp:BoundField DataField="Art_Price" HeaderText="Art_Price" DataFormatString="{0:C}" SortExpression="Art_Price" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:TemplateField HeaderText="Subtotal"  SortExpression="Subtotal">
                            <ItemTemplate>
                                <asp:TextBox ID="txtSubtotal" runat="server"  BackColor="transparent" Width="100px" BorderStyle="None" ReadOnly="true"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="Select * FROM Cart as T
INNER JOIN Cart_Item as I ON I.Cart_ID = T.Cart_ID
INNER JOIN Art as A ON A.Art_ID=I.Art_ID
WHERE (T.Cart_ID = @CARTID)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="CARTID" SessionField="CARTID" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </section>
        <section style="width:100%; float:left;">
            <div style="text-align:center">
                <h2>Thank you for your purchase.</h2>
            </div><br />
            <div style="text-align:center">
                
            </div>
        </section>
    </form>
</body>
</html>
