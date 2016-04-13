<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="float:right">
        <br />
        <br />
        <br />
    <asp:Button ID="Button1" runat="server" Text="Print" OnClientClick="javascript:window.print();"/> 
        </div>
    <h1 style="text-align:center"><b>Details Report For Restock</b></h1>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <RowStyle HorizontalAlign="center"></RowStyle>
        <Columns>
            <asp:BoundField DataField="purchaseId" HeaderText="Purchase ID" ReadOnly="True" DataFormatString="I{0:0000}" SortExpression="purchaseId"  />
            <asp:BoundField DataField="productId" HeaderText="Product ID" ReadOnly="True" DataFormatString="P{0:0000}" SortExpression="productId" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="quantity" />
            <asp:BoundField DataField="unitPurchasePrice" HeaderText="Purchase Price" ReadOnly="True" SortExpression="unitPurchasePrice" />
            <asp:BoundField DataField="totalPurchasePrice" HeaderText="Total Price" ReadOnly="True" SortExpression="totalPurchasePrice" />
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

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (purchaseId, productId, quantity, unitPurchasePrice, totalPurchasePrice)" TableName="purchaseItems">
    </asp:LinqDataSource>

</asp:Content>
