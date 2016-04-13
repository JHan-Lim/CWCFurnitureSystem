<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Delete.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Delete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/deleteStyle.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div id="addContent">
<hr/>

    <div class="formtop">
        <h3>Select Product ID To Be Delete</h3>
         </div>

    <div class="formdrop">
        
        Product ID : 
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="productId" DataValueField="productId" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataTextFormatString="P{0:0000}"></asp:DropDownList>

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (productId)" TableName="products">
        </asp:LinqDataSource>
        <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />

    </div>
        <hr />
        <br />

        <div class ="form">


            <fieldset>
            <legend>Product Details</legend>
            <table style="width: 100%;">
                <tr>
                    <td>Product ID :</td>
                    <td><asp:TextBox ID="txtID" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox></td>

                </tr>
                <tr>
            <td>Product Name :</td>
            <td><asp:TextBox ID="Pnametxt" readonly="true" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>
        <tr>
            <td>Product Quantity :</td>
            <td><asp:TextBox ID="Pqtytxt" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Purchase Price :</td>
            <td><asp:TextBox ID="Ppurchasetxt" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Selling Price :</td>
            <td><asp:TextBox ID="Psellingtxt" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Category :</td>
            <td><asp:TextBox ID="Pcattxt" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Warranty :</td>
            <td><asp:TextBox ID="Pwarranty" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>

         <tr>
            <td></td>
            <td>  
            </td>
         
        </tr>
                 <tr>
            <td></td>
            <td><asp:Button ID="Button1" runat="server" Text="Delete" OnClick="AddSubmit1_Click" OnClientClick="return confirm('Are you sure you want to delete ?')"/>
            </td>
         
        </tr>


            </table>
                </fieldset>


        </div>
</div>


</asp:Content>
