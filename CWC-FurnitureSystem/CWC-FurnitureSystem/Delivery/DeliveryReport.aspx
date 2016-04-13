<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="DeliveryReport.aspx.cs" Inherits="CWC_FurnitureSystem.Delivery.DeliveryReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div style="float:right">
        <br />
    <asp:Button ID="Button1" runat="server" Text="Print" OnClientClick="javascript:window.print();" /> 
        </div>
    <h1 style="text-align:center"><b>Details Report For Delivery</b></h1>
    
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataSourceID="LinqDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <RowStyle HorizontalAlign="center"></RowStyle>
        <Columns>
            <asp:BoundField DataField="deliveryId" HeaderText="Delivery ID" ReadOnly="True" DataFormatString="D{0:0000}" SortExpression="deliveryId"  />
            <asp:BoundField DataField="description" HeaderText="Description" ReadOnly="True" SortExpression="description" />
            <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" ReadOnly="True" SortExpression="deliveryAddress" />
            <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" ReadOnly="True" SortExpression="deliveryStatus" />
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

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (deliveryId, description, deliveryAddress, deliveryStatus)" TableName="deliveries" Where="deliveryStatus == @deliveryStatus">
        <WhereParameters>
            <asp:Parameter DefaultValue="completed" Name="deliveryStatus" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>


</asp:Content>
