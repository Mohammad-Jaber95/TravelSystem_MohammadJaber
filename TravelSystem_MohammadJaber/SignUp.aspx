<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TravelSystem_MohammadJaber.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 72px;
        }
        .row > * {
    flex-shrink: 0;
    width: 100%;
    max-width: 100%;
    padding-right: calc(var(--bs-gutter-x) * .5);
    padding-left: calc(var(--bs-gutter-x) * .5);
    margin-top: var(--bs-gutter-y);
    margin: 4px;
    margin-left: 184px;
}
    </style>
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div class="row">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ValidationGroup="ok" />
    </div>
    <table align ="center">
        <tr>
            <td>Full Name</td>
            <td><asp:TextBox ID="txtName" runat="server" PlaceHolder="enter your name .." ValidationGroup="ok"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Age</td>
            <td><asp:TextBox ID="txtAge" runat="server" PlaceHolder="enter your age .." ValidationGroup="ok"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Age Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtAge">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><asp:TextBox ID="txtEmail" runat="server" PlaceHolder="example@example.com" ValidationGroup="ok" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Feild Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><asp:TextBox ID="txtPhone" runat="server" PlaceHolder="enter your phone number .." ValidationGroup="ok" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td><asp:TextBox ID="txtAddress" runat="server" PlaceHolder="Country, City, Street" ValidationGroup="ok"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Password</td>
            <td class="auto-style1"><asp:TextBox ID="txtPass" runat="server" PlaceHolder="enter your password .." ValidationGroup="ok" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtPass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td><asp:TextBox ID="txtConfPass" runat="server" PlaceHolder="enter your password again .." ValidationGroup="ok" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Password Is Not Matched" ForeColor="Red" ValidationGroup="ok" ControlToCompare="txtPass" ControlToValidate="txtConfPass">Error</asp:CompareValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>User Type</td>
            <td>
                <asp:RadioButton ID="RadioButton1" GroupName="user" runat="server" Text="Admin" ValidationGroup="ok"/>
                <asp:RadioButton ID="RadioButton2" GroupName="user" runat="server" Text="Normal" ValidationGroup="ok"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn-outline-success" ValidationGroup="ok" OnClick="btnReg_Click"/></td>
        </tr>
    </table>
</asp:Content>
