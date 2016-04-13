<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-size: x-large;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style1">
        <strong>Feedback &amp; Review</strong></p>
    <fieldset>
        <legend><em>Feedback Form</em></legend>
    Please
        write your feedback or suggestions below:
        <p class="auto-style2">
        
            <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" Width="100%" Height="200px" OnTextChanged="txtFeedback_TextChanged"></asp:TextBox>
            <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click"/>
        </p>
    </fieldset>
</asp:Content>
