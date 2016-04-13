<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.Reply" %>
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
        <strong>Feedback &amp; Review<asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        </strong>
    </p>
    <fieldset>
        <legend><em>Reply Feedback </em></legend>
    &nbsp;<p class="auto-style2">
        
            <asp:TextBox ID="txtFeedback" runat="server" TextMode="MultiLine" width="100%" Height="200px" OnTextChanged="txtFeedback_TextChanged" ></asp:TextBox>
        </p>
        <p class="auto-style2">
        
            <asp:Button ID="btnReply" runat="server" BorderStyle="Ridge" OnClick="btnReply_Click" Text="Reply" />
        </p>
    </fieldset>
</asp:Content>