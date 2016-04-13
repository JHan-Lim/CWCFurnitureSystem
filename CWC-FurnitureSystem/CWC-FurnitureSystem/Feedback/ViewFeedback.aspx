<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.ViewFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style1">
        <strong>Feedback &amp; Review</strong></p>
    
    <p class="auto-style1">

   
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" style="margin:0 auto" Width="100%">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EFF3FB" />
            <ItemTemplate>
                
                <asp:Label ID="feedbackDateLabel" runat="server" Text='<%# Eval("feedbackDate") %>' />
                <br />
                
                <asp:Label ID="feedbackContentLabel" runat="server" Text='<%# Eval("feedbackContent") %>' />
                <br />
<br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>

        <div class="auto-style2" style="align-content:center">

            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (feedbackDate, feedbackContent)" TableName="feedbacks">
            </asp:LinqDataSource>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="Write Feedback" OnClick="btnSubmit_Click" />
            <br />
            <br />
        </div>
        </asp:Content>

