<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CinemaTicketingSystem.UserProfile" %>

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
                background: rgba(230, 230, 230, 0.8); /* Semi-transparent white background */
                padding: 20px;
                border-radius: 10px;
                width: 50%;
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
                    <div class="profile-text">
                        User Profile Details
                    </div>
                    <br />
                    <strong>UserName:</strong>
                    <asp:TextBox ID="UserName_txt" runat="server"  ReadOnly="true"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <strong>Gender:</strong>
                    <asp:TextBox ID="Gender_txt" runat="server"  ReadOnly="true"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <strong>Email:</strong>
                    <asp:TextBox ID="Email_txt" runat="server"  ReadOnly="true" ></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    <a href="Editprofile2.aspx" class="edit-button w3-button w3-block w3-black">Edit</a>
                    <br />
                    <a href="ResetPassword.aspx" class="edit-button w3-button w3-block w3-black">Reset Password</a>
                
                   </div>
        </div>
    
</asp:Content>