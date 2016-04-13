<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/UpdateStyle.css"/>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="addContent">
<hr/>

    <div class="formtop">

         </div>
    <h3 style="margin-left: 480px"><b>Please Select Product ID To Be Updated</b></h3>

    <div class="formdrop">
        

        Product ID : 
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="productId" DataValueField="productId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextFormatString="P{0:0000}"></asp:DropDownList>

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (productId)" TableName="products">
        </asp:LinqDataSource>
        <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />

    </div>
    <hr />
    <br />
    <br />

        <div class ="form">

            <fieldset>
                <legend><b>Product Details</b></legend>
            <table>
               
             <tr>
            <td>Product Name :</td>
            <td><asp:TextBox ID="Pnametxt" runat="server" Enabled="false" ReadOnly="true"></asp:TextBox></td>
          
        </tr>
        <tr>
            <td>Product Quantity :</td>
            <td><asp:TextBox ID="Pqtytxt" runat="server" ReadOnly="true" Enabled="false" type="number"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Purchase Price :</td>
            <td><asp:TextBox ID="Ppurchasetxt" runat="server" ReadOnly="true" Enabled="false" type="number"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Selling Price :</td>
            <td><asp:TextBox ID="Psellingtxt" runat="server" ReadOnly="true" Enabled="false" type="number"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Category :</td>
            <td><asp:TextBox ID="Pcattxt" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Warranty :</td>
            <td><asp:TextBox ID="Pwarranty" runat="server" ReadOnly="true" Enabled="false" type="number"></asp:TextBox></td>
        </tr>

         <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Edit Text" OnClick="Button1_Click" />
                <asp:Button ID="AddSubmit1" runat="server" Text="Update" Visible="false" OnClick="AddSubmit1_Click" OnClientClick="return confirm('Are you sure you want to update ?')" />
                
            </td>
         
        </tr>
            </table>
                </fieldset>


        </div>





   








</div>
</asp:Content>
