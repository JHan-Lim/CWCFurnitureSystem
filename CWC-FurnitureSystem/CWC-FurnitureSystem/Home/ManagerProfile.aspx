<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ManagerProfile.aspx.cs" Inherits="CWC_FurnitureSystem.Home.ManagerProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/ManagerStyle.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<hr />

    <div class="form">

         <h2>Welcome To Staff Page Dear Manager <asp:Label ID="lblmanager" runat="server" Text="Label"></asp:Label></h2>
       
        <table style="width: 100%;">
          
            <tr>
                <td><div style="color:red">* You can assign role to any users. </div></td>
                <td>&nbsp;</td>
                
            </tr>
            <tr>
                <td><div style="color:red">* Kindly remind that always remember to logout. </div></td>
                <td>&nbsp;</td>
                
            </tr>
        </table>
        

      <img src="images/manager.jpg" style="height: 311px; margin-top: 20px" />
        </div>

    <div class="fill">

        <fieldset>
            <legend>User Informations</legend>
        <table style="width: 100%; height:400px">
            <tr>
                <td>Staff User Name :</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtCname" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCname" ErrorMessage="User name is required">*</asp:RequiredFieldValidator>
                </td>
               
            </tr>

              <tr>
                <td>Staff Password :</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtCpassword" TextMode="Password" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCpassword" ErrorMessage="Password is required">*</asp:RequiredFieldValidator>
                </td>
               
            </tr>

              <tr>
                <td>Staff Email :</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtCemail" runat="server" Width="300px" placeholder="golira@hotmail.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCemail" ErrorMessage="Email is required">*</asp:RequiredFieldValidator>
                </td>
               
            </tr>

              <tr>
                <td>Staff Security Question :</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                    <asp:ListItem>What is your favourite hero ?</asp:ListItem>
                    <asp:ListItem>Does batman is able to fly ?</asp:ListItem>
                    <asp:ListItem>Batman and Superman ! choose 1 </asp:ListItem>
                    <asp:ListItem>What is the name of batman&#39;s car</asp:ListItem>
                    <asp:ListItem>Who is the final boss of batman ?</asp:ListItem>
                    <asp:ListItem>Who is the batman ?</asp:ListItem>
                    <asp:ListItem>What is the name of batman&#39;s father ?</asp:ListItem>
                    </asp:DropDownList></td>
               
            </tr>

              <tr>
                <td>Staff Answer :</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="txtCans" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCans" ErrorMessage="Answer is required">*</asp:RequiredFieldValidator>
                </td>
               
            </tr>
            <tr>
                <td>Staff Role:</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource1" DataTextField="RoleName" DataValueField="RoleName">
                    
                    </asp:DropDownList>
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (RoleName)" TableName="aspnet_Roles" Where="RoleName != @RoleName">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="customer" Name="RoleName" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
               
            </tr>
            <tr>
                <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </td>

            </tr>
           
        </table>
            </fieldset>

    </div>

</asp:Content>
