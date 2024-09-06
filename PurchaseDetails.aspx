<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PurchaseDetails.aspx.cs" Inherits="masterpage1.PaymentDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div style="width:90%;" class="w3-content w3-center w3-main w3-padding">

        <form>
            <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9);" class="w3-padding-large w3-padding-32 w3-margin-top ">

                <h2>PURCHASE HISTORY</h2>
    <asp:GridView style="width:100%;" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:ImageField DataImageUrlField="image" HeaderText=" Image"
            ControlStyle-Width="200" ItemStyle-Width="200"
            ControlStyle-Height="200" ItemStyle-Height="200" >
<ControlStyle Height="200px" Width="200px"></ControlStyle>

<ItemStyle Height="200px" Width="200px"></ItemStyle>
            </asp:ImageField>
            <asp:BoundField DataField="Art_Name" HeaderText="Art_Name" SortExpression="Art_Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Art_Price" DataFormatString="{0:C}" HeaderText="Art_Price" SortExpression="Art_Price" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="Select I.Quantity, * FROM Cart as T
INNER JOIN Payment as P ON P.Cart_ID = T.Cart_ID
INNER JOIN Cart_Item as I ON I.Cart_ID = T.Cart_ID
INNER JOIN Art as A ON A.Art_ID=I.Art_ID
INNER JOIN Customer as C ON T.Cust_ID = C.Cust_ID
WHERE ([Payment_ID] = @Payment_ID)" OnSelecting="Sqlds_Selecting">
    <SelectParameters>
     <asp:Parameter Name="Payment_ID" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>

                <br />
                <asp:Button ID="Back_btn" runat="server" OnClick="Back_btn_Click" Text="Back" Width="97px" />

            </div>
        </form>
    </div>
</asp:Content>