<%@ Page Title="Artist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistHome.aspx.cs" Inherits="masterpage1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div   class="w3-content w3-padding-large w3-margin-top ">

        <div style="width:90%;"  class="w3-content w3-padding-large w3-margin-top ">
            <form>
                <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
                    <h1 style="text-align:center">Post</h1>
                    <br />
                    <center>
                        <table>
                            <tr >
                                <td>
                                    <h3> Art Name : </h3>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="nametxt" runat="server" Width="220px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ArtRFV" runat="server" ErrorMessage="Please Insert Art Name" ForeColor="Red" ControlToValidate="nametxt">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr >
                                <td>
                                    <h3>Description : </h3>
                                </td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="desctxt" runat="server" Height="120px" Width="220px" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="DescRFV" runat="server" ErrorMessage="Please Insert Description" ForeColor="Red" ControlToValidate="desctxt">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr >
                                <td>
                                    <h3>Stock : </h3>
                                </td>
                                <td class="auto-style2">      
                                    <asp:TextBox ID="stocktxt" runat="server" Width="220px"></asp:TextBox>    
                                    <asp:RequiredFieldValidator ID="stockRFV" runat="server" ControlToValidate="stocktxt" ErrorMessage="Please Insert Stock" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td>

                                    <asp:CompareValidator ID="StockCV" runat="server" ErrorMessage="Please Insert Whole Number" ForeColor="Red" Operator="DataTypeCheck" Type="Integer" ControlToValidate="stocktxt"></asp:CompareValidator>

                                </td>
                            </tr>
                            <tr >
                                <td>
                                    <h3>Art Price : </h3>
                                </td>
                                <td class="auto-style2">      
                                    <asp:TextBox ID="pricetxt" runat="server" Width="220px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="priceRFV" runat="server" ControlToValidate="pricetxt" ErrorMessage="Please Insert Stock" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td>

                                    <asp:RegularExpressionValidator ID="PriceV" runat="server" ControlToValidate="pricetxt" ErrorMessage="Please Insert Valid Price" ForeColor="Red" ValidationExpression="[0-9]+(\.[0-9][0-9]?)?"></asp:RegularExpressionValidator>

                                </td>
                            </tr>
                            <tr >
                                <td>
                                    <h3>Image : </h3>
                                </td>
                                <td class="auto-style2">      
                                    <asp:FileUpload ID="PostArt" runat="server" Width="227px" />
                                      <asp:RequiredFieldValidator ID="FileRFV" runat="server" ControlToValidate="PostArt" ErrorMessage="Please Insert Stock" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:RegularExpressionValidator ID="FileREV" runat="server" ErrorMessage="Only Picture is allowed" 
                                    ControlToValidate="PostArt" ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.png|.PNG|.bmp|.BMP)$" ForeColor="Red"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align:center" class="auto-style1">                   
                                    <asp:Button ID="postbtn" runat="server" Text="Post" OnClick="postbtn_Click" />
                                    <br />
                                    <asp:Label ID="LabMsg" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
            </form>
        </div>

<hr />

        <div style="width:90%;"  class="w3-content w3-padding-large w3-margin-top ">
            
            <form >
                <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
                    <hr />
                    <h1 style="text-align:center">My Gallery</h1>
                    <hr />

                    <asp:DataList ID="dl" runat="server" RepeatColumns="3" DataKeyField="Art_ID" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
                    <ItemTemplate>
                        <table  style="cursor: pointer;border: solid 1px gray;background: rgba(191, 191, 191, 0.5);" class=" w3-hover-light-blue">
                        <tr>
                            <td rowspan="2">
                                <a href="/ProductEdit.aspx?id=<%# Eval("Art_ID") %>">
                                <img src="<%#Eval("Image") %>"" height="200" width="200"/>
                            </td>
                        <tr>
                        <tr></tr>
                            <td style="text-align:center" >
                                <h3>
                                    <%#Eval("Art_Name") %>
                                </h3>
                            </td>
                        </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:RegistrationConnectionString %>" SelectCommand="SELECT * FROM [Art] WHERE ([Artist_ID] = @Artist_ID)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="Artist_ID" SessionField="ARTISTID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                </div>
                
                    
            </form>

        </div>



</asp:Content>
