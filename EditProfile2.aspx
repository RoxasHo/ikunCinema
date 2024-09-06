<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditProfile2.aspx.cs" Inherits="CinemaTicketingSystem.EditProfile2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <style>
            /* Reset default margin and padding */
            body {
                margin: 0;
                padding: 0;
                height: 789px;
            }

            /* Background image covering the entire viewport */
            .background {
                background-image: url('Image/user-profile-icon-abstract-digital-design-blue-background-isolated-172062850.jpg');
                background-size: cover;
                background-position: center;
                height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            /* Styling for user details container */
            .user-detail {
                background: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); /* Shadow effect */
            }

            /* Styling for profile text */
            .profile-text {
                font-size: 24px;
                color: #333;
                font-weight: bold;
                margin-bottom: 20px;
                text-align: center;
            }

            /* Style for text inputs */
            input[type="text"], select {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
            }

            /* Style for the Update button */
            .Update-button {
                width: 100%;
                padding: 10px;
                background-color: #008CBA;
                color: goldenrod;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                font-weight: bold;
                transition: background-color 0.3s ease-in-out;
            }

            .Update-button:hover {
                background-color: #005f75;
            }
        </style>

        <div class="background">
            <div class="user-detail">
                <div class="profile-text">User Details</div>
                User Name:
                <asp:TextBox ID="EditUserName" runat="server" placeholder="Full Name"></asp:TextBox>
                <br /><br />
                Gender:
                <asp:DropDownList ID="EditGender" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <br /><br />
                Email:
                <asp:TextBox ID="EditEmail" runat="server"></asp:TextBox>
                <br /><br />
                <asp:Button ID="UpdateButton2" runat="server" Text="Update" CssClass="Update-button"
                    OnClientClick="return confirm('Are you sure you want to update your profile?');" 
                    OnClick="UpdateButton2_click" />
            </div>
        </div>
</asp:Content>
