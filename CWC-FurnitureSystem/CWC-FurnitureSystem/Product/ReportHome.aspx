<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ReportHome.aspx.cs" Inherits="CWC_FurnitureSystem.Product.ReportHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Order/offline/css/styleOffline.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="homeContent">
        <div class="box">
            <div class="content">
                <h1>View Purchase Report</h1>
                <br/>
                <div class="btn"><a href="Report.aspx" style="text-decoration:none">Click Me</a></div>
                
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>View Return Report</h1>
                <br/>
                <div class="btn"><a href="ReturnReport.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>


</asp:Content>
