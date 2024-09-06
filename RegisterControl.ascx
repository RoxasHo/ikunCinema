<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegisterControl.ascx.cs" Inherits="masterpage1.RegisterControl" %>

<table style="width: 100%">
                  <tr>
                      <td class="w3-center" style="height: 26px; font-size: xx-large;"><strong>Register here</strong></td>
                  </tr>
                  <tr>
                      <td style="font-size: large" class="w3-center">Use the form below to create a new account.</td>
                  </tr>
                  <tr>
                      <td style="font-size: medium; height: 34px;"></td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">Name</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="RegisterName" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your name..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Name is required" ControlToValidate="RegisterName" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">Password</td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">
                          <asp:TextBox ID="RegisterPassword" runat="server" style="font-size: x-large" Width="100%" TextMode="Password" placeholder=" Enter your password..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required" ControlToValidate="RegisterPassword" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">Email</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="RegisterEmail" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your email address..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is required" ControlToValidate="RegisterEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">Contact</td>
                  </tr>
                  <tr>
                      <td style="font-size: x-large">
                          <asp:TextBox ID="RegisterContact" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your contact number..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Contact number is required" ControlToValidate="RegisterContact" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">Address</td>
                  </tr>
                  <tr>
                      <td style="height: 26px; font-size: x-large">
                          <asp:TextBox ID="RegisterAddress" runat="server" style="font-size: x-large" Width="100%" placeholder=" Enter your address..."></asp:TextBox>
                      </td>
                  </tr>
                  <tr>
                      <td style="height: 26px">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Addres is required" ControlToValidate="RegisterAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Label ID="Label1" runat="server" ForeColor="Red" Text=""></asp:Label>
                      </td>
                  </tr>
                  <tr>
                      <td>
                          <asp:Button ID="RegisterSubmit" runat="server" OnClick="Button1_Click" style="font-size: x-large" class="w3-button w3-block w3-black" Text="Submit" Width="100%" />
                      </td>
                  </tr>
              </table>