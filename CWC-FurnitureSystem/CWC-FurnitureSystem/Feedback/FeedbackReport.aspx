<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="FeedbackReport.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.FeedbackReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div style="float:right">
        <br />
    <asp:Button ID="Button1" runat="server" Text="Print" OnClientClick="javascript:window.print();" /> 
        </div>
    <h1 style="text-align:center"><b>Details Report For Feedback</b></h1>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="LinqDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <RowStyle HorizontalAlign="center"></RowStyle>
        <Columns>
            <asp:BoundField DataField="feedbackId" HeaderText="Feedback ID" ReadOnly="True" DataFormatString="D{0:0000}" SortExpression="feedbackId" />
            <asp:BoundField DataField="feedbackDate" HeaderText="Feedback Date" ReadOnly="True" SortExpression="feedbackDate" />
            <asp:BoundField DataField="feedbackContent" HeaderText="Feedback Content" ReadOnly="True" SortExpression="feedbackContent" />
            <asp:BoundField DataField="feedbackStatus" HeaderText="Feedback Status" ReadOnly="True" SortExpression="feedbackStatus" />
            <asp:BoundField DataField="replyContent" HeaderText="Reply Content" ReadOnly="True" SortExpression="replyContent" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>

    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (feedbackId, feedbackDate, feedbackContent, feedbackStatus, replyContent)" TableName="feedbacks" Where="feedbackStatus == @feedbackStatus">
        <WhereParameters>
            <asp:Parameter DefaultValue="replied" Name="feedbackStatus" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>


</asp:Content>
