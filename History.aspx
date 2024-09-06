<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="CinemaTicketingSystem.History" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link rel="stylesheet" type="text/css" href="css\StyleSheet1.css" />
    <asp:Label ID="Label1" runat="server" Text="Transaction History" Font-Bold="True" Font-Size="XX-Large" ForeColor="White" style="position: relative; top: 20px; left: 45px;"></asp:Label>
     <br /><br /><br />

   <style>
        /* Style to display table and button in a horizontal layout */
        #container {
            display:flex;
            justify-content:flex-start;
        }

         .textbox {
            display: none;
            flex-direction: row;
        }
     
    </style>

       

        <script>
            function showStartDateTextbox() {
                var startDateTextbox = document.getElementById('<%= startDateTextbox.ClientID %>');
                startDateTextbox.style.display = 'flex';
            }

            function showEndDateTextbox() {
                var endDateTextbox = document.getElementById('<%= endDateTextbox.ClientID %>');
                endDateTextbox.style.display = 'flex';

                function filterByDate() {
                    var startDate = document.getElementById('<%= txtStartDate.ClientID %>').value;
                     var endDate = document.getElementById('<%= txtEndDate.ClientID %>').value;

        // Set the values to the CommandArgument property of the btnFilter button
        var btnFilter = document.getElementById('<%= btnSubmit.ClientID %>');
        btnFilter.setAttribute('CommandArgument', startDate + '|' + endDate);

        // Initiate a postback to apply the filtering on the server-side
                     __doPostBack('<%= btnSubmit.ClientID %>', '');
                }

            }
        </script>
        <div id="container">
        <table style="position:relative; padding-left: 3%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Filter Date Range:"  style="position: relative;font-size: 17px" ForeColor="White"></asp:Label></td>
                <td class="auto-style1">
                <asp:Button ID="btnStartDate" runat="server" Text="Select Start Date" OnClientClick="showStartDateTextbox(); return false;"
    style="position: relative; background-color: black; color: white;"
    onmouseover="this.style.backgroundColor='#ccc'; this.style.color='black';"
    onmouseout="this.style.backgroundColor='black'; this.style.color='white';"
    BorderColor="White" BorderStyle="Solid" ForeColor="White" />
                </td>
                <td>
                <asp:Button ID="btnEndDate" runat="server" Text="Select End Date"  OnClientClick="showEndDateTextbox(); return false;"
    style="position: relative;background-color: black; color: white;"
    onmouseover="this.style.backgroundColor='#ccc'; this.style.color='black';"
    onmouseout="this.style.backgroundColor='black'; this.style.color='white';"
    BorderColor="White" BorderStyle="Solid" ForeColor="White"/>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
    <td class="auto-style2"> &nbsp;</td>
    <td class="auto-style1"> <div class="textbox" id="startDateTextbox" runat="server"> <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date"></asp:TextBox></div></td>
            <td class="auto-style1"> <div class="textbox" id="endDateTextbox" runat="server"> <asp:TextBox ID="txtEndDate" runat="server"  TextMode="Date"></asp:TextBox></div></td>
                <td class="auto-style1"></td>
            </tr>
          
        </table>
              <asp:Button ID="btnSubmit" runat="server" Text="Find" OnClick="btnFilter_Click"
    style="background-color: black; color: white; position: relative; top: 3px; display: inline-flex; height: 27px;"
    onmouseover="this.style.backgroundColor='#ccc'; this.style.color='black';"
    onmouseout="this.style.backgroundColor='black'; this.style.color='white';"
    BorderColor="White" BorderStyle="Solid" ForeColor="White" />
            </div>
    <br />     
     

 
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="seatID" DataSourceID="SqlDataSource1"
    style="background-color: black; color: white; position:relative; left: 10%; top: 50%; width: 80%" ShowHeaderWhenEmpty="True">
    <Columns>
             <asp:BoundField DataField="reservationID" HeaderText="Reservation ID" SortExpression="reservationID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>

        <asp:BoundField DataField="movieName" HeaderText="Movie Name" SortExpression="movieName" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="date" HeaderText="Date & Time" SortExpression="date" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="seatID" HeaderText="Seat ID" ReadOnly="True" SortExpression="seatID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="hallID" HeaderText="Hall ID" SortExpression="hallID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="price" HeaderText="Price (RM)" SortExpression="price" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
        </asp:BoundField>
        <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Purchase_Details_btn" runat="server" CausesValidation="False" Text="View Receipt"  PostBackUrl='<%# "~/HistoryDetails.aspx?id=" + Eval("reservationID") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
    </Columns>
                    <HeaderStyle Font-Size="17px" /> 
</asp:GridView>

    

    <br />
    
  
    </form><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT r.reservationID, m.movieName, t.date, b.seatID, b.hallID, r.price, u.userID AS UserID
                   FROM [User] u
                   INNER JOIN Reservation r ON U.userID = r.userID
                   INNER JOIN BookedSeat b ON r.reservationID = b.reservationID
                   INNER JOIN TimeTable t ON b.TimeTableID = t.TimeTableID
                   INNER JOIN Movie m ON t.movieID = m.movieID
                   WHERE (u.userID = @username)">
    <SelectParameters>
        <asp:SessionParameter Name="username" SessionField="UserID" />
    </SelectParameters>
</asp:SqlDataSource>


</asp:Content>






