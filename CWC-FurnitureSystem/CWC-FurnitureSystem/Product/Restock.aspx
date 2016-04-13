<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Restock.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Restock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/restockStyle.css"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <hr />
    <div class="formtop">

       Quantity Less Than : <asp:TextBox ID="TextBox1" runat="server" type="number" ></asp:TextBox>


        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
        <br />
        
        

    </div>
    <hr />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="GridView1_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
        <Columns>
             <asp:CommandField HeaderText="Select Product" ShowHeader="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ProductID" HeaderText="Product ID" DataFormatString="P{0:0000}" SortExpression="ProductID" />
            
            <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
            
            <asp:BoundField DataField="Quantity" HeaderText="Product Quantity" SortExpression="Quantity" />
            
            <asp:BoundField DataField="SellingPrice" HeaderText="Purchase Price" SortExpression="SellingPrice" />
            
           
            <asp:BoundField DataField="Warranty" HeaderText="Product Warranty" SortExpression="Warranty" />
           
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

    <br />
    <hr />

    <div class="form">
        <br />

        <fieldset>
            <legend>Sales Details</legend>
<table style="width: 100%;">


        <tr>
            <td>Product ID :</td>
            <td><asp:TextBox ID="txtPid" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>
        <tr>
            <td>Product Name :</td>
            <td><asp:TextBox ID="txtPname" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>
        <tr>
            <td>Purchase Price :</td>
            <td><asp:TextBox ID="txtPrice" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>

        <tr>
            <td>Supplier :</td>
            <td><asp:DropDownList ID="DropDownList1" DataTextFormatString="I{0:0000}" runat="server" DataSourceID="LinqDataSource1" DataTextField="supplierId" DataValueField="supplierId" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (supplierId)" TableName="suppliers">
                </asp:LinqDataSource>
            </td>
          
        </tr>

     <tr>
            <td>Supplier Name :</td>
            <td><asp:TextBox ID="txtSname" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>

        <tr>
            <td>Quantity To Restock :</td>
            <td><asp:TextBox ID="txtQty" runat="server"></asp:TextBox></td>
          
        </tr>
    <tr>

        <td></td>
        <td><asp:Button ID="Button2" runat="server" Text="Update Stock" OnClick="Button2_Click" /></td>

    </tr>
   



        </table>
            </fieldset>
        
    </div>
       
</asp:Content>
   
