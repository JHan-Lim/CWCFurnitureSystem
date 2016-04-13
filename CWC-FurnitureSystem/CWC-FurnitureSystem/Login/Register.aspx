<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CWC_FurnitureSystem.Home.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="../Master/css/Styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .headerImg {
            width: 100%;
        }
        .auto-style1 {
            margin-left: 280px;
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
                <div id="loginContent" class="auto-style1">
                    <div style="margin-top:20px" >
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Width="57%" Height="300px" ContinueDestinationPageUrl="~/Login/Login.aspx" OnCreatedUser="CreateUserWizard1_CreatedUser" >
                        <ContinueButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                        <CreateUserButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                        
                        <TitleTextStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                        <HeaderStyle BackColor="#284E98" BorderStyle="Solid" Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" BorderColor="#EFF3FB" BorderWidth="2px" />
                        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" ForeColor="#284E98" />
                        <SideBarButtonStyle Font-Names="Verdana" ForeColor="White" BackColor="#507CD1" />
                        <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
                        <StepStyle Font-Size="0.8em" />
                    </asp:CreateUserWizard>
                        </div>
                    
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
