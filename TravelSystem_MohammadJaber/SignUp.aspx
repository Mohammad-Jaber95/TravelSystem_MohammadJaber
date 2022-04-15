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
        .auto-style2 {
            width: 219px;
        }
        .auto-style3 {
            height: 72px;
            width: 219px;
        }
    </style>
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div class="row">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ValidationGroup="ok" />
    </div>
    <table align ="center" style="width: 700px">
        <tr>
            <td>CivilId</td>
            <td class="auto-style2"><asp:TextBox ID="txtCivil" runat="server" PlaceHolder="enter your CivilId .." ValidationGroup="ok" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="CivilId Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtCivil">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Must Contain 10 Numbers" ValidationExpression="[0-9]{10}" ControlToValidate="txtCivil" Font-Size="Medium" ForeColor="Red" ValidationGroup="ok">Error Format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Full Name</td>
            <td class="auto-style2"><asp:TextBox ID="txtName" runat="server" PlaceHolder="enter your name .." ValidationGroup="ok" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Age</td>
            <td class="auto-style2"><asp:TextBox ID="txtAge" runat="server" PlaceHolder="enter your age .." ValidationGroup="ok" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Age Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtAge">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td class="auto-style2"><asp:TextBox ID="txtEmail" runat="server" PlaceHolder="example@example.com" ValidationGroup="ok" TextMode="Email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Feild Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="The Format Must Be Like a@a.com" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" Font-Size="Medium" ForeColor="Red">Error Format</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td class="auto-style2"><asp:TextBox ID="txtPhone" runat="server" PlaceHolder="enter your phone number .." ValidationGroup="ok" MaxLength="10" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Phone Number Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtPhone">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td class="auto-style2"><asp:TextBox ID="txtAddress" runat="server" PlaceHolder="Country, City, Street" ValidationGroup="ok" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtAddress">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Password</td>
            <td class="auto-style3"><asp:TextBox ID="txtPass" runat="server" PlaceHolder="enter your password .." ValidationGroup="ok" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Password Field Is Required" ForeColor="Red" ValidationGroup="ok" ControlToValidate="txtPass">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td class="auto-style2"><asp:TextBox ID="txtConfPass" runat="server" PlaceHolder="enter your password again .." ValidationGroup="ok" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Password Is Not Matched" ForeColor="Red" ValidationGroup="ok" ControlToCompare="txtPass" ControlToValidate="txtConfPass">Error</asp:CompareValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style2"><asp:Button ID="Button1" runat="server" Text="Register" ValidationGroup="ok" OnClick="btnReg_Click" Width="125px"/></td>
        </tr>
        <tr>
            <td></td>
            <td class="auto-style2"><asp:Button ID="Button2" runat="server" Text="Back" OnClick="btnBack_Click" Width="123px"/></td>
        </tr>
    </table>
</asp:Content>
