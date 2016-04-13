<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="onlineReceipt.aspx.cs" Inherits="CWC_FurnitureSystem.Order.online.onlineReceipt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Online Receipt</title>
    <link href="../offline/css/styleOffline.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        alert("Thanks for your purchasing.\nPress 'Print Receipt' button to print this receipt");

        function printdiv()
        {
        var headstr = "<html><head><title></title></head><body>";
        var footstr = "</body>";
        var newstr = document.all.item('print').innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = headstr+newstr+footstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="addOfflineContent" id="print">
    <div class="top">
        <hr/>
        <h1 style="text-align:center">CWC Furniture Sdn Bhd</h1>
        <table style="width: 100%;">
            <tr>
                <td><b>Sales ID:</b> <asp:Label ID="lblId" runat="server" Text=""></asp:Label></td>
                <td><b>Sales Date:</b> <asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                <td><b>Customer:</b> <asp:Label ID="lblCust" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td><b>Payment Type:</b> <asp:Label ID="lblType" runat="server" Text=""></asp:Label>
                </td>
                <td><b>Delivery Service:</b> <asp:Label ID="lblDelivery" runat="server" Text=""></asp:Label></td>
            </tr>
       </table>
        <div style="margin-left:2px;margin-top:2px">
        <span style="float:left"><b>Deliver To:&nbsp; </b></span><asp:Label ID="lblAddr" runat="server" Width="200px" Text=""></asp:Label>
        </div>
        <hr/>
    </div>
            
    <div class="addOfflineMainContent">
        
    <div id="tableMain">
    
   <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
       <AlternatingRowStyle BackColor="#F7F7F7" />
       <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
       <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" HorizontalAlign="Left" />
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
           <asp:BoundField DataField="productId" DataFormatString="P{0:0000}" HeaderText="Product ID" SortExpression="productId" />
           <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
           <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
           <asp:BoundField DataField="unitPrice" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#.00}" HeaderText="Unit Price(RM)" SortExpression="unitPrice" />
           <asp:BoundField DataField="totalPrice" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#.00}" HeaderText="Amount(RM)" SortExpression="amount" />
        </Columns>
       </asp:GridView>

        </div>

    <div id="totalAmount">
        <table border="1" style="border-collapse:collapse;border-left:hidden;border-right:hidden">
            <tr style="border:hidden">
                <td style="text-align:right"><b>Total Amount(RM):</b></td>
                <td style="text-align:right"><asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr style="">
                <td style="text-align:right"><b>Total Paid(RM):</b></td>
                <td style="text-align:right"><asp:Label ID="lblPaid" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr style="border-top:1px">
                <td style="text-align:right"><b>Total Unpaid(RM):</b></td>
                <td style="text-align:right"><asp:Label ID="lblUnpaid" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
         
    </div>
    </div>
    
    </div>
    <div id="buttonGroup">
        <asp:Button ID="btnPrint" Text="Print Receipt" runat="server" OnClientClick="printdiv()"/>
    </div>
</asp:Content>
