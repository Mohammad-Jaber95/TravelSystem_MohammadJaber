<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="TravelSystem_MohammadJaber.SignIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div class="row">
        <asp:ValidationSummary runat="server" ValidationGroup="done"></asp:ValidationSummary>
    </div>
    <table align="center">
        <tr>
            <td><h2>Email</h2></td>
            <td><asp:TextBox Id="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name Is Required" ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="done">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Must As m@m.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="done">Error Format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td><h2>Password</h2></td>
            <td><asp:TextBox Id="txtPassLog" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password  Field Is Required" ControlToValidate="txtPassLog" ForeColor="Red" ValidationGroup="done">*</asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <div class="btnsign">
        <asp:Button ID="btnSignIn" runat="server" Text="Sign In" ValidationGroup="done"  Width="125px" OnClick="btnSignIn_Click"/>
    </div>
    <div class="btnsign">
        <asp:Button ID="btnBack" runat="server" Text="Back" Width="125px" OnClick="btnBack_Click"/>
    </div>
</asp:Content>
