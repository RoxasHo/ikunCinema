<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="masterpage1.LoginControl" %>


                <table style="width: 100%">
                  <tr>
                      <td class="w3-center" style="height: 26px; font-size: xx-large;"><strong>WELCOME</strong></td>
                  </tr>
                  <tr>
                      <td class="w3-center" style="height: 16px; font-size: large;">Login to Your Account</td>
                  </tr>
                  <tr>
                      <td class="w3-center" style="height: 16px; font-size: large;">&nbsp;</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">UserName</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="LoginName" runat="server" style="font-size: x-large" Width="100%" placeholder="Enter your username..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter your UserName" ControlToValidate="LoginName" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">Password</td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">
                          <asp:TextBox ID="LoginPassword" runat="server" style="font-size: x-large" Width="100%" TextMode="Password" placeholder="Enter your password..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your password" ControlToValidate="LoginPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Button ID="LoginSubmit" runat="server" OnClick="Button1_Click" style="font-size: x-large" class="w3-button w3-block w3-black" Text="Login" Width="100%" />
                      </td>
                  </tr>
              </table>