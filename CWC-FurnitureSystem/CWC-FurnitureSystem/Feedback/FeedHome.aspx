<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="FeedHome.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.FeedHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Order/offline/css/styleOffline.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="homeContent">
        <div class="box">
            <div class="content">
                <h1>Write Feedback</h1>
                <br/>
                <div class="btn"><a href="Feedback.aspx" style="text-decoration:none">Click Me</a></div>
                
            </div>
        </div>
        <div class="box">
            <div class="content">
                <h1>View Feedback</h1>
                <br/>
                <div class="btn"><a href="ViewFeedback.aspx" style="text-decoration:none">Click Me</a></div>
            </div>
        </div>

    </div>

</asp:Content>
