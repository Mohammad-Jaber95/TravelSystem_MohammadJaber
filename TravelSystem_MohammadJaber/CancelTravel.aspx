<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="CancelTravel.aspx.cs" Inherits="TravelSystem_MohammadJaber.CancelTravel" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="utf-8">
    <link href="Contents/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Contents/Style.css" rel="stylesheet" />
    <script src="Contents/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server">
            </asp:ScriptManager>
        <div align="center">
            <asp:Label Id="label" runat="server" Text="cancel Reason Message"Font-Size="X-Large" Font-Bold="True" ForeColor="White"></asp:Label>
            <asp:TextBox Id="txtMessage" runat="server" ValidationGroup="ok"></asp:TextBox>
            <br />
        </div><br />
        <div align="center">
            <asp:Button Id="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" ValidationGroup="ok" />
        </div>
    </form>
</body>
</html>