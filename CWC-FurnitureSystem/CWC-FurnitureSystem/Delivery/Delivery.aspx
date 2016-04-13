<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="CWC_FurnitureSystem.Delivery.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>Search Delivery ID</legend>
        <p class="auto-style1" style="margin:0 auto">
        
            Delivery ID:&nbsp;
        <asp:TextBox ID="txtDeliveryID" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
        </p>
    </fieldset>
       
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" AllowPaging="True" style="margin:0 auto; ">
            <EditRowStyle BackColor="#2461BF" />
             <Columns>
             <asp:CommandField HeaderText="Select Delivery" ShowHeader="True" ShowSelectButton="True" />
            <asp:BoundField DataField="deliveryId" HeaderText="Delivery ID" DataFormatString="D{0:0000}" SortExpression="deliveryId" />
            
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            
            <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery Address" SortExpression="deliveryAddress" />
            
            <asp:BoundField DataField="deliveryStatus" HeaderText="Delivery Status" SortExpression="deliveryStatus" />
            
           
            <asp:BoundField DataField="salesId" HeaderText="Sales ID" SortExpression="salesId" />
           
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
         <br />
      
        <div class="auto-style1">
        <fieldset>
        <legend style="margin-left:0; margin-right:80%">Delivery Details</legend>
        Assign Driver:&nbsp;
        <asp:DropDownList ID="ddlDriver" runat="server" style="margin:0 auto">
        </asp:DropDownList>
        <br />
            <br />

            <asp:Calendar ID="Calendar1" runat="server" style="margin:0 auto" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="#6D95E1"></asp:Calendar>

            <br />

            Time:
            <asp:DropDownList ID="ddlTime" runat="server">
                <asp:ListItem>11:00:00 AM</asp:ListItem>
                <asp:ListItem>3:00:00 PM</asp:ListItem>
                <asp:ListItem>5:00:00 PM</asp:ListItem>
            </asp:DropDownList>
        <br />
        <br />


          
    
  
    <p class="auto-style1">
  
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            
    </p>
        </fieldset>
     </div> 

</asp:Content>
