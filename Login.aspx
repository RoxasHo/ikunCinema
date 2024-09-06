<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="masterpage1.WebForm4" %>
<%@Register TagPrefix="lg" TagName="login" Src="~/LoginControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div style="width:30%;"  class="w3-content w3-padding-large w3-margin-top ">
  <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">
    <form action="/action_page.php" target="_blank">
      <div class="w3-section">
          <lg:login ID="login1" runat="server" />
      </div>  
    </form>

  </div>

    <div style="border: solid 1px gray;border-radius: 15px;background: rgba(241, 241, 241, 0.9)" class=" w3-padding-large w3-padding-32 w3-margin-top ">

        <h2 style="font-size:1vw;" class="w3-center">New Here? <a class="w3-text-blue" runat="server" href="~/Register">Create an account.</a></h2>


    </div>
  

</div>



</asp:Content>