<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="Return.aspx.cs" Inherits="CWC_FurnitureSystem.Product.Return" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/return.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div id="addContent">

        <hr />

        <div class="formtop">

        </div>

        <div class="formdrop">

           
            <table style="width: 100%;">

                <tr>
                    <td class="auto-style1">Sales ID :</td>
                    <td><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource1"  DataTextField="salesId" DataValueField="salesId" DataTextFormatString="S{0:0000}" ></asp:DropDownList>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server"  ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (salesId)" TableName="salesOrders" >
                        </asp:LinqDataSource>
                    </td>
                   
                </tr>
               
                <tr>
                    <td class="auto-style1">Product ID :</td>
                    <td><asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="LinqDataSource2"  DataTextField="productId" DataValueField="productId" DataTextFormatString="P{0:0000}"></asp:DropDownList>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (productId)" TableName="products">
                        </asp:LinqDataSource>
                    </td>
               
                </tr>
               
              
                        
                    

            </table>

            <br />

            <div class="button1">
           <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click"/>
                </div>

        </div>
         <hr />
        <br />
        <br />

        <div class ="form">

            <fieldset>
                <legend>Product Details</legend>
            <table style="width: 100%;">
                <tr>
                    <td>Product Name :</td>
                    <td><asp:Label ID="lblname" runat="server"></asp:Label></td>
                   
                </tr>
                <tr>
                    <td>Purchase Quantity :</td>
                    <td><asp:Label ID="lblqty" runat="server" ></asp:Label></td>
               
                </tr>
                <tr>
                    <td>Purchase Price:</td>
                    <td><asp:Label ID="lblunit" runat="server" ></asp:Label></td>
               
                </tr>
                <tr>
                    <td>Total Price:</td>
                    <td><asp:Label ID="lbltotal" runat="server"></asp:Label></td>
               
                </tr>
                <tr>
                    <td>Purchae Date:</td>
                    <td><asp:Label ID="lbldate" runat="server"></asp:Label></td>
               
                </tr>
                <tr>
                    <td>Warranty :</td>
                    <td><asp:Label ID="lblwar" runat="server"></asp:Label></td>
               
                </tr>
            
       
            </table>
            </fieldset>

            <br />
            <fieldset>
                <legend>Staff Descriptions</legend>
            <table style="width:100%" >

                 <tr>
                    <td>Staff ID :</td>
                    <td>
                        <asp:Label ID="lblStaff" runat="server" Text="Label"></asp:Label>
                     </td>
                
                <tr>
                    <td>Product Problems :</td>
                    <td>
                        <asp:TextBox ID="descArea" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="descArea" ErrorMessage="Please Fill In The Problems"></asp:RequiredFieldValidator>
                    </td>

                     
               
                </tr>

                </tr>

            </table>
                </fieldset>


            <br />
            <div class="button">
                    <asp:Button ID="returnBtn" runat="server" Text="Return Stock" OnClick="returnBtn_Click" />
               
            </div>
            <br />
            <br />

        </div>



    </div>



</asp:Content>
