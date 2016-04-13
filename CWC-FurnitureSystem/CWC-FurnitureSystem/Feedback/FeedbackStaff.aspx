<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="FeedbackStaff.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.FeedbackStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-size: large;
        }
        .auto-style3 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <p class="auto-style1">
        <strong>Feedback and Review</strong></p>
    <p class="auto-style1">
        <div class="auto-style3">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style2" DataSourceID="LinqDataSource1" style="margin:0 auto" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="Reply" ShowSelectButton="True" SelectImageUrl="~/Reply.aspx"  />
                <asp:BoundField DataField="feedbackId" HeaderText="Feedback Id" ReadOnly="True" SortExpression="feedbackId" />
                <asp:BoundField DataField="feedbackDate" HeaderText="Feedback Date" ReadOnly="True" SortExpression="feedbackDate" />
                <asp:BoundField DataField="feedbackContent" HeaderText="Feedback Content" ReadOnly="True" SortExpression="feedbackContent" />
                <asp:BoundField DataField="feedbackStatus" HeaderText="Feedback Status" ReadOnly="True" SortExpression="feedbackStatus" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" BackColor="#EFF3FB"></RowStyle>
        <AlternatingRowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        </div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (feedbackId, feedbackDate, feedbackContent, feedbackStatus)" TableName="feedbacks" Where="feedbackStatus == @feedbackStatus">
            <WhereParameters>
                <asp:Parameter DefaultValue="pending" Name="feedbackStatus" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </p>
      
</asp:Content>
