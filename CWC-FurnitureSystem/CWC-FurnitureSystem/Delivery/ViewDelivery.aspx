<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="ViewDelivery.aspx.cs" Inherits="CWC_FurnitureSystem.Delivery.ViewDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            font-size: xx-large;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="auto-style1">
        <strong>Delivery</strong>
        <br />
        <asp:Button ID="btnDeliver" runat="server" OnClick="btnDeliver_Click" Text="Add New Delivery" />
    </p>
        <div class="auto-style2">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="description" HeaderText="Description" ReadOnly="True" SortExpression="description" />
                <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" ReadOnly="True" SortExpression="deliveryAddress" />
                <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" ReadOnly="True" SortExpression="deliveryStatus" />
                <asp:BoundField DataField="deliveryId" HeaderText="Delivery Id" ReadOnly="True" SortExpression="deliveryId" />
            </Columns>
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
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (description, deliveryAddress, deliveryStatus, deliveryId)" TableName="deliveries">
        </asp:LinqDataSource>
    </p>
</asp:Content>
