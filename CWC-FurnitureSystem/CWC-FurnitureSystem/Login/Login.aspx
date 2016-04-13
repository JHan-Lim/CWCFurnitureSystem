<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CWC_FurnitureSystem.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Master/css/Styles.css" rel="stylesheet" type="text/css" />
    <link href="css/styleLogin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .headerImg {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <div id="topContent">
             <img src="~/Master/images/header2.jpg" runat="server" alt="CWC Furniture Management System" class="headerImg" />
        </div>

        <div id="Content">
            <div id="mainContent"  style="width:100%">
                <div id="loginContent">
                    
                    <asp:login id="Login1" runat="server" style="margin:auto" DestinationPageUrl="~/Home/UserProfile.aspx">
                        <LayoutTemplate>
                            
                            <div class="box">
                                <div class="content">
                                    <h1>
                                        Authentication Required</h1>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="UserName" placeholder="User Name" class="field" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <br/>
                                    &nbsp;&nbsp;
                                    <asp:TextBox ID="Password" placeholder="Password" class="field" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" ForeColor="Red">*</asp:RequiredFieldValidator>
                                    <br/>
                                    <asp:CheckBox ID="RememberMe" runat="server" class="text" Text="Remember me next time."/>
                                    <br/>
                                    <br/>
                                    <div class="errorText">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </div>
                                    <br/>
                                    <asp:Button ID="LoginButton" class="btn" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"/>
                               
                                    <br />
                                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" ForeColor="White" NavigateUrl="~/Login/Register.aspx">Click Here For Sign Up</asp:HyperLink>
                               
                                </div>
                            </div>                   
                        </LayoutTemplate>
                    </asp:login>
                    
                </div>
            </div>
        </div>
     
        <div id="footer">
            Copyright © CWC Company Sdn Bhd 
        </div>
    </div>
    </form>
</body>
</html>
