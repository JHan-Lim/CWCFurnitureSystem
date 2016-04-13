<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/addStyle.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">





<hr/>

    <div id="addContent">

<div class="style">


    <asp:FileUpload ID="FileUpload1" runat="server" />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
<hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
    <Columns>
        <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="300" ControlStyle-Width="300" />
    </Columns>
</asp:GridView>

</div>

    <div class="formtop">
    <div class="form">
    <table style="width: 100%;">
        <tr>
            <td>Product Name :</td>
            <td><asp:TextBox ID="Pnametxt" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>
        <tr>
            <td>Product Quantity :</td>
            <td><asp:TextBox ID="Pqtytxt" runat="server" type="number" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Purchase Price :</td>
            <td><asp:TextBox ID="Ppurchasetxt" runat="server" type="number" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Selling Price :</td>
            <td><asp:TextBox ID="Psellingtxt" runat="server" type="number" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Category :</td>
            <td><asp:TextBox ID="Pcattxt" runat="server" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Warranty :</td>
            <td><asp:TextBox ID="Pwarranty" runat="server" type="number" Enabled="false"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Product Description :</td>
            <td>
                <asp:TextBox ID="Pdesc" runat="server" Rows="3" Enabled="false"></asp:TextBox></td>
         
        </tr>
         <tr>
            <td></td>
            <td>
                <input id="AddReset" type="reset" value="reset" />
                <asp:Button ID="AddSubmit1" runat="server" Text="Submit" OnClick="AddSubmit1_Click" />
            </td>
         
        </tr>
    </table>
        </div>
        </div>
    </div>


</asp:Content>
