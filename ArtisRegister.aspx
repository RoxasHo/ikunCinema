<%@ Page Title="Artist Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtisRegister.aspx.cs" Inherits="masterpage1.WebForm1" %>
<%@ Register src="ArtisRegisterControl.ascx" tagname="ArtisRegisterControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div style="width:30%;"  class="w3-content w3-padding-large w3-margin-top ">
  <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
      <form action="/action_page.php" target="_blank">
          <div class="w3-section">
              
&nbsp;
              <uc1:ArtisRegisterControl ID="ArtisRegisterControl1" runat="server" />
      </div>

      
    </form>

  </div>


</div>

</asp:Content>
