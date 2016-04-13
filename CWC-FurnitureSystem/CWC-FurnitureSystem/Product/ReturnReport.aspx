<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ReturnReport.aspx.cs" Inherits="CWC_FurnitureSystem.Product.ReturnReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server" OnClientClick="javascript:window.print();">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div style="float:right">
        <br />
    <asp:Button ID="Button1" runat="server" Text="Print" /> 
        </div>
    <h1 style="text-align:center"><b>Details Report For Return</b></h1>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <RowStyle HorizontalAlign="center"></RowStyle>
        <Columns>
            <asp:BoundField DataField="returnId" HeaderText="Return ID" ReadOnly="True" DataFormatString="R{0:0000}" SortExpression="returnId"  />
            <asp:BoundField DataField="returnDate" HeaderText="Return Date" ReadOnly="True" SortExpression="returnDate" />
            <asp:BoundField DataField="returnStatus" HeaderText="Return Status" ReadOnly="True" SortExpression="returnStatus" />
            <asp:BoundField DataField="description" HeaderText="Description" ReadOnly="True" SortExpression="description" />
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

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (returnId, returnDate, returnStatus, description)" TableName="returnInwards">
    </asp:LinqDataSource>


</asp:Content>
