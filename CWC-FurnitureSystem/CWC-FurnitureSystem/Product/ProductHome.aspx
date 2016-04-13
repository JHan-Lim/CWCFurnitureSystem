<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ProductHome.aspx.cs" Inherits="CWC_FurnitureSystem.Product.ProductHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../Order/offline/css/styleOffline.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="homeContent">
        <div class="box">
            <div class="content">
                <h1>Add Product</h1>
                <br/>
                <div class="btn"><a href="Add.aspx" style="text-decoration:none">Click Me</a></div>
                
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Update Product</h1>
                <br/>
                <div class="btn"><a href="Update.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Delete Product</h1>
                <br/>
                <div class="btn"><a href="Delete.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Return Product</h1>
                <br/>
                <div class="btn"><a href="Return.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
    

    <div class="box">
            <div class="content">
                <h1>Restock Product</h1>
                <br/>
                <div class="btn"><a href="Restock.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
   

</asp:Content>
