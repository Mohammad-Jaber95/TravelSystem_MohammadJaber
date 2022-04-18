<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="AdminDefaultPage.aspx.cs" Inherits="TravelSystem_MohammadJaber.AdminDefaultPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Hello Mr. Admin ...</h3>
    <hr />
    <h1 style="text-align: center">View All Travels</h1>
    <hr /><br /><br />
    <div class="add">
        <asp:Button ID="btnAdd" runat="server" Text="Add Travel" OnClick="btnAdd_Click" Width="130px"/>
    </div>
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="10" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("TravelId") %>' OnClick="lnkEdit_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkReservation" runat="server" Text="Reservations" CommandArgument='<%# Eval("TravelId") %>' OnClick="lnkReservation_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
</asp:Content>
