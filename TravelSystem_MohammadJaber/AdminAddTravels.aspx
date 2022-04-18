<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="AdminAddTravels.aspx.cs" Inherits="TravelSystem_MohammadJaber.AdminViewTravels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h1 style="text-align: center">Add Travels</h1>
    <hr />
    <br /><br /><br />
        <table align="center">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="From Country"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="txtBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBox1" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="To Country"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="txtBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBox2" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label3" runat="server" Text="Currency ISO"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="txtISO" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtISO" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="Travel Time"></asp:Label></td>
                <td colspan="2"><input type="date" name="Date" id="txtTime" runat="server" class="hasDatepicker"/><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTime" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="Travel Price"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Passengers Count"></asp:Label></td>
                <td colspan="2"><asp:TextBox ID="txtCount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCount" ForeColor="Red" ValidationGroup="add">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div class="divbtn1">
            <br />
            <asp:Button ID="btnAdd" runat="server" Text="Add Travel" OnClick="btnAdd_Click" Width="160px" Height="60px" ValidationGroup="add" />
        </div>
</asp:Content>
