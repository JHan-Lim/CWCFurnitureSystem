<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="ViewProduct.aspx.cs" Inherits="CWC_FurnitureSystem.Order.online.ViewProduct" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register TagPrefix="uc" TagName="Cart" Src="~/Order/online/viewCart.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link type="text/css" rel="stylesheet" href="css/styleOnline.css"/>
    <link href="../offline/css/modalCss.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function setQty(qty,index) {
            document.getElementsByName("quantity")[index].value = qty;
        }
    </script>
    <style type="text/css">
      .productImgDL{
          float:left;
      }

      .productContentDL{
          float:left;
      }

      .buttonAddItem{
          float:right;
          margin-top:20px
      }

      pre {
        white-space: pre-wrap;       /* CSS 3 */
        white-space: -moz-pre-wrap;  /* Mozilla, since 1999 */
        white-space: -pre-wrap;      /* Opera 4-6 */
        white-space: -o-pre-wrap;    /* Opera 7 */
        word-wrap: break-word;       /* Internet Explorer 5.5+ */
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="viewProductPage">
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
                    <td class="title">Product Name: </td>
                    <td>
                        <asp:TextBox ID="txtProductName" runat="server" Columns="10"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="title">Product Category: </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>

        <div id="table2">
        <table class="leftTable">
            <tr>
                <td class="title">Description: </td>
                <td>
                    <asp:TextBox ID="txtDescSearch" runat="server" Columns="15"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td class="title">Warranty: </td>
               <td>
               <asp:DropDownList ID="ddlWarranty" runat="server"></asp:DropDownList>
               </td>
            </tr>
        </table>
        </div>

        <div id="table3">
        <table class="leftTable">
            <tr>
                <td class="title">Product Price(RM): </td>
                <td colspan="3">
                    <asp:TextBox ID="txtMin" runat="server" CssClass="shortText" TextMode="Number"></asp:TextBox>
                    To
                    <asp:TextBox ID="txtMax" runat="server" CssClass="shortText" TextMode="Number"></asp:TextBox>
                </td>
            </tr>
        </table>
        </div>
        </td>
            </tr>
        </table>
    
    </div>
            </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click"/>
        </Triggers>
    </asp:UpdatePanel>
    
    <div id="searchButton">
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
        <asp:Button ID="btnReset" runat="server" OnClick="btnReset_Click" Text="Reset" />
    </div>
        <br/>
    <hr/>
    </div>
    <span style="margin-left:20px"><uc:Cart runat="server" id="viewCart"/></span>
    <div>
       <br/>
    </div>

    <div id="viewProductContent">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="productId" onitemdatabound="dl_ItemDataBound" RepeatColumns="3" RepeatDirection="Horizontal" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingItemStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedItemStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                <asp:HiddenField ID="productId" runat="server" Value='<%# Eval("productId") %>'/>
                <asp:ImageButton ID="imgProduct" OnClick="imgBtnClick" runat="server" AlternateText="Image Unavailable" Width="250" Height="250" ImageUrl='<%# Eval("url") %>'/>
                
                <hr/>
                <asp:Label ID="lblName" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                <br/>
                <span style="float:right">
                RM <asp:Label ID="lblPrice" runat="server" Text='<%# String.Format("{0:f2}",Eval("sellingPrice")) %>'></asp:Label>
                </span>
                <br/>
                <hr/>
                
                <div>
                    Quantity: <asp:DropDownList ID="ddlQty" AutoPostBack="true" OnSelectedIndexChanged="ddlQtySelectedIndex" runat="server"></asp:DropDownList>
                </div>

                <!--this updatePanel is to update form quantity field when ddl selectedIndex change 
                    and show modal popup when imagebutton is clicke-->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers><asp:AsyncPostBackTrigger ControlID="ddlQty" EventName="SelectedIndexChanged"/>
                </Triggers>
                </asp:UpdatePanel>
                <!------------------------------------------------------------------------------------->
        
                <div style="float:right">
                <form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="on0" value="Payment Type">
                    <select name="os0" hidden="hidden">
	                <option value="Partial Payment"></option>
                    </select>
                <input type="hidden" name="business" value="jianhanl-facilitator@hotmail.com"/>
                <input type="hidden" name="cmd" value="_cart"/>
                <input type="hidden" name="add" value="1"/>
                <input type="hidden" name="item_name" value='<%# Eval("productName") %>'/>
                <input type="hidden" name="item_number" value='<%# Eval("productId") %>'/>
                <input type="hidden" name="amount" value='<%# String.Format("{0:f2}",Eval("partial")) %>'/>
                <input type="hidden" name="currency_code" value="MYR"/>
                <input type="hidden" name="quantity" id="hdnQty" value="1" />
                <input type="hidden" name="return" value="http://localhost:53573/Order/online/onlineReceipt.aspx"/>
                <input type="hidden" name="cancel_return" value="http://localhost:53573/Order/online/ViewProduct.aspx"/>
                <input type="image" name="submit" border="0" src="https://www.paypal.com/en_US/i/btn/btn_cart_LG.gif" alt="PayPal - The safer, easier way to pay online"/>
                <img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif" />
                </form>
                
                </div>

                <div id="popup">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                    <asp:HiddenField ID="hdnField" runat="server" />
                    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="hdnField"
                    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
    
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup3" align="center" style= "display:none">
        
                    <div class="header">
                        Item Details
                    </div>
                    <div id="modalContent">
                        <div class="productImgDL">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Product/images/mirror/ShazMirror.jpg" Width="200px" Height="200px"/>
                        </div>
                        <div class="productContentDL" style="width:70%;margin-left:10px">
                            <table style="width: 100%;" border="1">
                                <tr>
                                    <td class="title">Name </td>
                                    <td>: <asp:Label ID="txtName" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="title">Price </td>
                                    <td>: RM <asp:Label ID="txtPrice" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="title">Category </td>
                                    <td>: <asp:Label ID="txtCategory" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="title">Warranty </td>
                                    <td>: <asp:Label ID="txtWarranty" runat="server"></asp:Label> year</td>
                                </tr>
                                <tr>
                                    <td class="title">Description </td>
                                    <td><asp:Label ID="txtDesc" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
            
                        <div class="buttonAddItem" style="margin-bottom:10px"> 
                            <asp:Button ID="btnClose" Text="Close" runat="server"/>
                
                        </div>
                    </div>
                    </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger controlid="imgProduct" eventname="Click" />
                    </Triggers>
                    </asp:UpdatePanel>
                    </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

</asp:Content>
