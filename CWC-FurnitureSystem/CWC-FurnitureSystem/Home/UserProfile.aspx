<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="CWC_FurnitureSystem.Home.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/userStyle.css"/>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <hr />

    <div class="form">

         <h2>Welcome To Profile Page Dear <asp:Label ID="lblWelcome" runat="server" Text="Label"></asp:Label></h2>
        <br />
        <table style="width: 100%;">
          
            <tr>
                <td><div style="color:red">* You can make changes to thier information</div></td>
                <td>&nbsp;</td>
                
            </tr>
            <tr>
                <td><div style="color:red">* User are required to fill in on the field</div> </td>
                <td>&nbsp;</td>
                
            </tr>
            <tr>
                <td><div style="color:red">* Always remember your password after modify it</div></td>
                <td>&nbsp;</td>
                
            </tr>
        </table>
        
        <img src="images/passwordIcon.jpg" style="height: 311px; margin-top: 20px" />

    </div>

    <div class="fill">

        

        <fieldset>
            <legend>User Information</legend>
        <table style="width:100%">

            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Name :"></asp:Label></td>
                <td><asp:Label ID="lblName" runat="server" Text=""></asp:Label></td>
            </tr>

            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Email :"></asp:Label></td>
                <td><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
            </tr>

        </table>
        </fieldset>
        <table style="width: 100%; height:50px">

            <tr>
                <td>* New Email :</td>
                
            </tr>
            <tr>
                <td><asp:TextBox ID="txtemail" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Update Email" OnClick="Button2_Click" />
                    <asp:Button ID="Button1" runat="server" Text="Change Password" OnClick="Button1_Click1" CausesValidation="False" />
                </td>
                <td></td>
            </tr>
           
        </table>

        <hr />

        <asp:ChangePassword ID="ChangePassword1" runat="server" Visible="false" ContinueDestinationPageUrl="~/Home/UserProfile.aspx"></asp:ChangePassword>
       
        <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Login/Login.aspx" />
    </div>

</asp:Content>
