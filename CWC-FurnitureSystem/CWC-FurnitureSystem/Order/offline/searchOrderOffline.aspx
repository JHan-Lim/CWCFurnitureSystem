<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="searchOrderOffline.aspx.cs" Inherits="CWC_FurnitureSystem.Order.offline.searchOrderOffline" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/styleOffline.css" rel="stylesheet" type="text/css" />
    <link href="css/modalCss.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="searchPage">
    <hr/>
    <asp:UpdatePanel ID="updatePanelCriteria" runat="server">
        <ContentTemplate>
        <div id="searchCriteria">
        <table id="wholeTable">
        <tr>
        <td>

        <div id="table1">
            <table  class="leftTable">
                <tr>
                    <td class="title">Sales ID: </td>
                    <td>
                        <asp:DropDownList ID="ddlSalesId" DataTextFormatString="S{0:0000}" runat="server">

                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="title">Sales Status: </td>
                    <td>
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem>All</asp:ListItem>
                            <asp:ListItem>Paid</asp:ListItem>
                            <asp:ListItem>Unpaid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>

        <div id="table2">
        <table class="leftTable">
            <tr>
                <td class="title">Sales Type: </td>
                <td>
                    <asp:DropDownList ID="ddlType" runat="server">
                        <asp:ListItem>All</asp:ListItem>
                        <asp:ListItem>Online</asp:ListItem>
                        <asp:ListItem>Offline</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
               <td class="title">Customer: </td>
               <td>
               <asp:DropDownList ID="ddlCust" runat="server"></asp:DropDownList>
               </td>
            </tr>
        </table>
        </div>

        <div id="table3">
        <table class="leftTable">
            <tr>
                <td class="title">Sales Date: </td>
                <td colspan="3">
                    <asp:TextBox ID="txtFrom" runat="server" ReadOnly="true" Columns="10"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" TargetControlID="txtFrom"></cc1:CalendarExtender>
                    TO
                    <asp:TextBox ID="txtTo" runat="server" ReadOnly="true" Columns="10"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd/MM/yyyy" TargetControlID="txtTo"></cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
               <td class="title">Sales Amount(RM): </td>
               <td>
                    <asp:TextBox ID="txtMin" TextMode="Number" runat="server" Width="100px" Columns="10"></asp:TextBox>
                    TO
                    <asp:TextBox ID="txtMax" TextMode="Number" runat="server" Width="100px" Columns="10"></asp:TextBox>
               </td>
            </tr>
        </table>
        </div>
        </td>
            </tr>
        </table>
        <asp:Label ID="lbl" runat="server"></asp:Label>
    </div>
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    
    <div id="searchButton">
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search"/>
        <asp:Button ID="btnReset" OnClick="btnReset_Click" runat="server" Text="Reset" />
    </div>
        <br/>
    <hr/>
        
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" >
        <ContentTemplate>
    <div id="searchContent">
        <asp:GridView ID="gvSearch" runat="server" Width="100%" AutoGenerateColumns="false" DataKeyNames="salesId" AllowPaging="True" OnSelectedIndexChanged = "OnSelectedIndexChanged" OnPageIndexChanging="OnPaging1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:TemplateField HeaderText = "No" ItemStyle-Width="40">
                    <ItemTemplate>
                        <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
                    </ItemTemplate>

<ItemStyle Width="40px"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="salesId" HeaderText="SalesID" DataFormatString="S{0:0000}" SortExpression="salesId" />
                <asp:BoundField DataField="salesDate" HeaderText="SalesDate" SortExpression="salesDate" DataFormatString="{0:d}" />
                <asp:BoundField DataField="salesType" HeaderText="SalesType" SortExpression="salesType" />
                <asp:BoundField DataField="totalAmount" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:0.00}" HeaderText="TotalAmount(RM)" SortExpression="totalAmount" />
                <asp:BoundField DataField="salesStatus" HeaderText="SalesStatus" SortExpression="salesStatus" />
                <asp:BoundField DataField="customer" HeaderText="Customer" SortExpression="customer" />
                <asp:BoundField DataField="staff" HeaderText="Staff" SortExpression="staff" />
            </Columns>
        </asp:GridView>
        </div>
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger controlid="gvSearch" eventname="PageIndexChanging" />
        </Triggers>
        </asp:UpdatePanel>
    </div>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
        <asp:HiddenField ID="hdnField" runat="server" />
        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="hdnField"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
    
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup2" align="center" style= "display:none">
        
        <div class="header">
            Sales Order Details
        </div>
        
        <hr/>
        <div id="salesItemTitle">
            <b>Sales ID:</b> <asp:Label ID="salesIDLbl" runat="server"></asp:Label>
        </div>
        <br/>
        <hr/>

        <div id="salesItemContent">
            <asp:GridView ID="gvSalesItem" AutoGenerateColumns="false" runat="server" Width="600px">
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
                    <ItemStyle Width="40px" />
                </asp:TemplateField>
                    <asp:BoundField DataField="productId" DataFormatString="P{0:0000}" HeaderText="Product Id" SortExpression="productId" />
                    <asp:BoundField DataField="productName" HeaderText="Product Name" SortExpression="productName" />
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="unitPrice" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#.00}" HeaderText="Unit Price(RM)" SortExpression="unitPrice" />
                    <asp:BoundField DataField="totalPrice" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:#.00}" HeaderText="Total Price(RM)" SortExpression="unitPrice" />
            </Columns>
            </asp:GridView>
        </div>
        <div id="salesItemButton">
            <asp:Button ID="btnClose" runat="server" Text="Close"/>
        </div>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            
            <asp:AsyncPostBackTrigger controlid="gvSearch" eventname="SelectedIndexChanged" />
        </Triggers>
        </asp:UpdatePanel>
</asp:Content>
