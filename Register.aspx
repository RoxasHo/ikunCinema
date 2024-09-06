<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"  Inherits="masterpage1.WebForm3" %>
<%@ Register src="RegisterControl.ascx" tagname="RegisterControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
<div style="width:30%;"  class="w3-content w3-padding-large w3-margin-top ">
  <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
      <form action="/action_page.php" target="_blank">
          <div class="w3-section">
              
&nbsp;
              <uc1:RegisterControl ID="RegisterControl1" runat="server" />
      </div>

      
    </form>

  </div>

  <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top w3-center">
    <h2 style="font-size:1vw;" class="w3-center">Are u an artist? <a class="w3-text-blue" runat="server" href="~/ArtisRegister">Register as artist.</a></h2>

  </div>
</div>
</asp:Content>

