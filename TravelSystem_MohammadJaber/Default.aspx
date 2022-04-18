<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TravelSystem_MohammadJaber.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="diView">Welcome To International Travel Company</div>
    <hr />
    <br /><br />
    <div class="defaultpage">
    <asp:Button ID="Button1" runat="server" Text="SignUp" OnClick="Button1_Click"/><br /><br />
    <asp:Button ID="Button3" runat="server" Text="SignIn Users" OnClick="Button3_Click" />
    </div>
</asp:Content>
