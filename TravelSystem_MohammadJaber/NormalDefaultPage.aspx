<%@ Page Title="" Language="C#" MasterPageFile="~/Shared.Master" AutoEventWireup="true" CodeBehind="NormalDefaultPage.aspx.cs" Inherits="TravelSystem_MohammadJaber.NormalDefaultPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>  

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="font-size: 25px">Welcome Mr. <asp:Label ID="Label1" runat="server"></asp:Label></h1>
    <hr /><h1 style="text-align: center">View All Travels You Reserved</h1><hr />
    <br /><br />
    <div class="normalDefault">
        <asp:Button ID="btnAdd" runat="server" Text="Reserve Another Travel" Width="250px" Font-Size="larger" OnClick="btnAdd_Click"/>
    </div>
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" 
            BorderStyle="None" BorderWidth="1px" CellPadding="10" GridLines="Vertical" AutoGenerateColumns="true">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" runat="server" Text="Cancel" ></asp:LinkButton>
                        <ajax:ModalPopupExtender ID="CancelPopupMdl" runat="server" PopupControlID="CancelPopupPanel" TargetControlID="lnkEdit"  
                            CancelControlID="BtnClose" BackgroundCssClass="Background">  
                        </ajax:ModalPopupExtender>  
                        <asp:Panel ID="CancelPopupPanel" runat="server" CssClass="Popup" align="center">  
                        <%--<iframe style=" width: 350px; height: 300px;" id="irm1" src="CancelTravel.aspx" runat="server"></iframe>--%>
                            <asp:Label Id="label" runat="server" Text="Cancel Reason Message"  CssClass="BoxLabel"></asp:Label>
                            <asp:TextBox Id="txtMessage" runat="server" ValidationGroup="ok"></asp:TextBox>
                            <div class="divbtns">
                            <br/>  
                            <asp:Button Id="btnCancel" runat="server" Text="Cancel" CssClass="btns" OnClick="btnCancel_Click" ValidationGroup="ok" />
                            <br/> 
                            <asp:Button ID="BtnClose" runat="server" Text="Close" CssClass="btns"/>  
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--It Does Not Work--%>
                <%--<asp:BoundField  DataField="TravelId" HeaderText="Travel Id" />--%>
	            <%--<asp:BoundField  DataField="FromCountry" HeaderText="From Country" />
                <asp:BoundField  DataField="ToCountry" HeaderText="To Country" />
                <asp:BoundField  DataField="CurrencyISO" HeaderText="Currency ISO" />
                <asp:BoundField  DataField="TravelTime" HeaderText="Travel Time" />
                <asp:BoundField  DataField="TravelPrice" HeaderText="Travel Price" />
                <asp:BoundField  DataField="PassengersCount" HeaderText="Passengers Count" />
                <asp:BoundField  DataField="Status" HeaderText="Status" />
                <asp:BoundField  DataField="Message" HeaderText="Message" />--%>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>
</asp:Content>
