<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="addOrderOffline.aspx.cs" Inherits="CWC_FurnitureSystem.Order.offline.addOrderOffline" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/styleOffline.css" rel="stylesheet" type="text/css" />
    <link href="css/modalCss.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function checkAddress1(source, arguments) {
            var txt = document.getElementById('<%= TextBox2.ClientID %>').value;
            if (txt == undefined || txt == "") {
                arguments.IsValid = false;
            } else {
                arguments.IsValid = true;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="addOfflineContent">
    <div class="top">
        <hr/>
        <table style="width: 100%;">
            <tr>
                <td><b>Sales Date:</b> <asp:Label ID="lblDate" runat="server" Text="11/11/2015"></asp:Label></td>
                <td><b>Customer:</b> <asp:DropDownList ID="ddlCust" runat="server" >
                    <asp:ListItem>C0001</asp:ListItem>
                    <asp:ListItem>C0002</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><b>Payment Type:</b> <asp:DropDownList ID="ddlType" runat="server">
                    <asp:ListItem>Full Payment</asp:ListItem>
                    <asp:ListItem>Installment Payment</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td><b>Staff:</b> <asp:LoginName ID="LoginName1" runat="server"/></td>
            </tr>
       </table>
        <hr/>
    </div>
            
    <div class="addOfflineMainContent">
        <asp:UpdatePanel ID="updatePanel3" runat="server">
                <ContentTemplate>
    <div id="tableMain">
    
   <asp:GridView ID="GridView1" AutoGenerateColumns="false" Width="100%" OnPageIndexChanging="OnPaging" runat="server" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
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
           <asp:CommandField ShowSelectButton="True" />
       <asp:TemplateField HeaderText = "No" ItemStyle-Width="40">
            <ItemTemplate>
                <asp:Label ID="lblRowNumber" Text='<%# Container.DataItemIndex + 1 %>' runat="server" />
            </ItemTemplate>

        <ItemStyle Width="40px"></ItemStyle>
       </asp:TemplateField>
           <asp:BoundField DataField="Product ID" HeaderText="Product ID" SortExpression="Product ID" />
           <asp:BoundField DataField="Product Name" HeaderText="Product Name" SortExpression="Product Name" />
           <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
           <asp:BoundField DataField="Unit Price(RM)" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="Unit Price(RM)" SortExpression="Unit Price(RM)" />
           <asp:BoundField DataField="Amount(RM)" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" HeaderText="Amount(RM)" SortExpression="Amount(RM)" />
        </Columns>
       </asp:GridView>

        </div>

    <div id="totalAmount">
        <table>
            <tr>
                <td><b>Total Amount(RM):</b></td>
                <td><asp:TextBox ID="txtTotal" runat="server" CssClass="txtTotal" Enabled="false" Text=""></asp:TextBox></td>
            </tr>
            
        </table>
         </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAddItem" EventName="CLick"/>
                    <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                </Triggers>
                </asp:UpdatePanel>
    </div>
    </div>
    <div id="buttonGroup">
        <asp:Button ID="btnAdd" Text="Add Item" runat="server" OnClick="btnAdd_Click" CausesValidation="false"/>
        <asp:Button ID="btnDelete" runat="server" Text="Delete Item" OnClick="btnDelete_Click" CausesValidation="false"/>
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm" OnClick="btnConfirm_Click" CausesValidation="false"/>
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:HiddenField ID="hdnField" runat="server" />
        <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="hdnField"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
    
        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style= "display:none">
        
        <div class="header">
            Add Item
        </div>
        <div id="modalContent">
            <div id="productImg">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Product/images/mirror/ShazMirror.jpg" Width="200px" Height="200px"/>
            </div>
            <div id="productContent">
                <table style="width: 100%;">
                    <tr>
                        <td>Product ID: </td>
                        <td><asp:DropDownList ID="ddlProductID" runat="server" DataTextFormatString="P{0:0000}" OnSelectedIndexChanged="ddlProductID_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><asp:DropDownList ID="ddlQty" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td>Product Name: </td>
                        <td><asp:TextBox ID="txtName" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Price: </td>
                        <td><asp:TextBox ID="txtPrice" runat="server" Enabled="false"></asp:TextBox></td>
                        <asp:HiddenField ID="price" runat="server" />
                    </tr>
                    <tr>
                        <td>Category: </td>
                        <td><asp:TextBox ID="txtCategory" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Warranty: </td>
                        <td><asp:TextBox ID="txtWarranty" runat="server" Enabled="false"></asp:TextBox></td>
                    </tr>
                </table>
            </div>
            
            <div class="buttonAddItem">
                <asp:Button ID="btnAddItem" Text="Add Item" OnClick="btnAddItem_Click" runat="server" CausesValidation="false"/> 
                <asp:Button ID="btnClose" Text="Close" runat="server" CausesValidation="false"/>
                
            </div>
        </div>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger controlid="btnAdd" eventname="Click" />
            <asp:AsyncPostBackTrigger controlid="ddlProductID" eventname="SelectedIndexChanged" />
        </Triggers>
        </asp:UpdatePanel>
        
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel2" TargetControlID="HiddenField1"
        CancelControlID="btnClose1" BackgroundCssClass="modalBackground">
        </cc1:ModalPopupExtender>
    
        <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup1" align="center" style= "display:none">
            <div class="header">
            Payment Confirmation
            </div>
            <div id="paymentContent">
                <fieldset>
                    <legend>Payment Details</legend>
                <table>
                    <tr>
                        <td><b>Total Amount(RM):</b></td>
                        <td><asp:TextBox ID="txtTotalAmount" runat="server" CssClass="txtTotal" Enabled="false" Text="RM 100.00"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><b>Amount to be Paid(RM):</b></td>
                        <td><asp:TextBox ID="txtPaid" runat="server" CssClass="txtTotal" Enabled="false" Text="RM 100.00"></asp:TextBox></td>
                        <asp:HiddenField ID="paidPrice" runat="server" />
                    </tr>
                    <tr>
                        <td><b>Amount Received(RM):</b></td>
                        <td><asp:TextBox ID="txtReceived" TextMode="Number" runat="server" CssClass="txtTotal" Text=""></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtReceived" runat="server" ErrorMessage="Amount Received is required">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td><b>Change(RM):</b></td>
                        <td><asp:TextBox ID="txtChange" runat="server" CssClass="txtTotal" Enabled="false"></asp:TextBox><asp:CompareValidator ID="changeValidator" runat="server" ErrorMessage="Money received is not enough" ControlToValidate="txtReceived" Type="Double" ControlToCompare="txtPaid" Operator="GreaterThanEqual">*</asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <td><b>Delivery Service:</b></td>
                        <td>
                            <asp:RadioButtonList ID="rblDelivery" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True">Yes</asp:ListItem>
                                <asp:ListItem>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    
                </table>
                </fieldset>
            </div>

            <div id="shippingContent">
                <fieldset>
                    <legend>Shipping Details</legend>
                <table>
                    <tr>
                        <td><b>Address1:</b></td>
                        <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="TextBox2" runat="server" ErrorMessage="Address1 cannot be empty" OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator></td>
                    </tr>
                    <tr>
                        <td><b>Address2:</b></td>
                        <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><b>City:</b></td>
                        <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator2" ControlToValidate="TextBox1" runat="server" ErrorMessage="City cannot be empty" OnServerValidate="CustomValidator2_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><b>Postal Code:</b></td>
                        <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator3" ControlToValidate="TextBox4" runat="server" ErrorMessage="Postal Code cannot be empty" OnServerValidate="CustomValidator3_ServerValidate" ValidateEmptyText="True">*</asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td><b>State:</b></td>
                        <td>
                            <asp:DropDownList ID="ddlState" runat="server">
                                <asp:ListItem Selected="True" Text="WP Kuala Lumpur"></asp:ListItem>
                                <asp:ListItem Text="Johor"></asp:ListItem>
                                <asp:ListItem Text="Kedah"></asp:ListItem>
                                <asp:ListItem Text="Kelantan"></asp:ListItem>
                                <asp:ListItem Text="Melaka"></asp:ListItem>
                                <asp:ListItem Text="Negeri Sembilan"></asp:ListItem>
                                <asp:ListItem Text="Pahang"></asp:ListItem>
                                <asp:ListItem Text="Perak"></asp:ListItem>
                                <asp:ListItem Text="Perlis"></asp:ListItem>
                                <asp:ListItem Text="Pulau Pinang"></asp:ListItem>
                                <asp:ListItem Text="Sabah"></asp:ListItem>
                                <asp:ListItem Text="Sarawak"></asp:ListItem>
                                <asp:ListItem Text="Selangor"></asp:ListItem>
                                <asp:ListItem Text="Terengganu"></asp:ListItem>
                                <asp:ListItem Text="WP Labuan"></asp:ListItem>
                                <asp:ListItem Text="WP Putrajaya"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                </fieldset>
                
            </div>
            <asp:ValidationSummary ID="ValidationSummary1" ShowMessageBox="true" runat="server" ShowSummary="False" />
            <div class="buttonAddItem">
                
                <asp:Button ID="btnCalculate" Text="Calculate Change" runat="server" CausesValidation="false" OnClick="btnCalculate_Click"/> 
                <asp:Button ID="btnConfirm1" Text="Confirm" runat="server" OnClick="btnConfirm1_Click"/> 
                <asp:Button ID="btnClose1" Text="Close" runat="server" CausesValidation="false"/>
            </div>
        </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnConfirm1" EventName="Click" />
           <asp:AsyncPostBackTrigger controlid="btnConfirm" eventname="Click" />
           <asp:AsyncPostBackTrigger controlid="btnCalculate" eventname="Click" />
        </Triggers>
        </asp:UpdatePanel>

</asp:Content>
