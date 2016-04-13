<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="viewCart.ascx.cs" Inherits="CWC_FurnitureSystem.Order.online.viewCart" %>

<script type="text/javascript">
    function viewCartForm() {
        var x = document.getElementById("form1");
        x.action = "https://www.sandbox.paypal.com/cgi-bin/webscr";
        x.target = "paypal";
        x.submit();
        setTimeout(function () {
            x.action = "";
            x.target = "";

        }, 2000);
        
    }
</script>

<form target="paypal" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="business" value="jianhanl-facilitator@hotmail.com">
    <input type="hidden" name="cmd" value="_cart">
    <input type="hidden" name="display" value="1">
    <input type="image" border="0" onmouseup="viewCartForm()"
        src="https://www.paypalobjects.com/en_US/i/btn/btn_viewcart_LG.gif"
       alt="PayPal - The safer, easier way to pay online">
    <img alt="" border="0" width="1" height="1"
        src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >
</form>