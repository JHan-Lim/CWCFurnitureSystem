<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="offlineHome.aspx.cs" Inherits="CWC_FurnitureSystem.Order.offline.offlineHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="css/styleOffline.css" rel="stylesheet" type="text/css" />
     <title>Order Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="homeContent">
        <div class="box">
            <div class="content">
                <h1>Add New Order</h1>
                <br/>
                <div class="btn"><a href="addOrderOffline.aspx" style="text-decoration:none">Click Me</a></div>
                
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Search Order</h1>
                <br/>
                <div class="btn"><a href="searchOrderOffline.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Daily Sales Report</h1><br/>
                <br/>
                <div class="btn"><a href="dailyReport.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>Payment Transaction Report</h1>
                <br/>
                <div class="btn"><a href="paymentReport.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>
    </div>
    
</asp:Content>
