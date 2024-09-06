<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="masterpage1.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        table{
            table-layout:fixed;
            width:80%;
        }
            .auto-style1 {
                height: 26px;
            }
    </style>
    

    <h1>My Payment</h1>
    <div id="divFirst" style="width:48%; float:left; background-color:rgba(255, 248, 220, 0.6); margin-left:20px">
        <div style="margin:20px 20px 20px 20px">
            <h2>Order Summary</h2>
        <asp:GridView style="width:80%; margin-left:50px; text-align:center" ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                 <asp:ImageField DataImageUrlField="image" HeaderText="Image">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                    <ItemStyle Height="200px" Width="200px"></ItemStyle>
                 </asp:ImageField>
                 <asp:BoundField DataField="Art_Name" HeaderText="Art Name" SortExpression="Art_Name" />
                 <asp:BoundField DataField="Art_Price" HeaderText="Art Price" SortExpression="Art_Price" />
                 <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:TemplateField HeaderText="Subtotal" SortExpression="Subtotal">
                    <ItemTemplate>
                        <asp:TextBox ID="txtsubtotal" runat="server" Width="100px" BorderStyle="None" BackColor="transparent" ReadOnly="true"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="Select * FROM Cart as T
INNER JOIN Cart_Item as I ON I.Cart_ID = T.Cart_ID
INNER JOIN Art as A ON A.Art_ID=I.Art_ID
INNER JOIN Customer as C ON T.Cust_ID = C.Cust_ID
 WHERE ([Username] = @Username) AND Paid_Status = 'Unpaid'">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="username" SessionField="Who" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        
    </div>
    
    <div style="width:48%; float:right; background-color:rgba(255, 248, 220, 0.6); height:fit-content; margin-right:20px">
        <div style="margin:20px 20px 20px 20px">
                <table>
                    <tr>
                        <td colspan="2"><h2>Contact Details</h2></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Text="Email "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ForeColor="red" ErrorMessage="Email is Required" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                        </td>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ForeColor="red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail">Invalid Email Format</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblFName" runat="server" Text="First Name "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                        
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" ForeColor="red" ErrorMessage="First Name is Required" ControlToValidate="txtFName">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RegularExpressionValidator ID="revFName" runat="server" ForeColor="red" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ErrorMessage="Please enter character only" ControlToValidate="txtFName"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLName" runat="server" Text="Last Name "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ForeColor="red" ErrorMessage="Last Name is Required" ControlToValidate="txtLName">*</asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RegularExpressionValidator ID="revLName" runat="server" ForeColor="red" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ErrorMessage="Please enter character only" ControlToValidate="txtLName"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPhone" runat="server" Text="Phone Number "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                           
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ForeColor="red" ErrorMessage="Phone Number is Required" ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" ValidationExpression="\d{2,3}-\d{7,8}" ForeColor="Red">Please enter valid phone number with &#39;-&#39;</asp:RegularExpressionValidator>  
                        </td>
                    </tr>
                    </table>
            
              
                <table>
                <tr>
                    <td colspan="2"><h2>Shipping Details</h2></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblShipAdd" runat="server" Text="Shipping Address "></asp:Label></td>
                    <td>

                        <asp:TextBox ID="txtAdd" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvAdd" runat="server" ForeColor="red" ErrorMessage="Address is Required" ControlToValidate="txtAdd">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr><td></td><td>&nbsp;</td></tr>
                <tr>
                    <td><asp:Label ID="lblCity" runat="server" Text="City"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtCity" MaxLength="50" runat="server"></asp:TextBox>
                      
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="txtCity" ForeColor="Red" ErrorMessage="City is Required">*</asp:RequiredFieldValidator>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revCity" runat="server" ControlToValidate="txtCity" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" ErrorMessage="Please enter character only" ForeColor="Red" ValidationGroup="2"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr><td>
                    <asp:Label ID="lblPostcode" runat="server" Text="Postcode"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPostcode" MaxLength="5" runat="server"></asp:TextBox>
                       
                        <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ControlToValidate="txtPostcode" ErrorMessage="Postcode is Required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revPostcode" runat="server" ValidationExpression="\d{5}" ControlToValidate="txtPostcode" ErrorMessage="Please enter 5 digit only" ForeColor="Red" ValidationGroup="2"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server">
                        <asp:ListItem Selected="True">Federal Territory of Kuala Lumpur</asp:ListItem>
                        <asp:ListItem>Johor</asp:ListItem>
                        <asp:ListItem>Kedah</asp:ListItem>
                        <asp:ListItem>Kelantan</asp:ListItem>
                        <asp:ListItem>Malacca</asp:ListItem>
                        <asp:ListItem>Negeri Sembilan</asp:ListItem>
                        <asp:ListItem>Pahang</asp:ListItem>
                        <asp:ListItem>Penang</asp:ListItem>
                        <asp:ListItem>Perak</asp:ListItem>
                        <asp:ListItem>Perlis</asp:ListItem>
                        <asp:ListItem>Sabah</asp:ListItem>
                        <asp:ListItem>Sarawak</asp:ListItem>
                        <asp:ListItem>Selangor</asp:ListItem>
                        <asp:ListItem>Terengganu</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr><td></td><td></td></tr>
                </table>
                <table>
                <tr>
                    <td colspan="4"><h2>Payment Details</h2><p style="font-size:smaller">[Supports locally-issued Visa/Mastercard credit & debit cards]</p></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblChdName" runat="server" Text="Card Holder Name "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtChdName" runat="server" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvChdName" runat="server" ForeColor="red" ErrorMessage="Card Holder Name is Required" ControlToValidate="txtChdName">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revChdName" runat="server" ForeColor="red" ValidationExpression="^[a-zA-Z'.\s]{1,50}" ErrorMessage="Please enter character only" ControlToValidate="txtChdname"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblCardNum" runat="server" Text="Card Number "></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCardNum" runat="server" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCardNum" runat="server" ForeColor="red" ErrorMessage="Card Number is Required" ControlToValidate="txtCardNum">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revCardNum" runat="server" ForeColor="red" ValidationExpression="(^4[0-9]{12}(?:[0-9]{3})?$)|(^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$)" ErrorMessage="Please valid Visa/Master Card Format!" ControlToValidate="txtCardNum"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <table>
                <tr style="text-align:center">
                    <td rowspan="2"><asp:Label ID="lblExpCVV" runat="server" Text="<b>Expiration Date and CVV :-</b>"></asp:Label></td>
                    <td>
                        <asp:Label ID="lblExpDate" runat="server" Text="MM/YY"></asp:Label>
                    </td>
                    <td><asp:Label ID="lblCVV" runat="server" Text="CVV"></asp:Label></td>
                </tr>
                <tr style="text-align:center">
                    <td class="auto-style1">
                        <asp:TextBox ID="txtExpDate" runat="server" MaxLength="5" Width="100px" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvExpDate" runat="server" ForeColor="red" ErrorMessage="Expiration Date is Required" ControlToValidate="txtExpDate">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtCVV" runat="server" MaxLength="3" Width="50px" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ForeColor="red" ErrorMessage="CVV is Required" ControlToValidate="txtCVV">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr style="text-align:center">
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="revExpDate" runat="server" ForeColor="red" ValidationExpression="^(0[1-9]|1[0-2])\/(2[2-9]|3[0-9]|4[0])$" ErrorMessage="MM/YY can find on front of your card" ControlToValidate="txtExpDate"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="revCVV" runat="server" ForeColor="red" ValidationExpression="\d{3}" ErrorMessage="CVV is 3-digit number on the back of your card" ControlToValidate="txtCVV"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red"/>

        <div style="text-align:center"><asp:Button ID="btnNext" runat="server" Font-Size="Medium" Text="Pay" OnClick="btnNext_Click" /></div>

        </div>
        

    </div>
</asp:Content>