<%@ Page Title="" Language="C#" MasterPageFile="~/Master/CWC.Master" AutoEventWireup="true" CodeBehind="DeleteFeedback.aspx.cs" Inherits="CWC_FurnitureSystem.Feedback.DeleteFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" type="text/css" href="css/deleteStyle.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div id="addContent">
<hr/>

    <div class="formtop">
        <h3>Select Feedback ID To Be Delete</h3>
         </div>

    <div class="formdrop">
        
        Feedback ID : 
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1" DataTextField="feedbackId" DataValueField="feedbackId"  DataTextFormatString="D{0:0000}"></asp:DropDownList>

        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="CWC_FurnitureSystem.DataClasses1DataContext" EntityTypeName="" Select="new (feedbackId)" TableName="feedbacks">
        </asp:LinqDataSource>
        <asp:Button ID="search" runat="server" Text="Search" OnClick="search_Click" />

    </div>
        <hr />
        <br />

        <div class ="form">


            <fieldset>
            <legend>Feedback Details</legend>
            <table style="width: 100%;">
                <tr>
                    <td>Feedback Date :</td>
                    <td><asp:TextBox ID="txtdate" runat="server" ReadOnly="true" Enabled="false"></asp:TextBox></td>

                </tr>
                <tr>
            <td>Feedback Content :</td>
            <td><asp:TextBox ID="Dcontenttxt" readonly="true" runat="server" Enabled="false"></asp:TextBox></td>
          
        </tr>
            <td>Feedback Status :</td>
            <td><asp:TextBox ID="Dstatustxt" runat="server" readonly="true" Enabled="false"></asp:TextBox></td>
        </tr>
            
                 <tr>
            <td></td>
            <td><asp:Button ID="Button1" runat="server" Text="Delete" OnClick="AddSubmit1_Click" OnClientClick="return confirm('Are you sure you want to delete ?')"/>
            </td>
         
        </tr>


            </table>
                </fieldset>


        </div>
</div>

</asp:Content>
