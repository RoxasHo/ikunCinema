<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup ="true" CodeBehind="HistoryDetails.aspx.cs" Inherits="CinemaTicketingSystem.HistoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:40%; height: 720px;"  class="pageContent">
      <div style="border: solid 1px gray; border-radius: 15px; background-size: cover;">
        <form action="/action_page.php" target="_blank">
          <div class="login">
            <table style="width: 100%">
                <tr>
                    <td style="height: 32px; font-size: x-large; text-align:center; font-weight: bold;">&nbsp; PAYMENT SUCCESSFUL</td>
                </tr>
                <tr>
                    <td style="height: 14px; font-size: x-large; text-align:center;  font-weight: bold;">THANK YOU!</td>
                </tr>
                </tr>
                <tr>
                    <td style="font-size: large; height: 10px; text-align: center;">
                         <asp:Image ID="movieImage" runat="server" />

                        
                        </td>
                </tr>
                <tr>
                    <td>
                        <div id="printable">
                        <table style="width:100%;">
                            <tr>
                                <td style="width: 199px; font-size:large; font-weight: bold">TRANSACTION ID</td>
                               <td style=" width: 194px">
                                   
                                   : <asp:Label ID="lblPaymentID" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                                </td>
                                <td style=""></td>
                            </tr>
                            <tr>
                                <td style="width: 199px; font-size:large; font-weight: bold; height: 38px;">PAY WITH</td>
                                <td style="width: 194px; height: 38px;">
                                    : <asp:Label ID="lblPaymentMethod" runat="server" Text="Label" Font-Size="Large"></asp:Label> 
                                    </td>
                                <td style="height: 38px"></td>
                            </tr>
                            <tr>
                                 <td style="width: 199px; font-size: large; font-weight: bold; height: 38px;">AMOUNT</td>
                                <td style="height: 38px; width: 194px; ">: RM <asp:Label ID="lblAmount" runat="server" Text="Label" Font-Size="Large"></asp:Label> </td>
                                <td style="height: 38px"></td>
                            </tr>
                            <tr>
                                <td style="width: 199px; height: 38px; font-weight:bold; font-size: large;">DATE</td>
                                <td>: <asp:Label ID="lblCurrentDateTime" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                                </td>
                                <td></td>
                            </tr>
                                                        <tr>
                                <td style="width: 199px; font-weight:bold; font-size: large; height: 38px;">RESERVATION ID</td>
                                <td style="height: 38px">: <asp:Label ID="lblReservationID" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                                                            </td>
                                <td style="height: 38px"></td>
                            </tr>
                             <tr>
                                <td style="width: 199px; font-weight:bold; font-size: large;">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td></td>
                            
                            </tr>
                        </table>
                            </div>
                </tr>
                               
               
            </table>
              <table>
                                                    <tr style: "justify-content: center;">
                                                        <td style="width: 454px">&nbsp;</td>
                                <td style="width: 356px; "><asp:Button ID="btnPrint" runat="server" style="font-size: large; margin-top: 10px; " class="w3-button w3-block w3-black" Text="PRINT RECEIPT" OnClientClick="printReceipt(); return false;" Width="150px" /></td>
                                <td style="width: 308px">&nbsp;</td>
                            </tr>
                                                    </table>
              <table>

                                                    <tr style: "justify-content: center;">
                                                        <td style="width: 579px"></td>
                                <td style="width: 424px; "><asp:Button ID="Button2" runat="server" style="font-size: large; margin-top: 10px; " class="w3-button w3-block w3-black" Text="BACK
                            " Width="82px" PostBackUrl="History.aspx"/></td>
                                <td style="width: 308px">&nbsp;</td>
                            </tr>
              </table>

              <script type="text/javascript">
    function printReceipt() {
        var printContents = document.getElementById('printable').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
              </script>
             

          </div>  
        </form>
      </div>
    </div>
</asp:Content>
