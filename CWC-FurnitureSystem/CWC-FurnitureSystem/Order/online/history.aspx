<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="CWC_FurnitureSystem.Order.online.history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #history{
            width:95%;
            margin:auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="history">
        <hr/>
        <h1 style="text-align:center">Transaction History</h1>
        <hr/>

        <div id="historyContent">
            <asp:GridView ID="GridView1" Width="100%" HeaderStyle-HorizontalAlign="Left" OnPageIndexChanging="OnPaging" AllowPaging="true" AutoGenerateColumns="false" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                <Columns>
                <asp:TemplateField HeaderText = "No" ItemStyle-Width="40">
                <ItemTemplate>
                    <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                </ItemTemplate>

            <ItemStyle Width="40px"></ItemStyle>
           </asp:TemplateField>
                    <asp:BoundField DataField="salesId" DataFormatString="S{0:0000}" HeaderText="Sales ID" SortExpression="salesId" />
                    <asp:BoundField DataField="transDate" DataFormatString="{0:d}" HeaderText="Transaction Date" SortExpression="transDate" />
                    <asp:BoundField DataField="deliveryService" HeaderText="Delivery Service" SortExpression="deliveryService" />
                    <asp:BoundField DataField="transType" HeaderText="Transaction Type" SortExpression="transType" />
                    <asp:BoundField DataField="totalAmount" DataFormatString="{0:#.00}" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="Total Amount(RM)" SortExpression="totalAmount" />
                    </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
